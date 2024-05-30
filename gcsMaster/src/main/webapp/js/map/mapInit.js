$(document).ready(function() {
    // 사각형 생성 클래스 정의
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
 
		// 사각형 생성 메소드
		createRectangle() {
		    const center = this.map.getCenter();
		    const centerLat = center.lat;
		    const centerLng = center.lng;
		
		    // 3헥타르(300m x 100m)를 위도와 경도로 변환
		    const latOffset = 130 / 111320; // 300미터에 해당하는 위도 차이
		    const lngOffset = 170 / (111320 * Math.cos(centerLat * (Math.PI / 180))); // 100미터에 해당하는 경도 차이
		
		    const topLeft = [centerLat + latOffset, centerLng - lngOffset];
		    const topRight = [centerLat + latOffset, centerLng + lngOffset];
		    const bottomRight = [centerLat - latOffset, centerLng + lngOffset];
		    const bottomLeft = [centerLat - latOffset, centerLng - lngOffset];
		
		    // 직사각형 생성
		    this.poly = L.polygon([topLeft, topRight, bottomRight, bottomLeft], {
		        fillColor: 'rgba(0, 128, 0, 0.7)',
		        color: 'white',
		        weight: 2 // 기존 두께의 50%
		    }).addTo(this.map);
		
		    // 편집 가능하게 설정
		    this.poly.enableEdit();
		    this.poly.on('dblclick', L.DomEvent.stop).on('dblclick', this.poly.toggleEdit);
		
		    this.initGridAndPath();
		    this.setupEventListeners();
		
		    // 다각형이 생성되면 면적을 업데이트합니다.
		    this.updateArea(); // 여기에 추가
		}


        // 포인트가 다각형 안에 있는지 확인하는 메소드
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

        // 그리드와 경로를 그리는 메소드
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
                    const gridLine = L.polyline(linePoints, { color: 'rgba(0, 0, 0, 0.2)', weight: 1 }); // 기존 두께의 50%
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
                    const gridLine = L.polyline(linePoints, { color: 'rgba(0, 0, 0, 0.5)', weight: 1 }); // 기존 두께의 50%
                    gridLines.push(gridLine);
                    this.gridLayers.push(gridLine);
                }
            }

            gridLines.forEach(line => line.addTo(this.map));
            const pathLine = L.polyline(path, { color: 'white', weight: 2 }); // 기존 두께의 50%
            pathLine.addTo(this.map);
            this.gridLayers.push(pathLine);

            this.updateDistance(path);

            if (path.length > 0) {
                this.addStartAndEndMarkers(path[0], path[path.length - 1]);
            }

            // 다각형이 생성되면 면적을 업데이트합니다. 
            this.updateArea();
            
        }

        // 면적을 업데이트하는 메소드
        updateArea() {
 
            // 현재 다각형의 경계를 가져옵니다.
            const bounds = this.poly.getBounds();
 
            // 경계에서 LatLng 객체를 가져와 배열에 저장합니다.
            const latLngs = bounds.toBBoxString().split(",");
	 
            // 위도와 경도를 계산합니다.
            const lat1 = parseFloat(latLngs[0]);
            const lng1 = parseFloat(latLngs[1]);
            const lat2 = parseFloat(latLngs[2]);
            const lng2 = parseFloat(latLngs[3]);
 

            // 위도와 경도를 기준으로 다각형의 넓이를 계산합니다.
            // 단위는 제곱미터입니다.
            const areaInSquareMeters = Math.abs((lat2 - lat1) * (lng2 - lng1));

            // 계산된 면적을 에이커로 변환합니다.
            const areaInAcre = areaInSquareMeters * 0.000247105; 
            // 계산된 에이커 값을 화면에 표시합니다.
            $('#areaAarea').text('' + areaInAcre);
        }

        // 그리드 및 경로 초기화 메소드
        initGridAndPath() {
            const initialGridSize = parseInt(this.gridSizeSlider.val());
            this.gridSizeValue.text(initialGridSize);
            const latStep = 0.00009 * initialGridSize;
            const lngStep = 0.00009 * initialGridSize;

            this.drawGridAndPathInPolygon(latStep, lngStep);
        }

        // 이벤트 리스너 설정 메소드
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

            this.poly.getLatLngs()[0].forEach((latlng) => {
                L.circle(latlng, { radius: 0.75, color: 'green', fillColor: 'green', fillOpacity: 1 }).addTo(this.map); // 기존 반경의 50%
            });
        }
        
        // 다각형 제거 메소드
        removePolygon() {
            if (this.poly) {
                this.map.removeLayer(this.poly);
                this.gridLayers.forEach(layer => this.map.removeLayer(layer));
                this.poly = null;
                this.gridLayers = [];
                this.updateDistance([]);
                this.removeMarkers();
                // 다각형이 제거되면 면적을 초기화합니다.
                $('#areaAarea').text('에이커: 0');
            }
        }

        // 경로 거리 계산 및 업데이트 메소드
        updateDistance(path) {
            let totalDistance = 0;
            for (let i = 1; i < path.length; i++) {
                totalDistance += path[i - 1].distanceTo(path[i]);
            }
            this.distanceDisplay.text(`${totalDistance.toFixed(2)} m`);
        }

        // 시작점과 끝점 마커 추가 메소드
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

        // 마커 제거 메소드
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
    }

    // 지도 초기화
    var map = L.map('map', {editable: true}).setView([tmLat, tmLng], 18);

    // Google 지도의 인공위성 레이어
    var satelliteLayer = L.tileLayer('https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', {
        maxZoom: 20,
        attribution: 'Map data &copy; <a href="https://www.google.com/maps">Google Maps</a>'
    }).addTo(map);

    // 지도 컨트롤 추가
    var controls = new MapControls(map);
    controls.addDefaultControls();
    
    const rectangleCreator = new RectangleCreator(map);

    // 사각형 추가 버튼 클릭 이벤트
    $('#rectangleButton').on('click', function() {
        rectangleCreator.removePolygon();
        rectangleCreator.createRectangle();
    });

    // 초기화 버튼 클릭 이벤트
    $('#resetButton').on('click', function() {
        rectangleCreator.removePolygon();
    });
    
    $("#gridSizeSlider").on("input", function() {
        var value = (this.value / 10).toFixed(1); // 소수점 첫째 자리까지 표시
        $("#gridSizeValue").text(value);
    });
});
