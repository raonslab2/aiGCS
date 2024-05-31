
$(document).ready(function() {
    class RectangleCreator {
        constructor(map) {
            this.map = map;
            this.poly = null;
            this.gridLayers = [];
            this.gridSizeValue = $('#gridSizeValue');
            this.gridSizeSlider = $('#gridSizeSlider');
            this.distanceDisplay = $('#distanceDisplay');
            this.startMarker = null;
            this.endMarker = null;
        }

        createRectangle() {
            const center = this.map.getCenter();
            const centerLat = center.lat;
            const centerLng = center.lng;
            const latOffset = 130 / 111320;
            const lngOffset = 170 / (111320 * Math.cos(centerLat * (Math.PI / 180)));

            const topLeft = [centerLat + latOffset, centerLng - lngOffset];
            const topRight = [centerLat + latOffset, centerLng + lngOffset];
            const bottomRight = [centerLat - latOffset, centerLng + lngOffset];
            const bottomLeft = [centerLat - latOffset, centerLng - lngOffset];

            this.poly = L.polygon([topLeft, topRight, bottomRight, bottomLeft], {
                fillColor: 'rgba(0, 128, 0, 0.7)',
                color: 'white',
                weight: 2
            }).addTo(this.map);

            this.poly.enableEdit();
            this.poly.on('dblclick', L.DomEvent.stop).on('dblclick', this.poly.toggleEdit);

            this.initGridAndPath();
            this.setupEventListeners();

            this.updateArea();
            this.addVertexAndMidpointHoverEffect();
        }

        isPointInPolygon(point) {
            const polyPoints = this.poly.getLatLngs()[0];
            const x = point.lat, y = point.lng;
            let inside = false;
            for (let i = 0, j = polyPoints.length - 1; i < polyPoints.length; j = i++) {
                const xi = polyPoints[i].lat, yi = polyPoints[i].lng;
                const xj = polyPoints[j].lat, yj = polyPoints[j].lng;

                const intersect = ((yi > y) !== (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
                if (intersect) inside = !inside;
            }
            return inside;
        }

        drawGridAndPathInPolygon(latStep, lngStep) {
            this.gridLayers.forEach(layer => this.map.removeLayer(layer));
            this.gridLayers = [];

            const bounds = this.poly.getBounds();
            let path = [];
            let gridLines = [];
            let isPathReversed = false;

            for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                let linePoints = [];
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    const point = new L.LatLng(lat, lng);
                    if (this.isPointInPolygon(point)) {
                        linePoints.push(point);
                    }
                }
                if (linePoints.length > 1) {
                    const gridLine = L.polyline(linePoints, { color: 'rgba(0, 0, 0, 0.2)', weight: 1 });
                    gridLines.push(gridLine);
                    this.gridLayers.push(gridLine);
                    if (isPathReversed) {
                        linePoints.reverse();
                    }
                    path = path.concat(linePoints);
                    isPathReversed = !isPathReversed;
                }
            }

            for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                let linePoints = [];
                for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                    const point = new L.LatLng(lat, lng);
                    if (this.isPointInPolygon(point)) {
                        linePoints.push(point);
                    }
                }
                if (linePoints.length > 1) {
                    const gridLine = L.polyline(linePoints, { color: 'rgba(0, 0, 0, 0.5)', weight: 1 });
                    gridLines.push(gridLine);
                    this.gridLayers.push(gridLine);
                }
            }

            gridLines.forEach(line => line.addTo(this.map));
            const pathLine = L.polyline(path, { color: 'white', weight: 2 });
            pathLine.addTo(this.map);
            this.gridLayers.push(pathLine);

            this.updateDistance(path);

            if (path.length > 0) {
                this.addStartAndEndMarkers(path[0], path[path.length - 1]);
            }

            this.updateArea();
        }

        updateArea() {
            const bounds = this.poly.getBounds();
            const latLngs = bounds.toBBoxString().split(",");
            const lat1 = parseFloat(latLngs[0]);
            const lng1 = parseFloat(latLngs[1]);
            const lat2 = parseFloat(latLngs[2]);
            const lng2 = parseFloat(latLngs[3]);
            const areaInSquareMeters = Math.abs((lat2 - lat1) * (lng2 - lng1));
            const areaInAcre = areaInSquareMeters * 0.000247105;
            $('#areaAarea').text('에이커: ' + areaInAcre.toFixed(2));
        }

        initGridAndPath() {
            const initialGridSize = parseInt(this.gridSizeSlider.val());
            this.gridSizeValue.text(initialGridSize);
            const latStep = 0.00009 * initialGridSize;
            const lngStep = 0.00009 * initialGridSize;

            this.drawGridAndPathInPolygon(latStep, lngStep);
        }

        setupEventListeners() {
            this.gridSizeSlider.on('input', () => {
                const gridSize = parseInt(this.gridSizeSlider.val());
                this.gridSizeValue.text(gridSize);
                const latStep = 0.00009 * gridSize;
                const lngStep = 0.00009 * gridSize;
                this.drawGridAndPathInPolygon(latStep, lngStep);
            });

            const redrawGridAndPath = () => {
                const gridSize = parseInt(this.gridSizeSlider.val());
                const latStep = 0.00009 * gridSize;
                const lngStep = 0.00009 * gridSize;
                this.drawGridAndPathInPolygon(latStep, lngStep);
            };

            this.poly.on('edit', redrawGridAndPath);
            this.poly.on('editable:vertex:dragend', redrawGridAndPath);
            this.poly.on('editable:dragend', redrawGridAndPath);
        }

        removePolygon() {
            if (this.poly) {
                this.map.removeLayer(this.poly);
                this.gridLayers.forEach(layer => this.map.removeLayer(layer));
                this.poly = null;
                this.gridLayers = [];
                this.updateDistance([]);
                this.removeMarkers();
                $('#areaAarea').text('에이커: 0');
            }
        }

        updateDistance(path) {
            let totalDistance = 0;
            for (let i = 1; i < path.length; i++) {
                totalDistance += path[i - 1].distanceTo(path[i]);
            }
            this.distanceDisplay.text(`${totalDistance.toFixed(2)} m`);
        }

        addStartAndEndMarkers(start, end) {
            this.removeMarkers();

            const startIcon = L.divIcon({
                className: 'custom-start-icon',
                html: '<div style="background-color: blue; width: 24px; height: 24px; border-radius: 50%;"></div>',
                iconSize: [24, 24]
            });

            const endIcon = L.divIcon({
                className: 'custom-end-icon',
                html: '<div style="background-color: red; width: 24px; height: 24px; border-radius: 50%;"></div>',
                iconSize: [24, 24]
            });

            this.startMarker = L.marker(start, { icon: startIcon }).addTo(this.map);
            this.endMarker = L.marker(end, { icon: endIcon }).addTo(this.map);
        }

        removeMarkers() {
            if (this.startMarker) {
                this.map.removeLayer(this.startMarker);
                this.startMarker = null;
            }
            if (this.endMarker) {
                this.map.removeLayer(this.endMarker);
                this.endMarker = null;
            }
        }

        addVertexAndMidpointHoverEffect() {
            const latlngs = this.poly.getLatLngs()[0];
            const map = this.map;

            latlngs.forEach((latlng) => {
                const vertex = L.circleMarker(latlng, {
                    radius: 5,
                    color: 'red',
                    fillColor: 'red',
                    fillOpacity: 1,
                    className: 'vertex'
                }).addTo(map);

                vertex.on('mouseover', function() {
                    this.setStyle({
                        radius: 7,
                        color: 'blue',
                        fillColor: 'blue',
                        weight: 2,
                        fillOpacity: 1,
                        className: 'vertex-hover'
                    });
                });

                vertex.on('mouseout', function() {
                    this.setStyle({
                        radius: 5,
                        color: 'red',
                        fillColor: 'red',
                        weight: 0,
                        fillOpacity: 1,
                        className: 'vertex'
                    });
                });
            });

            for (let i = 0; i < latlngs.length; i++) {
                const nextIndex = (i + 1) % latlngs.length;
                const midpointLatlng = L.latLng(
                    (latlngs[i].lat + latlngs[nextIndex].lat) / 2,
                    (latlngs[i].lng + latlngs[nextIndex].lng) / 2
                );

                const midpoint = L.circleMarker(midpointLatlng, {
                    radius: 5,
                    color: 'green',
                    fillColor: 'green',
                    fillOpacity: 1,
                    className: 'midpoint'
                }).addTo(map);

                midpoint.on('mouseover', function() {
                    this.setStyle({
                        radius: 7,
                        color: 'orange',
                        fillColor: 'orange',
                        weight: 2,
                        fillOpacity: 1,
                        className: 'midpoint-hover'
                    });
                });

                midpoint.on('mouseout', function() {
                    this.setStyle({
                        radius: 5,
                        color: 'green',
                        fillColor: 'green',
                        weight: 0,
                        fillOpacity: 1,
                        className: 'midpoint'
                    });
                });
            }
        }
    }

    var map = L.map('map', {editable: true}).setView([tmLat, tmLng], 18);

    map.on('editable:created', function(e) {
        var layer = e.layer;
        layer.enableEdit();
        layer.dragging.enable();
        layer.transform.enable({ rotation: true, scaling: false });
    });

    var satelliteLayer = L.tileLayer('https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', {
        maxZoom: 20,
        attribution: 'Map data &copy; <a href="https://www.google.com/maps">Google Maps</a>'
    }).addTo(map);

    var controls = new MapControls(map);
    controls.addDefaultControls();
    
    const rectangleCreator = new RectangleCreator(map);

    $('#rectangleButton').on('click', function() {
        rectangleCreator.removePolygon();
        rectangleCreator.createRectangle();
    });

    $('#resetButton').on('click', function() {
        rectangleCreator.removePolygon();
    });
    
    $("#gridSizeSlider").on("input", function() {
        var value = (this.value / 10).toFixed(1);
        $("#gridSizeValue").text(value);
    });
    
    // 슬라이더 값이 변경될 때 이벤트 핸들러 등록
    $('#droneAlt').on('input', function() {
        // 슬라이더의 현재 값을 가져오기
        var currentValue = $(this).val();
        // droneAltValue 요소의 텍스트 업데이트
        $('#droneAltValue').text(currentValue);
    });

    // 업로드 버튼 클릭 이벤트 핸들러 추가
    $('#exportButton').on('click', function() {
        var data = exportMapData(map);
        console.log(JSON.stringify(data, null, 2));
    });

    // 샘플 데이터를 불러오는 함수 호출 (테스트용)
    // loadMapData(map, sampleData); // sampleData는 JSON 형식의 데이터 객체
});

