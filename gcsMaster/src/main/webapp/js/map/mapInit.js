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

		exportGridIntersections() {
			const elevation = parseFloat($('#droneAlt').val());
			const projectName = $('#projectName').val();

			const gridLines = [];
			const bounds = this.poly.getBounds();
			const latStep = 0.00009 * parseInt(this.gridSizeSlider.val());
			const lngStep = 0.00009 * parseInt(this.gridSizeSlider.val());

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
				missionDetail: []
			};

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
		    const dlPk = ""; // 실제 값으로 변경
		    const missionName = projectName; // 실제 값으로 변경
		 
		    // 데이터 URL 인코딩 형식으로 변환
		    const jsonObj = JSON.stringify(dl_waypoint);
		    // AJAX 요청을 사용하여 데이터를 서버로 전송
		    $.post("/gcs/dashboard/insertDlWaypoint.do", {
		        data: jsonObj,
		        addr: addr,
		        dlPk: dlPk,
		        missionName: missionName
		    }).done(function(res) {
		        alert("Registered successfully.");
		    }).fail(function() {
		        alert("실패");
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
	});

	$('#exportButton').on('click', function() {
		rectangleCreator.exportGridIntersections();

	});

	// 임시로 JSON 데이터를 불러오는 버튼 핸들러 추가
	$('#importButton').on('click', function() {
		/*
		var data = {
			"polygons": [{
				"latlngs": [[37.5665, 126.9780], [37.5665, 126.9790], [37.5655, 126.9790], [37.5655, 126.9780]],
				"style": {
					"fillColor": "rgba(0, 128, 0, 0.7)",
					"color": "white",
					"weight": 2
				}
			}],
			"gridSize": 5,
			"grid": [{"lat": 37.5665, "lng": 126.9781}, {"lat": 37.5664, "lng": 126.9782}],
			"droneAltitude": 100,
			"droneSpeed": 10
		};
		*/
		const data = `{
          "polygons": [
            {
              "latlngs": [
                [37.20647849602711, 127.75017142295836],
                [37.20531817368949, 127.7498209988414],
                [37.20563679845143, 127.74739801883692]
              ],
              "style": {
                "fillColor": "rgba(0, 128, 0, 0.7)",
                "color": "white",
                "weight": 2
              }
            }
          ],
          "gridSize": "4",
          "grid": [
            {"lat": 37.20567817368949, "lng": 127.74775801883692},
            {"lat": 37.20567817368949, "lng": 127.74811801883692},
            {"lat": 37.20567817368949, "lng": 127.74847801883692},
            {"lat": 37.20567817368949, "lng": 127.74883801883692},
            {"lat": 37.20567817368949, "lng": 127.74919801883692},
            {"lat": 37.20567817368949, "lng": 127.74955801883692},
            {"lat": 37.20567817368949, "lng": 127.74991801883692},
            {"lat": 37.20603817368949, "lng": 127.74883801883692},
            {"lat": 37.20603817368949, "lng": 127.74919801883692},
            {"lat": 37.20603817368949, "lng": 127.74955801883692},
            {"lat": 37.20603817368949, "lng": 127.74991801883692},
            {"lat": 37.20639817368949, "lng": 127.74991801883692}
          ],
          "droneAltitude": "49",
          "droneSpeed": "2"
        }`;


		const jsonData = JSON.parse(data);

		rectangleCreator.importData(jsonData);
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
