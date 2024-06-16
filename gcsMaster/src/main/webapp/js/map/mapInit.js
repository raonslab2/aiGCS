var map; // 전역 변수로 map 선언
$(document).ready(function () {
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
            if (data == null || data == "null" || data.polygons.length === 0) {
                $('#newSidebar').show();
                $('#mySidebar').hide();
                return false;
            }

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
            const redrawGridAndPath = () => {
                const gridSize = parseInt(this.gridSizeSlider.val());
                const latStep = 0.00009 * gridSize;
                const lngStep = 0.00009 * gridSize;
                this.drawGridAndPathInPolygon(latStep, lngStep);
            };

            this.gridSizeSlider.off('input').on('input', () => {
                const gridSize = parseInt(this.gridSizeSlider.val());
                this.gridSizeValue.text(gridSize);
                redrawGridAndPath();
            });

            this.poly.off('edit').on('edit', () => {
                redrawGridAndPath();
                updatePolygonArea(this.poly);
            });

            this.poly.off('editable:vertex:dragend').on('editable:vertex:dragend', redrawGridAndPath);
            this.poly.off('editable:dragend').on('editable:dragend', redrawGridAndPath);
            this.poly.off('editable:vertex:deleted').on('editable:vertex:deleted', redrawGridAndPath);

            $('#checkCamera').off('change').on('change', () => this.toggleGridMarkers());
            $('#checkMulti').off('change').on('change', redrawGridAndPath);
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
            this.clearGridLayers();

            const bounds = this.poly.getBounds();
            let path = [];
            let isPathReversed = false;

            for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                let linePoints = this.getLinePoints(lat, bounds.getWest(), bounds.getEast(), lngStep, 'lat');
                if (linePoints.length > 1) {
                    this.addGridLine(linePoints);
                    if (isPathReversed) linePoints.reverse();
                    path = path.concat(linePoints);
                    isPathReversed = !isPathReversed;
                }
            }

            if ($('#checkMulti').is(':checked')) {
                for (let lng = bounds.getWest(); lng <= bounds.getEast(); lng += lngStep) {
                    let linePoints = this.getLinePoints(lng, bounds.getSouth(), bounds.getNorth(), latStep, 'lng');
                    if (linePoints.length > 1) this.addGridLine(linePoints);
                }
            }

            this.addPathLine(path);
            this.updateDistance(path);
            if (path.length > 0) this.addStartAndEndMarkers(path[0], path[path.length - 1]);
            this.updateArea();
            this.toggleGridMarkers();
        }

        getLinePoints(fixed, start, end, step, type) {
            let linePoints = [];
            for (let variable = start; variable <= end; variable += step) {
                const point = type === 'lat' ? new L.LatLng(fixed, variable) : new L.LatLng(variable, fixed);
                if (this.isPointInPolygon(point)) {
                    linePoints.push(point);
                    this.gridIntersections.push([point.lat, point.lng]);
                }
            }
            return linePoints;
        }

        addGridLine(linePoints) {
            const gridLine = L.polyline(linePoints, { color: '#00FF00', weight: 1 });
            gridLine.addTo(this.map);
            this.gridLayers.push(gridLine);
        }

        addPathLine(path) {
            const pathLine = L.polyline(path, { color: "#00FF00", weight: 1 });
            pathLine.addTo(this.map);
            this.gridLayers.push(pathLine);
        }

        clearGridLayers() {
            this.gridLayers.forEach(layer => this.map.removeLayer(layer));
            this.gridLayers = [];
            this.gridIntersections = [];
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
                this.clearGridLayers();
                this.updateDistance([]);
                this.removeMarkers();
                this.removeGridMarkers();
                $('#statsArea').text('0.00');
            }
        }

        updateDistance(path) {
            let totalDistance = path.reduce((distance, point, index) => {
                if (index > 0) {
                    distance += path[index - 1].distanceTo(point);
                }
                return distance;
            }, 0);
            this.distanceDisplay.text(`${totalDistance.toFixed(2)} m`);
        }

        addStartAndEndMarkers(start, end) {
            this.removeMarkers();

            const startIcon = this.createMarkerIcon('blue');
            const endIcon = this.createMarkerIcon('red');

            this.startMarker = L.marker(start, { icon: startIcon }).addTo(this.map);
            this.endMarker = L.marker(end, { icon: endIcon }).addTo(this.map);
        }

        createMarkerIcon(color) {
            return L.divIcon({
                className: `custom-${color}-icon`,
                html: `<div style="background-color: ${color}; width: 24px; height: 24px; border-radius: 50%;"></div>`,
                iconSize: [20, 20]
            });
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

		    // 중심 좌표 계산
		    const polyCenter = this.getPolygonCenter();

            const gridLines = [];
            const bounds = this.poly.getBounds();
            const latStep = 0.00009 * gridSize;
            const lngStep = 0.00009 * gridSize;

            for (let lat = bounds.getSouth(); lat <= bounds.getNorth(); lat += latStep) {
                let linePoints = this.getLinePoints(lat, bounds.getWest(), bounds.getEast(), lngStep, 'lat');
                if (linePoints.length > 1) gridLines.push(linePoints);
            }

            const dl_waypoint = this.createWaypointObject(elevation, projectName, gridSize, droneSpeed);

            const vertices = this.poly.getLatLngs()[0];
            vertices.forEach(vertex => {
                dl_waypoint.polygons.push({ lat: vertex.lat, lng: vertex.lng });
            });

            let path = [];
            gridLines.forEach((linePoints, index) => {
                if (index % 2 === 0) {
                    path.push(linePoints[0]);
                    path.push(linePoints[linePoints.length - 1]);
                } else {
                    path.push(linePoints[linePoints.length - 1]);
                    path.push(linePoints[0]);
                }
            });

            this.addActionsToWaypoint(path, dl_waypoint, elevation);

            console.log(JSON.stringify(dl_waypoint, null, 2));

            const addr = "";
            const missionName = projectName;
            const jsonObj = JSON.stringify(dl_waypoint); 

 
 
            $.post("/gcs/dashboard/insertDlWaypoint.do", {
                data: jsonObj,
                dlDiv: "0",
                addr: addr,
                dlPk: dlPk,
                polyCenterLat: polyCenter.lat,
                polyCenterLng: polyCenter.lng,
                missionName: missionName 
            }).done(function () {
                //지도정보 다시 로딩
                 alert("경로정보가 적용되었습니다.");
			    // 현재 페이지의 URL 가져오기
			    var currentUrl = window.location.href;
			    
			    // 페이지 리로드
			    window.location.href = currentUrl.split('?')[0] + "?dlPk=" + dlPk;
            }).fail(function () {
                alert("실패");
            });
        }

        createWaypointObject(elevation, projectName, gridSize, droneSpeed) {
            return {
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
                    coordinate: [this.poly.getBounds().getCenter().lat, this.poly.getBounds().getCenter().lng],
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
        }

        addActionsToWaypoint(path, dl_waypoint, elevation) {
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
        }

        //중심 좌표 계산 함수
		getPolygonCenter() {
		    if (!this.poly) {
		        return null;
		    }
		    const bounds = this.poly.getBounds();
		    return bounds.getCenter();
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
                    success: function () {
                        alert('Map capture uploaded successfully.');
                    },
                    error: function () {
                        alert('Failed to upload map capture.');
                    }
                });
            });
        }
    };

	function checkAndShowSidebar() {
	    const polygonExists = map.hasLayer(rectangleCreator.poly);
	    if (!polygonExists) {
	        $('#mySidebar').hide();
	        $('#newSidebar').show();
	    } else {
	        $('#mySidebar').show();
	        $('#newSidebar').hide();
	    }
	}
	
	// 주소 검색 기능 추가
	$('#searchButton').on('click', function (e) {
	    e.preventDefault();
	    const address = $('#addressInput').val();
	    if (address) {
	        geocodeAddress(address);
	    } else {
	        alert('주소를 입력하세요');
	    }
	});
	
	function geocodeAddress(address) {
	    const geocoder = new google.maps.Geocoder();
	    geocoder.geocode({ 'address': address }, function (results, status) {
	        if (status === 'OK') {
	            const latLng = results[0].geometry.location;
	            map.setView([latLng.lat(), latLng.lng()], 18);
	            L.marker([latLng.lat(), latLng.lng()]).addTo(map)
	                .bindPopup(address).openPopup();
	        } else {
	            alert('Geocode was not successful for the following reason: ' + status);
	        }
	    });
	}

    map = initializeMap();
    const rectangleCreator = new RectangleCreator(map);

    if (dlPk) {
        const data = getData(dlPk);
        console.log("[getData]", data);
        if (data) { 
            rectangleCreator.importData(data);
            if (data.polygons.length === 0) { 
                $('#newSidebar').show();
                $('#mySidebar').hide();
            }
        } else { 
            $('#newSidebar').show();
            $('#mySidebar').hide(); 
        }
    } else {
        $('#searchContainer').show();  // dlPk 값이 없을 때 주소 검색 필드 보이기
        addCenterMarker(map);
    }
    setupButtonEventListeners(rectangleCreator);
});



