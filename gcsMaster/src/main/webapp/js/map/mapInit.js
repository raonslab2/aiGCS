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

			updatePolygonArea(this.poly); // 폴리곤 생성 시 면적 정보 갱신
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
			updatePolygonArea(this.poly); // 폴리곤 불러오기 시 면적 정보 갱신
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
		
		    // 사용자 정의 꼭짓점 삭제 이벤트 리스너 추가
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

			// 세로 격자선 그리기
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

		removePolygon() {
			if (this.poly) {
				this.map.removeLayer(this.poly);
				this.gridLayers.forEach(layer => this.map.removeLayer(layer));
				this.poly = null;
				this.gridLayers = [];
				this.updateDistance([]);
				this.removeMarkers();
				this.removeGridMarkers(); // 기존 마커 제거
				$('#statsArea').text('0.00'); // 폴리곤 제거 시 면적을 0으로 설정 
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
            radius: 3, // Decreased from 5 to 3
            color: '#FFFFFF',
            fillColor: '#FFFFFF',
            fillOpacity: 1,
            className: 'vertex'
        }).addTo(map);

        vertex.on('mouseover', function() {
            this.setStyle({
                radius: 5, // Adjust hover size
                color: 'blue',
                fillColor: 'blue',
                weight: 2,
                fillOpacity: 1,
                className: 'vertex-hover'
            });
        });

        vertex.on('mouseout', function() {
            this.setStyle({
                radius: 3, // Decreased from 5 to 3
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
            radius: 3, // Decreased from 5 to 3
            color: 'green',
            fillColor: 'green',
            fillOpacity: 1,
            className: 'midpoint'
        }).addTo(map);

        midpoint.on('mouseover', function() {
            this.setStyle({
                radius: 5, // Adjust hover size
                color: 'orange',
                fillColor: 'orange',
                weight: 2,
                fillOpacity: 1,
                className: 'midpoint-hover'
            });
        });

        midpoint.on('mouseout', function() {
            this.setStyle({
                radius: 3, // Decreased from 5 to 3
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
		    // 폴리곤이 없는 경우 알림
		    if (!this.poly) {
		        alert('폴리곤을 먼저 생성해 주세요.');
		        return;
		    }
			
			const elevation = parseFloat($('#droneAlt').val()); // 고도 값을 가져옴
			const projectName = $('#projectName').val();
			const gridSize = parseInt($('#gridSizeSlider').val()); // 간격 값을 가져옴
			const droneSpeed = parseFloat($('#droneSpeed').val()); // 속도 값을 가져옴

			const gridLines = [];
			const bounds = this.poly.getBounds();
			const latStep = 0.00009 * gridSize;
			const lngStep = 0.00009 * gridSize;

			// 가로 격자선에서 좌측 끝과 우측 끝을 선택
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

			// dl_waypoint에 필요한 점들만 추가
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
				gridSize: gridSize,          // 추가: 간격 정보 저장
				droneAltitude: elevation,   // 추가: 고도 정보 저장
				droneSpeed: droneSpeed      // 추가: 속도 정보 저장
			};

			// 다각형의 꼭지점 정보 추가
			const vertices = this.poly.getLatLngs()[0];  // 다각형의 꼭지점 배열을 가져옴
			vertices.forEach(vertex => {
				dl_waypoint.polygons.push({
					lat: vertex.lat,
					lng: vertex.lng
				});
			});

 

			// 격자선의 좌측 끝과 우측 끝을 추가하고 연결
			let path = [];
			for (let i = 0; i < gridLines.length; i++) {
				const linePoints = gridLines[i];
				if (i % 2 === 0) {
					// 짝수 줄: 좌측 끝에서 우측 끝으로
					path.push(linePoints[0]);
					path.push(linePoints[linePoints.length - 1]);
				} else {
					// 홀수 줄: 우측 끝에서 좌측 끝으로
					path.push(linePoints[linePoints.length - 1]);
					path.push(linePoints[0]);
				}
			}

			// 경로를 추가
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

			console.log(JSON.stringify(dl_waypoint, null, 2)); // JSON 형식으로 dl_waypoint 로그 출력

			// 추가 매개변수 정의
			const addr = ""; // 실제 값으로 변경

			const missionName = projectName; // 실제 값으로 변경

			// 데이터 URL 인코딩 형식으로 변환
			const jsonObj = JSON.stringify(dl_waypoint);
			// AJAX 요청을 사용하여 데이터를 서버로 전송
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
	                url: '/gcs/dashboard/uploadMapCapture.do', // 서버 업로드 엔드포인트
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
		$('#statsArea').text('0.00'); // 초기화 버튼 클릭 시 면적을 0으로 설정
	});

	$('#exportButton').on('click', function() {
	    var tmDlPk = "";
	    if (dlPk) {
	        tmDlPk = dlPk;
	    }
	    rectangleCreator.exportGridIntersections(tmDlPk); // 데이터 업로드
	    //rectangleCreator.captureMap(); // 지도 캡쳐 및 업로드
	});


	// 임시로 JSON 데이터를 불러오는 버튼 핸들러 추가
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

	// 기존 데이터를 불러온다면
	if (dlPk) {
		const data = getData(dlPk);
		rectangleCreator.importData(data);
	}
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
			const polygons = waypoints.polygons; // 폴리곤 데이터를 가져옴
			const gridSize = waypoints.gridSize; // 간격 데이터를 가져옴
			const droneAltitude = waypoints.droneAltitude; // 고도 데이터를 가져옴
			const droneSpeed = waypoints.droneSpeed; // 속도 데이터를 가져옴
			const projectName = waypoints.name; // 프로젝트 이름 데이터를 가져옴

			if (polygons) {
				const polygonData = polygons.map(point => {
					if (point.lat && point.lng) {
						return { lat: point.lat, lng: point.lng };
					}
				}).filter(item => item); // undefined 요소 제거

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
					"grid": [
						// 기존 또는 기본 grid 값 필요 시 추가
					],
					"droneAltitude": droneAltitude,
					"droneSpeed": droneSpeed,
					"projectName": projectName // 프로젝트 이름 추가
				};

				// 프로젝트 이름을 설정
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
	const earthRadius = 6378137; // 지구 반지름 (미터 단위)
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
	return Math.abs(area); // 면적은 항상 양수로 반환
}

function squareMetersToHectares(squareMeters) {
	return squareMeters * 0.0001; // 제곱미터를 헥타르로 변환
}

function updatePolygonArea(polygon) {
	if (!polygon || polygon.getLatLngs()[0].length < 3) {
		$('#statsArea').text('0.00'); // 폴리곤이 없으면 면적을 0으로 설정
		return;
	}

	const vertices = polygon.getLatLngs()[0];
	const areaSquareMeters = calculatePolygonArea(vertices);
	const areaHectares = squareMetersToHectares(areaSquareMeters);
	$('#statsArea').text(areaHectares.toFixed(2)); // 소수점 두 자리까지 표시
}

