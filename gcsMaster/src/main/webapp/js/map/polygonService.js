class PolygonService {
    constructor(map) {
        this.map = map;
        this.rectangles = {};
        this.rectangleCounter = 0;
        this.defaultPolygonCoords = PolygonService.calculatePolygonCoords(map.getCenter());
    }

    static calculatePolygonCoords(center) {
        const halfSize = 0.0005; // 대략 50m (1ha = 100m x 100m)
        return [
            [center[0] - halfSize, center[1] - halfSize],
            [center[0] - halfSize, center[1] + halfSize],
            [center[0] + halfSize, center[1] + halfSize],
            [center[0] + halfSize, center[1] - halfSize],
            [center[0] - halfSize, center[1] - halfSize]
        ];
    }

    addRectangle(center) {
        const rectangleId = `rectangle-${this.rectangleCounter++}`;
        const polygonCoords = PolygonService.calculatePolygonCoords(center);
        const leafletPolygon = L.polygon(polygonCoords, {color: 'green', weight: 2, fillOpacity: 0.1}).addTo(this.map);

        if (this.map.editTools) {
            leafletPolygon.enableEdit(this.map.editTools);
        }

        this.rectangles[rectangleId] = { polygon: leafletPolygon, flightPath: null };
        return rectangleId;
    }

    removeRectangle(rectangleId) {
        const rectangle = this.rectangles[rectangleId];
        if (rectangle) {
            this.map.removeLayer(rectangle.polygon);
            if (rectangle.flightPath) {
                this.map.removeLayer(rectangle.flightPath);
            }
            delete this.rectangles[rectangleId];
        }
    }

    getPolygon(rectangleId) {
        return this.rectangles[rectangleId]?.polygon;
    }

    setFlightPath(rectangleId, flightPathCoordinates) {
        const rectangle = this.rectangles[rectangleId];
        if (rectangle.flightPath) {
            this.map.removeLayer(rectangle.flightPath);
        }
        rectangle.flightPath = L.polyline(flightPathCoordinates, {color: 'red'}).addTo(this.map);
    }

    resetPolygons() {
        for (const rectangleId in this.rectangles) {
            const rectangle = this.rectangles[rectangleId];
            rectangle.polygon.setLatLngs(this.defaultPolygonCoords);
            if (this.map.editTools) {
                rectangle.polygon.enableEdit(this.map.editTools);
            }
        }
    }
}
