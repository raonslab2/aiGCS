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
            this.gridIntersections = []; // 가로줄 꺾이는 점을 저장하는 배열
            this.gridMarkers = []; // 교차점 마커를 저장하는 배열
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
            this.gridIntersections = []; // 초기화

            const bounds = this.poly.getBounds();
            let path = [];
            let gridLines = [];
            let isPathReversed = false;

            // 가로 격자선 그리기
            for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                let linePoints = [];
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    const point = new L.LatLng(lat, lng);
                    if (this.isPointInPolygon(point)) {
                        linePoints.push(point);
                        if (linePoints.length === 1 || linePoints.length > 1 && lng === bounds.getEast()) {
                            this.gridIntersections.push([point.lat, point.lng]);
                        }
                    }
                }
                if (linePoints.length > 1) {
                    const gridLine = L.polyline(linePoints, { color: '#00FF00', weight: 1 });
                    gridLines.push(gridLine);
                    this.gridLayers.push(gridLine);
                    if (isPathReversed) {
                        linePoints.reverse();
                    }
                    path = path.concat(linePoints);
                    isPathReversed = !isPathReversed;
                }
            }

            // 세로 격자선 그리기
            if ($('#checkMulti').is(':checked')) {
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    let linePoints = [];
                    for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                        const point = new L.LatLng(lat, lng);
                        if (this.isPointInPolygon(point)) {
                            linePoints.push(point);
                        }
                    }
                    if (linePoints.length > 1) {
                        const gridLine = L.polyline(linePoints, { color: '#00FF00', weight: 1 });
                        gridLines.push(gridLine);
                        this.gridLayers.push(gridLine);
                    }
                }
            }

            gridLines.forEach(line => line.addTo(this.map));
            const pathLine = L.polyline(path, { color: "#00FF00", weight: 1 });
            pathLine.addTo(this.map);
            this.gridLayers.push(pathLine);

            this.updateDistance(path);

            if (path.length > 0) {
                this.addStartAndEndMarkers(path[0], path[path.length - 1]);
            }

            this.updateArea();
            this.toggleGridMarkers(); // 교차점 마커 추가
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

            $('#checkCamera').on('change', () => {
                this.toggleGridMarkers();
            });

            $('#checkMulti').on('change', redrawGridAndPath); // checkMulti 변경 시 실시간 적용
        }

        removePolygon() {
            if (this.poly) {
                this.map.removeLayer(this.poly);
                this.gridLayers.forEach(layer => this.map.removeLayer(layer));
                this.poly = null;
                this.gridLayers = [];
                this.updateDistance([]);
                this.removeMarkers();
                this.removeGridMarkers(); // 기존 마커 제거
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
                    color: '#FFFFFF', // 여기에 이미지에서 추출한 색상 코드로 변경
                    fillColor: '#FFFFFF', // 여기에 이미지에서 추출한 색상 코드로 변경
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
                        color: '#FFFFFF', // 여기에 이미지에서 추출한 색상 코드로 변경
                        fillColor: '#FFFFFF', // 여기에 이미지에서 추출한 색상 코드로 변경
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

        addGridMarkers() {
            this.gridMarkers.forEach(marker => this.map.removeLayer(marker)); // 기존 마커 제거
            this.gridMarkers = []; // 마커 배열 초기화
            this.gridIntersections.forEach(([lat, lng], lineIndex) => {
                const markerOptions = {
                    radius: 3,
                    color: 'blue',
                    fillColor: 'blue',
                    fillOpacity: 1,
                };
                if (lineIndex === 0) { // 첫 번째 가로선의 두 번째 교차점에 포인트 아이콘 추가
                    markerOptions.radius = 5;
                    markerOptions.color = 'red';
                    markerOptions.fillColor = 'red';
                }
                const startMarker = L.circleMarker([lat, lng], markerOptions).addTo(this.map);
                this.gridMarkers.push(startMarker);
            });
        }

        removeGridMarkers() {
            this.gridMarkers.forEach(marker => this.map.removeLayer(marker));
            this.gridMarkers = [];
        }

        toggleGridMarkers() {
            if ($('#checkCamera').is(':checked')) {
                this.addGridMarkers();
            } else {
                this.removeGridMarkers();
            }
        }

		exportGridIntersections() {
		    const gridSize = 10; // 2 meters
		    const bounds = this.poly.getBounds();
		    const northWest = bounds.getNorthWest();
		    const southEast = bounds.getSouthEast();
		    const latStep = gridSize / 111320; // Approximation of meters per degree latitude
		    const lngStep = gridSize / (111320 * Math.cos(northWest.lat * (Math.PI / 180))); // Approximation of meters per degree longitude
		
		    const intersections = [];
		    const polyCoords = this.poly.getLatLngs()[0].map(coord => [coord.lng, coord.lat]);
		    
		    // 첫 번째 좌표를 마지막에 다시 추가하여 닫힌 루프 생성
		    polyCoords.push(polyCoords[0]);
		
		    const polygon = turf.polygon([polyCoords]);
		
		    for (let lat = northWest.lat; lat >= southEast.lat; lat -= latStep) {
		        for (let lng = northWest.lng; lng <= southEast.lng; lng += lngStep) {
		            const point = turf.point([lng, lat]);
		            if (turf.booleanPointInPolygon(point, polygon)) {
		                intersections.push(L.latLng(lat, lng));
		            }
		        }
		    }
		
		    // dl_waypoint에 교차점 좌표 추가
		    const dl_waypoint = {
		        actions: [],
		        defaultFrame: "Home",
		        creationTime: new Date().toISOString(),
		        defaultAngle: 0,
		        defaultAngleOfView: [150, 85],
		        defaultCameraName: "",
		        defaultCameraResolution: [1280, 720],
		        defaultAltitude: 0,
		        defaultDelay: 0,
		        defaultDistance: 0,
		        defaultHeading: 0,
		        defaultOverlap: 0,
		        defaultRadius: 0,
		        defaultSpeed: 0,
		        defaultWidth: 0,
		        home: {
		            coordinate: [
		                this.poly.getBounds().getCenter().lat,
		                this.poly.getBounds().getCenter().lng
		            ],
		            version: 1
		        },
		        name: "test",
		        rallys: [],
		        version: 1,
		        missionDetail: []
		    };
		
		    intersections.forEach((intersection, index) => {
		        dl_waypoint.actions.push({
		            command: "Waypoint",
		            coordinate: [
		                intersection.lat,
		                intersection.lng,
		                20 // Assume a constant altitude for all waypoints
		            ],
		            delay: 0,
		            elevation: 20,
		            frame: "Home",
		            heading: 0,
		            radius: 0,
		            speed: 2,
		            type: "MoveTo",
		            version: 1
		        });
		
		        dl_waypoint.missionDetail.push([{
		            _num: index,
		            _waypointParan1: "",
		            _waypointParan2: "",
		            _waypointParan3: "",
		            _waypointParan4: "",
		            _waypoinCommand: "16",
		            _waypoinframe: "3"
		        }]);
		    });
		
		    console.log(JSON.stringify(dl_waypoint, null, 2)); // JSON 형식으로 dl_waypoint 로그 출력
		}





    }

    var map = L.map('map', { editable: true }).setView([tmLat, tmLng], 18);

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

    $('#exportButton').on('click', function() {
        rectangleCreator.exportGridIntersections();
    });

    $("#gridSizeSlider").on("input", function() {
        var value = (this.value / 10).toFixed(1);
        $("#gridSizeValue").text(value);
    });

    $('#droneAlt').on('input', function() {
        var currentValue = $(this).val();
        $('#droneAltValue').text(currentValue);
    });

    $('#droneSpeed').on('input', function() {
        var currentValue = $(this).val();
        $('#droneSpeedValue').text(currentValue);
    });
});

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
    $('#droneSpeed').val(data.droneSpeed);
    $('#droneSpeedValue').text(data.droneSpeed);
}