function initializeMap() { 
    tmLat = parseFloat(tmLat);
    tmLng = parseFloat(tmLng);

    if (isNaN(tmLat) || isNaN(tmLng)) {
        alert("유효한 좌표값이 아닙니다.");
        return;
    }

    const map = L.map('map', { editable: true }).setView([tmLat, tmLng], 18);

    map.on('editable:created', function (e) {
        const layer = e.layer;
        layer.enableEdit();
        layer.dragging.enable();
        layer.transform.enable({ rotation: true, scaling: false });
    });

    const satelliteLayer = L.tileLayer('https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', {
        maxZoom: 20,
        attribution: 'Map data &copy; <a href="https://www.google.com/maps">Google Maps</a>'
    }).addTo(map);

    const orthophotoLayer = L.tileLayer('/home/mrdev/offlinemap/{z}/{x}/{y}.png', {
        maxZoom: 20,
        attribution: 'Orthophoto tiles from WebODM'
    }).addTo(map);

    const controls = new MapControls(map);
    controls.addDefaultControls();

    return map;
}

function setupButtonEventListeners(rectangleCreator) {
    $('#rectangleButton').on('click', function () {
        rectangleCreator.removePolygon();
        rectangleCreator.createRectangle();
    });

    $('#resetButton').on('click', function () {
        rectangleCreator.removePolygon();
        $('#statsArea').text('0.00');
    });

    $('#exportButton').on('click', function () {
        var tmDlPk = "";
        if (dlPk) {
            tmDlPk = dlPk;
        }
        rectangleCreator.exportGridIntersections(tmDlPk);
    });

    $('#importButton').on('click', function () {
        const data = getData(dlPk);
        rectangleCreator.importData(data);
    });

    $("#gridSizeSlider").on("input", function () {
        var value = (this.value / 10).toFixed(1);
        $("#gridSizeValue").text(value);
    });

    $('#droneAlt').on('input', function () {
        var currentValue = $(this).val();
        $('#droneAltValue').text(currentValue);
    });

    $('#droneSpeed').on('input', function () {
        var currentValue = $(this).val();
        $('#droneSpeedValue').text(currentValue);
    });
}

