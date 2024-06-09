$(document).ready(function() {


    const RectangleCreator = class {
        constructor(map) {
            this.map = map;
            this.poly = null;
            this.gridLayers = [];
            this.gridSizeValue = $('#gridSizeValue');
            this.gridSizeSlider = $('#gridSizeSlider');
            this.distanceDisplay = $('#distanceDisplay');
            this.startMarker = null;
            this.endMarker = null;
            this.gridIntersections = [];
            this.gridMarkers = [];
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

            updatePolygonArea(this.poly); 
        }

        importData(data) {
            this.removePolygon();

            const polygonData = data.polygons[0];
            this.poly = L.polygon(polygonData.latlngs, polygonData.style).addTo(this.map);
            this.poly.enableEdit();
            this.poly.on('dblclick', L.DomEvent.stop).on('dblclick', this.poly.toggleEdit);

            this.gridSizeSlider.val(data.gridSize);
            this.gridSizeValue.text(data.gridSize);
            $('#droneAlt').val(data.droneAltitude);
            $('#droneAltValue').text(data.droneAltitude);
            $('#droneSpeed').val(data.droneSpeed);
            $('#droneSpeedValue').text(data.droneSpeed);

            this.gridIntersections = data.grid.map(point => [point.lat, point.lng]);
            this.drawGridAndPathInPolygon(0.00009 * data.gridSize, 0.00009 * data.gridSize);

            this.setupEventListeners();
            updatePolygonArea(this.poly); 
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

            this.poly.on('edit', () => {
                redrawGridAndPath();
                updatePolygonArea(this.poly);
            });

            this.poly.on('editable:vertex:dragend', () => {
                redrawGridAndPath();
                updatePolygonArea(this.poly);
            });

            this.poly.on('editable:dragend', () => {
                redrawGridAndPath();
                updatePolygonArea(this.poly);
            });

            this.poly.on('editable:vertex:deleted', () => {
                redrawGridAndPath();
                updatePolygonArea(this.poly);
            });

            $('#checkCamera').on('change', () => {
                this.toggleGridMarkers();
            });

            $('#checkMulti').on('change', redrawGridAndPath);
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
            this.gridIntersections = [];

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
                        this.gridIntersections.push([point.lat, point.lng]);
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

            if ($('#checkMulti').is(':checked')) {
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    let linePoints = [];
                    for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                        const point = new L.LatLng(lat, lng);
                        if (this.isPointInPolygon(point)) {
                            linePoints.push(point);
                            this.gridIntersections.push([point.lat, point.lng]);
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
            this.toggleGridMarkers();
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

        removePolygon() {
            if (this.poly) {
                this.map.removeLayer(this.poly);
                this.gridLayers.forEach(layer => this.map.removeLayer(layer));
                this.poly = null;
                this.gridLayers = [];
                this.updateDistance([]);
                this.removeMarkers();
                this.removeGridMarkers();
                $('#statsArea').text('0.00');
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
                iconSize: [20, 20]
            });

            const endIcon = L.divIcon({
                className: 'custom-end-icon',
                html: '<div style="background-color: red; width: 24px; height: 24px; border-radius: 50%;"></div>',
                iconSize: [20, 20]
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
                    radius: 3,
                    color: '#FFFFFF',
                    fillColor: '#FFFFFF',
                    fillOpacity: 1,
                    className: 'vertex'
                }).addTo(map);

                vertex.on('mouseover', function() {
                    this.setStyle({
                        radius: 5,
                        color: 'blue',
                        fillColor: 'blue',
                        weight: 2,
                        fillOpacity: 1,
                        className: 'vertex-hover'
                    });
                });

                vertex.on('mouseout', function() {
                    this.setStyle({
                        radius: 3,
                        color: '#FFFFFF',
                        fillColor: '#FFFFFF',
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
                    radius: 3,
                    color: 'green',
                    fillColor: 'green',
                    fillOpacity: 1,
                    className: 'midpoint'
                }).addTo(map);

                midpoint.on('mouseover', function() {
                    this.setStyle({
                        radius: 5,
                        color: 'orange',
                        fillColor: 'orange',
                        weight: 2,
                        fillOpacity: 1,
                        className: 'midpoint-hover'
                    });
                });

                midpoint.on('mouseout', function() {
                    this.setStyle({
                        radius: 3,
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
            this.gridMarkers.forEach(marker => this.map.removeLayer(marker));
            this.gridMarkers = [];
            this.gridIntersections.forEach(([lat, lng]) => {
                const markerOptions = {
                    radius: 3,
                    color: 'blue',
                    fillColor: 'blue',
                    fillOpacity: 1,
                };
                const gridMarker = L.circleMarker([lat, lng], markerOptions).addTo(this.map);
                this.gridMarkers.push(gridMarker);
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

        exportGridIntersections(dlPk) {
            if (!this.poly) {
                alert('폴리곤을 먼저 생성해 주세요.');
                return;
            }

            const elevation = parseFloat($('#droneAlt').val());
            const projectName = $('#projectName').val();
            const gridSize = parseInt($('#gridSizeSlider').val());
            const droneSpeed = parseFloat($('#droneSpeed').val());

            const gridLines = [];
            const bounds = this.poly.getBounds();
            const latStep = 0.00009 * gridSize;
            const lngStep = 0.00009 * gridSize;

            for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                let linePoints = [];
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    const point = new L.LatLng(lat, lng);
                    if (this.isPointInPolygon(point)) {
                        linePoints.push(point);
                    }
                }
                if (linePoints.length > 1) {
                    gridLines.push(linePoints);
                }
            }

            const dl_waypoint = {
                actions: [],
                defaultFrame: "Home",
                creationTime: new Date().toISOString(),
                defaultAngle: 0,
                defaultAngleOfView: [150, 85],
                defaultCameraName: "",
                defaultCameraResolution: [1280, 720],
                defaultAltitude: elevation,
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
                name: projectName,
                rallys: [],
                version: 1,
                missionDetail: [],
                polygons: [],
                gridSize: gridSize,
                droneAltitude: elevation,
                droneSpeed: droneSpeed
            };

            const vertices = this.poly.getLatLngs()[0];
            vertices.forEach(vertex => {
                dl_waypoint.polygons.push({
                    lat: vertex.lat,
                    lng: vertex.lng
                });
            });

            let path = [];
            for (let i = 0; i < gridLines.length; i++) {
                const linePoints = gridLines[i];
                if (i % 2 === 0) {
                    path.push(linePoints[0]);
                    path.push(linePoints[linePoints.length - 1]);
                } else {
                    path.push(linePoints[linePoints.length - 1]);
                    path.push(linePoints[0]);
                }
            }

            path.forEach((point, index) => {
                dl_waypoint.actions.push({
                    command: "Waypoint",
                    coordinate: [point.lat, point.lng, elevation],
                    delay: 0,
                    elevation: elevation,
                    frame: "Home",
                    heading: 0,
                    radius: 0,
                    speed: 3,
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

            console.log(JSON.stringify(dl_waypoint, null, 2));

            const addr = "";
            const missionName = projectName;
            const jsonObj = JSON.stringify(dl_waypoint);
            
            $.post("/gcs/dashboard/insertDlWaypoint.do", {
                data: jsonObj,
                dlDiv: "0",
                addr: addr,
                dlPk: dlPk,
                missionName: missionName
            }).done(function(res) {
                alert("Registered successfully.");
            }).fail(function() {
                alert("실패");
            });
        }

        async captureMap() {
            const mapContainer = document.getElementById('map');
            const canvas = await html2canvas(mapContainer);

            canvas.toBlob((blob) => {
                const formData = new FormData();
                formData.append('file', blob, 'mapCapture.png');

                $.ajax({
                    url: '/gcs/dashboard/uploadMapCapture.do',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert('Map capture uploaded successfully.');
                    },
                    error: function() {
                        alert('Failed to upload map capture.');
                    }
                });
            });
        }
    };
 
 
   // 좌표값을 숫자로 변환
    tmLat = parseFloat(tmLat);
    tmLng = parseFloat(tmLng);
 
    // 좌표값이 유효한지 확인
    if (isNaN(tmLat) || isNaN(tmLng)) {
        alert("유효한 좌표값이 아닙니다.");
        return;
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
        $('#statsArea').text('0.00');
    });

    $('#exportButton').on('click', function() {
        var tmDlPk = "";
        if (dlPk) {
            tmDlPk = dlPk;
        }
        rectangleCreator.exportGridIntersections(tmDlPk);
    });

    $('#importButton').on('click', function() {
        const data = getData(dlPk);
        rectangleCreator.importData(data);
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
 
    if (dlPk) {
        const data = getData(dlPk);
        rectangleCreator.importData(data);
    } else {
        // dlPk 값이 없을 때 지도 중심에 고정된 심볼 추가
        const centerMarker = L.circleMarker([tmLat, tmLng], {
            color: 'blue',
            radius: 8,
            fillColor: 'blue',
            fillOpacity: 1
        }).addTo(map);

        // 지도 중심에 하얀색 테두리만 있는 사각형 추가
        var centerMarkerDiv = $(
            '<div class="center-marker-container">' +
                '<div class="center-marker">' +
                    '<div class="inner-marker">' +
                        '<div class="transparent-circle"></div>' +
                    '</div>' +
                '</div>' +
                '<div class="marker-label" id="newProject">여기에서 프로젝트 만들기</div>' +
            '</div>'
        );
        $('body').append(centerMarkerDiv);
    }

    // 클릭 이벤트 추가
    $('#newProject').on('click', function() {
        $('#overlay').css('display', 'flex');
        $('#newProject').css('display', 'none');
    });

    // 팝업 닫기 이벤트
    $('#overlay').on('click', function() {
        $(this).css('display', 'none');
        $('#newProject').css('display', 'block');
    });

    // 팝업 외부 클릭 시 닫기 방지
    $('.popup-content').on('click', function(e) {
        e.stopPropagation();
    });
});

function getData(dlPk) {
    var result = null;
    $.ajax({
        url: '/gcs/dashboard/selectWaypointView.do',
        type: 'post',
        data: { "dlPk": dlPk },
        async: false,
    }).done((res) => {
        try {
            const waypoints = JSON.parse(res.waypoints);
            const polygons = waypoints.polygons;
            const gridSize = waypoints.gridSize;
            const droneAltitude = waypoints.droneAltitude;
            const droneSpeed = waypoints.droneSpeed;
            const projectName = waypoints.name;

            if (polygons) {
                const polygonData = polygons.map(point => {
                    if (point.lat && point.lng) {
                        return { lat: point.lat, lng: point.lng };
                    }
                }).filter(item => item);

                if (polygonData.length === 0) {
                    console.warn("No valid polygon data found");
                }

                result = {
                    "polygons": [
                        {
                            "latlngs": polygonData,
                            "style": {
                                "fillColor": "rgba(0, 128, 0, 0.7)",
                                "color": "white",
                                "weight": 2
                            }
                        }
                    ],
                    "gridSize": gridSize,
                    "grid": [],
                    "droneAltitude": droneAltitude,
                    "droneSpeed": droneSpeed,
                    "projectName": projectName
                };

                $('#projectName').val(projectName);
            } else {
                console.error("Invalid polygons structure", polygons);
            }
        } catch (error) {
            console.error("Error parsing response", error);
        }
    }).fail(() => {
        alert("실패");
    });

    return result;
}

function calculatePolygonArea(vertices) {
    const earthRadius = 6378137;
    let area = 0;

    if (vertices.length > 2) {
        for (let i = 0; i < vertices.length; i++) {
            let j = (i + 1) % vertices.length;
            let lat1 = vertices[i].lat * (Math.PI / 180);
            let lng1 = vertices[i].lng * (Math.PI / 180);
            let lat2 = vertices[j].lat * (Math.PI / 180);
            let lng2 = vertices[j].lng * (Math.PI / 180);

            area += (lng2 - lng1) * (2 + Math.sin(lat1) + Math.sin(lat2));
        }
        area = area * earthRadius * earthRadius / 2.0;
    }
    return Math.abs(area);
}

function squareMetersToHectares(squareMeters) {
    return squareMeters * 0.0001;
}

function updatePolygonArea(polygon) {
    if (!polygon || polygon.getLatLngs()[0].length < 3) {
        $('#statsArea').text('0.00');
        return;
    }

    const vertices = polygon.getLatLngs()[0];
    const areaSquareMeters = calculatePolygonArea(vertices);
    const areaHectares = squareMetersToHectares(areaSquareMeters);
    $('#statsArea').text(areaHectares.toFixed(2));
}
