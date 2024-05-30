class DroneDeployMap {
    constructor(mapElementId, controlElementIds, center) {
        this.map = L.map(mapElementId, {editable: true}).setView(center, 17);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap'
        }).addTo(this.map);

        this.map.editTools = new L.Editable(this.map);  // Editable 초기화

        this.center = center;
        this.polygonService = new PolygonService(this.map);
        this.gridSize = 0.002; // 초기 그리드 간격 (2미터)

        this.gridSizeSlider = document.getElementById(controlElementIds.gridSizeSlider);
        this.gridSizeValueLabel = document.getElementById(controlElementIds.gridSizeValue);

        this.addEventListeners(controlElementIds);
    }

    addEventListeners(controlElementIds) {
        document.getElementById(controlElementIds.reset).addEventListener('click', () => {
            this.resetPolygons();
        });

        document.getElementById(controlElementIds.start).addEventListener('click', () => {
            this.updateAllFlightPaths();
        });

        document.getElementById(controlElementIds.rectangle).addEventListener('click', () => {
            this.addRectangle();
        });

        document.getElementById('exportButton').addEventListener('click', () => {
            this.exportAllFlightPaths();
        });

        this.gridSizeSlider.addEventListener('input', () => {
            this.gridSize = this.gridSizeSlider.value / 1000; // 슬라이더 값은 미터 단위이므로, 이를 km 단위로 변환
            this.gridSizeValueLabel.textContent = this.gridSizeSlider.value;
            this.updateAllFlightPaths();
        });
    }

    addRectangle() {
        const rectangleId = this.polygonService.addRectangle(this.center);
        this.updateFlightPath(rectangleId);
        this.addRectangleToList(rectangleId);
    }

    addRectangleToList(rectangleId) {
        const rectangleList = document.getElementById('rectangleList');
        const listItem = document.createElement('div');
        listItem.className = 'rectangle-item';
        listItem.id = rectangleId;

        const label = document.createElement('span');
        label.textContent = rectangleId;

        const deleteButton = document.createElement('button');
        deleteButton.textContent = '삭제';
        deleteButton.addEventListener('click', () => {
            this.removeRectangle(rectangleId);
        });

        listItem.appendChild(label);
        listItem.appendChild(deleteButton);
        rectangleList.appendChild(listItem);
    }

    removeRectangle(rectangleId) {
        this.polygonService.removeRectangle(rectangleId);
        const listItem = document.getElementById(rectangleId);
        listItem.parentNode.removeChild(listItem);
    }

    resetPolygons() {
        this.polygonService.resetPolygons();
        this.updateAllFlightPaths();
    }

    updateFlightPath(rectangleId) {
        const polygon = this.polygonService.getPolygon(rectangleId);
        if (!polygon) return;

        const flightPathCoordinates = FlightPathService.createFlightPath(polygon, this.gridSize);
        this.polygonService.setFlightPath(rectangleId, flightPathCoordinates);

        // 비행 경로 좌표를 JSON으로 출력 (디버깅 용도)
        console.log(JSON.stringify(flightPathCoordinates, null, 2));
    }

    updateAllFlightPaths() {
        for (const rectangleId in this.polygonService.rectangles) {
            this.updateFlightPath(rectangleId);
        }
    }

    exportAllFlightPaths() {
        const allFlightPaths = [];
        for (const rectangleId in this.polygonService.rectangles) {
            const polygon = this.polygonService.getPolygon(rectangleId);
            if (polygon) {
                const flightPathCoordinates = FlightPathService.createFlightPath(polygon, this.gridSize);
                const droneType = document.getElementById('droneSelect').value;
                let formattedPath;
                if (droneType === 'dji') {
                    formattedPath = FlightPathService.exportToDjiFormat(flightPathCoordinates);
                } else if (droneType === 'ardupilot') {
                    formattedPath = FlightPathService.exportToArdupilotFormat(flightPathCoordinates);
                }
                allFlightPaths.push({droneType, path: formattedPath});
            }
        }

        // 서버로 전송
        fetch('/upload_path', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ paths: allFlightPaths }),
        })
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));
    }
}

// 클래스 인스턴스 생성
const initialCenter = [36.078, 126.881];