function addCenterMarker(map) {
    const centerMarker = L.circleMarker([tmLat, tmLng], {
        color: 'blue',
        radius: 8,
        fillColor: 'blue',
        fillOpacity: 1
    }).addTo(map);

    const centerMarkerDiv = $(
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

    $('#newProject').off('click').on('click', function () {
        $('#newSidebar').show();
        $('#overlay').css('display', 'flex');
        $('#newProject').css('display', 'none');

	    // Generate the formatted string
	    const currentDate = new Date();
	    const formattedDate = currentDate.toISOString().replace(/[-T:.Z]/g, '').slice(0, 14);
	    const projectName = `ROUTE-${formattedDate}`;
	
	    // Set the value of the input field
	    $('#projectNameInput').val(projectName);
    });

    $('#overlay').off('click').on('click', function () {
        //$(this).css('display', 'none');
        //$('#newProject').css('display', 'block');
    });

    $('.popup-content').off('click').on('click', function (e) {
        e.stopPropagation();
    });

	$('#continueButton').off('click').on('click', function () {
	    const projectName = $('#projectNameInput').val();
	    const codination = $('#coordinateSystem').val(); // coordinateSystem 값 추가

	    // 지도 중심 좌표값 가져오기
	    const center = map.getCenter();
	    const homeX = center.lat;
	    const homeY = center.lng;
 
	    if (projectName.length === 0) {
	        alert("프로젝트 이름을 입력하세요.");
	        $('#projectNameInput').focus();
	    } else {
	        // 서버로 프로젝트 이름 저장 요청
	        $.ajax({
	            url: '/gcs/dashboard/saveProjectName.do', // 서버의 적절한 엔드포인트 URL로 변경 필요
	            type: 'POST',
	            data: { 
		                projectName: projectName,
		                codination: codination,
		                homeX: homeX,
		                homeY: homeY,
                      },
	            success: function(response) {
	                var dlPk = response.result; 
			       // 현재 페이지의 URL 가져오기
			       var currentUrl = window.location.href;
			    
			        // 페이지 리로드
			       window.location.href = currentUrl.split('?')[0] + "?dlPk=" + dlPk; 
	            },
	            error: function(error) {
	                alert("프로젝트 이름 저장에 실패했습니다.");
	            }
	        });
	    }
	});
}

function getData(dlPk) {
    let result = null;
    $.ajax({
        url: '/gcs/dashboard/selectWaypointView.do',
        type: 'post',
        data: { "dlPk": dlPk },
        async: false,
    }).done((res) => {
        try {
 
            if (res.waypoints == null || res.waypoints == "null") {
                console.log("No waypoints found.");
                return;
            }

            const waypoints = JSON.parse(res.waypoints);
            console.log("[waypoints] ", waypoints);
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
        alert("Failed to retrieve data.");
    });

    console.log("getData result: ", result);
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