function exportMapData(map) {
    var data = {
        polygons: [],
        dronePaths: [], // 수정된 부분: paths를 dronePaths로 변경
        gridSize: parseInt($('#gridSizeSlider').val()), // 간격 정보
        droneAltitude: parseFloat($('#droneAlt').val()) // 고도 정보
    };

    map.eachLayer(function(layer) {
        if (layer instanceof L.Polygon) {
            var latlngs = layer.getLatLngs().map(polygon => polygon.map(latlng => ({ lat: latlng.lat, lng: latlng.lng })));
            var style = layer.options;
            data.polygons.push({ latlngs, style });
        } else if (layer instanceof L.Polyline && layer.options.color === 'white') {
            // 드론 이동 경로 저장 (하얀색 선)
            var latlngs = layer.getLatLngs().map(latlng => ({ lat: latlng.lat, lng: latlng.lng }));
            var style = layer.options;
            data.dronePaths.push({ latlngs, style }); // 수정된 부분: paths를 dronePaths로 변경
        }
    });

    return data;
}


function loadMapData(map, data) {
    data.polygons.forEach(polygonData => {
        var latlngs = polygonData.latlngs.map(polygon => polygon.map(latlng => L.latLng(latlng.lat, latlng.lng)));
        L.polygon(latlngs, polygonData.style).addTo(map);
    });
    data.paths.forEach(pathData => {
        var latlngs = pathData.latlngs.map(latlng => L.latLng(latlng.lat, latlng.lng));
        L.polyline(latlngs, pathData.style).addTo(map);
    });
    $('#gridSizeSlider').val(data.gridSize);
    $('#gridSizeValue').text(data.gridSize);
    $('#droneAlt').val(data.droneAltitude);
    $('#droneAltValue').text(data.droneAltitude);
}
