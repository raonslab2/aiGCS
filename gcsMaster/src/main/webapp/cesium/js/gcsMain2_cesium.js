/*
 * Bronxville 드론 비행 도구
 * Cesium을 사용하여 웨이포인트를 추가 및 제거하고, QGC WPL 110에 기반한 맞춤 비행 계획을 내보냅니다.
 * 현재 출력 형식은 Ardupilot의 .waypoint 파일과 동일하지 않지만 수정할 수 있습니다.
 *
 * 작성자: Charlie Vorbach 
 * MIT 라이선스
 */

// 상수 설정
const MAX_PARAM = 4;
const RAD_TO_DEG = 180 / Math.PI;
const MIN_HEIGHT = 25;
const BASE_HEIGHT = 1;
const DEFAULT_RADIUS = 2;
const DEFAULT_LAT = 127.75115186132;
const DEFAULT_LNG = 37.20821628335832;
const COOR_PRECIS = 6;
const OTHER_PRECIS = 1;

// Cesium 설정
Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes";


const viewer = new Cesium.Viewer("cesiumContainer", {
    infoBox: false,
    selectionIndicator: false,
    shadows: true,
    shouldAnimate: true
});

viewer.scene.globe.depthTestAgainstTerrain = true;
viewer.animation.container.style.visibility = 'hidden';

var scene = viewer.scene;
var numberOfWaypoints = 0;

// 드론 생성 관련 변수들
var airPathArray = [];
var groundPathArray = [];
var timeNow = new Cesium.JulianDate.now();

const drones = [
    viewer.entities.add({
        id: 'lm_10001',
        position: Cesium.Cartesian3.fromDegrees(DEFAULT_LAT, DEFAULT_LNG, 0),
        model: { uri: '/images/drone_quad.glb', scale: 0.1, minimumPixelSize: 130, maximumScale: 1000000 }
    }),
    viewer.entities.add({
        id: 'lm_10002',
        position: Cesium.Cartesian3.fromDegrees(DEFAULT_LAT + 0.001, DEFAULT_LNG, 0),
        model: { uri: '/images/drone_quad.glb', scale: 0.1, minimumPixelSize: 130, maximumScale: 1000000 }
    }),
    viewer.entities.add({
        id: 'lm_10003',
        position: Cesium.Cartesian3.fromDegrees(DEFAULT_LAT + 0.002, DEFAULT_LNG, 0),
        model: { uri: '/images/drone_quad.glb', scale: 0.1, minimumPixelSize: 130, maximumScale: 1000000 }
    }),
    viewer.entities.add({
        id: 'lm_10004',
        position: Cesium.Cartesian3.fromDegrees(DEFAULT_LAT + 0.003, DEFAULT_LNG, 0),
        model: { uri: '/images/drone_quad.glb', scale: 0.1, minimumPixelSize: 130, maximumScale: 1000000 }
    }),
    viewer.entities.add({
        id: 'lm_10005',
        position: Cesium.Cartesian3.fromDegrees(DEFAULT_LAT + 0.004, DEFAULT_LNG, 0),
        model: { uri: '/images/drone_quad.glb', scale: 0.1, minimumPixelSize: 130, maximumScale: 1000000 }
    })
];

function droneState(x, y, z, vDrone, sendTime) {
    if (x !== undefined && x !== "" && x !== null) {
        z = Math.max(parseFloat(z) + 2, 2);
        const position = Cesium.Cartesian3.fromDegrees(y, x, z);
        const timeString = new Date().toISOString().split("T")[1].split(".")[0];

        const logMessage = `${timeString}: [D=>]${vDrone} ${x}/${y}`;
        $("#dronelog").val(`${logMessage}\n${$("#dronelog").val()}`);

        const drone = viewer.entities.getById(vDrone);
        const tmHead = parseInt($(`#menu${vDrone.slice(-1)}4`).val());
        const heading = Cesium.Math.toRadians(tmHead + 90);

        const hpr = new Cesium.HeadingPitchRoll(heading, 0, 0);
        const orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);

        drone.position = position;
        drone.orientation = orientation;

        const tm_drone_type = $(`#${vDrone}_alias2`).text();
        drone.model.uri = tm_drone_type === 'VTOL' ? "/images/drone_vtol.glb" : "/images/drone_quad.glb";
        drone.model.scale = tm_drone_type === 'VTOL' ? 0.5 : 0.05;
        drone.model.minimumPixelSize = 120;
        drone.model.maximumScale = 1000;
    }
}

var droneEntities = [];
var facadeEntities = [];
var polygonEntities = [];
let airplaneEntity22;
let isMultiViewChecked = false;

function removeAllEntities() {
    if (!isMultiViewChecked) {
        droneEntities.forEach(entity => viewer.entities.remove(entity));
        facadeEntities.forEach(entity => viewer.entities.remove(entity));
        polygonEntities.forEach(entity => viewer.entities.remove(entity));

        droneEntities = [];
        facadeEntities = [];
        polygonEntities = [];

        if (airplaneEntity22) {
            viewer.entities.remove(airplaneEntity22);
            airplaneEntity22 = undefined;
        }
    }
}

// 드론 비행 경로 꼭지점을 지상과 연결하는 함수
function connectPointsToGround(points) {
    points.forEach(point => {
        const groundPosition = Cesium.Cartesian3.fromDegrees(point.longitude, point.latitude, 0);

        viewer.entities.add({
            polyline: {
                positions: [point, groundPosition],
                width: 2,
                material: Cesium.Color.CYAN
            }
        });
    });
}

// drawGridInPolygon 함수 정의 추가
function drawGridInPolygon(polygonHierarchy, gridSize) {
    const boundingRectangle = Cesium.Rectangle.fromCartesianArray(polygonHierarchy.positions);
    const minX = boundingRectangle.west;
    const maxX = boundingRectangle.east;
    const minY = boundingRectangle.south;
    const maxY = boundingRectangle.north;

    for (let x = minX; x <= maxX; x += gridSize) {
        for (let y = minY; y <= maxY; y += gridSize) {
            const point = Cesium.Cartesian3.fromRadians(x, y, Cesium.Cartographic.fromCartesian(polygonHierarchy.positions[0]).height);
            const groundPoint = Cesium.Cartesian3.fromRadians(x, y, 0);

            if (isPointInsidePolygon(point, polygonHierarchy)) {
                viewer.entities.add({
                    position: point,
                    point: {
                        pixelSize: 5,
                        color: Cesium.Color.BLUE
                    }
                });

                viewer.entities.add({
                    polyline: {
                        positions: [point, groundPoint],
                        width: 2,
                        material: Cesium.Color.CYAN
                    }
                });
            }
        }
    }
}

function isPointInsidePolygon(point, polygonHierarchy) {
    const cartographicPoint = Cesium.Cartographic.fromCartesian(point);
    const latitude = cartographicPoint.latitude;
    const longitude = cartographicPoint.longitude;

    const polygonPositions = polygonHierarchy.positions.map(pos => {
        const cartographic = Cesium.Cartographic.fromCartesian(pos);
        return [cartographic.longitude, cartographic.latitude];
    });

    let inside = false;
    for (let i = 0, j = polygonPositions.length - 1; i < polygonPositions.length; j = i++) {
        const xi = polygonPositions[i][0], yi = polygonPositions[i][1];
        const xj = polygonPositions[j][0], yj = polygonPositions[j][1];

        const intersect = ((yi > latitude) !== (yj > latitude)) && (longitude < (xj - xi) * (latitude - yi) / (yj - yi) + xi);
        if (intersect) inside = !inside;
    }

    return inside;
}

// 폴리곤 그리기
function drawPolygon(polygons) {
    const polygonEntities = polygons.map(point => {
        const position = Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 10);
        const groundPosition = Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 0);

        viewer.entities.add({
            polyline: {
                positions: [position, groundPosition],
                width: 2,
                material: Cesium.Color.CYAN
            }
        });

        return viewer.entities.add({
            position: position,
            point: {
                pixelSize: 10,
                color: Cesium.Color.RED,
                outlineColor: Cesium.Color.BLACK,
                outlineWidth: 2,
            },
        });
    });

    viewer.entities.add({
        polygon: {
            hierarchy: new Cesium.PolygonHierarchy(
                polygons.map(point => Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 10))
            ),
            material: Cesium.Color.GREEN.withAlpha(0.5),
            outline: true,
            outlineColor: Cesium.Color.WHITE,
        },
    });

    const polylinePositions = polygons.map(point => Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 10));
    polylinePositions.push(Cesium.Cartesian3.fromDegrees(polygons[0].lng, polygons[0].lat, 10));

    viewer.entities.add({
        polyline: {
            positions: polylinePositions,
            width: 3,
            material: Cesium.Color.GREEN,
            clampToGround: false,
        },
    });

    return polygonEntities;
}

// 파사드 원형 경로를 그리는 함수 추가
function drawFacadeCircle(polygons, speed, heightStep, startHeight, maxHeight) {
    const boundingBox = getBoundingBox(polygons);
    const center = getPolygonCenter(polygons);
    const radius = getBoundingBoxRadius(boundingBox, center);
    const numPoints = 36;
    let currentHeight = startHeight;
    const points = [];

    while (currentHeight <= maxHeight) {
        const levelPoints = generateCirclePoints(center, radius, numPoints, currentHeight);
        points.push(...levelPoints);
        currentHeight += heightStep;
    }

    const pathPositions = [];
    for (let i = 0; i < points.length; i++) {
        const point = points[i];
        const position = Cesium.Cartesian3.fromDegrees(point.lng, point.lat, point.height);
        pathPositions.push(position);

        if (point.height === startHeight) {
            const groundPosition = Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 0);
            viewer.entities.add({
                polyline: {
                    positions: [position, groundPosition],
                    width: 5,
                    material: Cesium.Color.CYAN
                }
            });
        }

        if (i + numPoints < points.length) {
            const nextPoint = points[i + numPoints];
            const nextPosition = Cesium.Cartesian3.fromDegrees(nextPoint.lng, nextPoint.lat, nextPoint.height);
            viewer.entities.add({
                polyline: {
                    positions: [position, nextPosition],
                    width: 2,
                    material: Cesium.Color.YELLOW
                }
            });
        }

        if (i % numPoints > 0) {
            const prevPosition = Cesium.Cartesian3.fromDegrees(points[i - 1].lng, points[i - 1].lat, points[i - 1].height);
            viewer.entities.add({
                polyline: {
                    positions: [prevPosition, position],
                    width: 2,
                    material: Cesium.Color.YELLOW
                }
            });
        }
    }

    for (let i = numPoints; i < points.length; i += numPoints) {
        const firstPointInCurrentLayer = points[i];
        const firstPositionInCurrentLayer = Cesium.Cartesian3.fromDegrees(firstPointInCurrentLayer.lng, firstPointInCurrentLayer.lat, firstPointInCurrentLayer.height);

        const lastPointInPreviousLayer = points[i - 1];
        const lastPositionInPreviousLayer = Cesium.Cartesian3.fromDegrees(lastPointInPreviousLayer.lng, lastPointInPreviousLayer.lat, lastPointInPreviousLayer.height);

        viewer.entities.add({
            polyline: {
                positions: [lastPositionInPreviousLayer, firstPositionInCurrentLayer],
                width: 2,
                material: Cesium.Color.YELLOW
            }
        });
    }

    return points;
}

// 폴리곤 경계 박스 계산
function getBoundingBox(polygons) {
    let minLat = Number.POSITIVE_INFINITY;
    let maxLat = Number.NEGATIVE_INFINITY;
    let minLng = Number.POSITIVE_INFINITY;
    let maxLng = Number.NEGATIVE_INFINITY;

    polygons.forEach(point => {
        if (point.lat < minLat) minLat = point.lat;
        if (point.lat > maxLat) maxLat = point.lat;
        if (point.lng < minLng) minLng = point.lng;
        if (point.lng > maxLng) maxLng = point.lng;
    });

    return { minLat, maxLat, minLng, maxLng };
}

// 경계 박스 반지름 계산
function getBoundingBoxRadius(boundingBox, center) {
    const latDiff = boundingBox.maxLat - boundingBox.minLat;
    const lngDiff = boundingBox.maxLng - boundingBox.minLng;
    return Math.min(latDiff, lngDiff) * 0.5 * 111320;
}

// 원 둘레의 점 생성
function generateCirclePoints(center, radius, numPoints, height) {
    const points = [];
    for (let i = 0; i < numPoints; i++) {
        const angle = (i / numPoints) * 2 * Math.PI;
        const lat = center.lat + (radius * Math.cos(angle)) / 111320;
        const lng = center.lng + (radius * Math.sin(angle)) / (111320 * Math.cos(center.lat * (Math.PI / 180)));
        points.push({ lat, lng, height });
    }
    return points;
}

// 폴리곤 중심 계산
function getPolygonCenter(polygons) {
    const total = polygons.length;
    let latSum = 0;
    let lngSum = 0;
    polygons.forEach(point => {
        latSum += point.lat;
        lngSum += point.lng;
    });
    return { lat: latSum / total, lng: lngSum / total };
}

// 속도 레이블 업데이트
function updateSpeedLabel(time, result) {
    const droneName = $("#topdevie option:selected").val();
    let tmpData = droneName;

    if (airplaneEntity22 && airplaneEntity22.position && airplaneEntity22.orientation) {
        const positionValue = airplaneEntity22.position.getValue(viewer.clock.currentTime);
        const orientationValue = airplaneEntity22.orientation.getValue(viewer.clock.currentTime);

        if (positionValue && orientationValue) {
            const cartographic = Cesium.Cartographic.fromCartesian(positionValue);
            const Tmporientation = Cesium.Cartographic.fromCartesian(orientationValue);

            $("#d_roll").text(Math.round(Tmporientation.latitude * 100) / 100);
            $("#d_pitch").text(Math.round(Tmporientation.longitude * 100) / 100);
            $("#d_yaw").text(Math.round(Tmporientation.height * 100) / 100);

            const tmHeight = cartographic.height.toString().split(".");

            tmpData += "\n" + Cesium.Math.toDegrees(cartographic.latitude).toString().substring(0, 10) + " , ";
            tmpData += Cesium.Math.toDegrees(cartographic.longitude).toString().substring(0, 11) + "";
            tmpData += "\n Height:" + tmHeight[0] + "";
        } else {
            console.warn("Position or orientation value is undefined.");
        }
    } else {
        console.warn("airplaneEntity22 or its position/orientation is undefined.");
    }

    return tmpData;
}

function timestamp2(str) {
    str.setHours(str.getHours() + 9);
    return str.toISOString().replace('T', ' ').substring(0, 19);
}

$('.smenutop4').click(function(e) {
    viewer.trackedEntity = airplaneEntity22;
});

$('.smenutop44').click(function(e) {
    viewer.trackedEntity = undefined;
    viewer.zoomTo(
        viewer.entities,
        new Cesium.HeadingPitchRange(
            Cesium.Math.toRadians(-90),
            Cesium.Math.toRadians(-15),
            750
        )
    );
});

$('.smenutop444').click(function(e) {
    viewer.trackedEntity = undefined;
    viewer.zoomTo(
        viewer.entities,
        new Cesium.HeadingPitchRange(0, Cesium.Math.toRadians(-90))
    );
});

// 기본 경로를 처리하는 함수 
function processPathPositions(flightData) {
    const positions = [];
    const positionProperty = new Cesium.SampledPositionProperty();
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);

    flightData.actions.forEach((dataPoint, i) => {
        const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation);
        positions.push(position);

        if (i > 0) {
            const prevPosition = positions[i - 1];
            const distance = Cesium.Cartesian3.distance(prevPosition, position);
            const speed = dataPoint.speed || 3;
            const timeInSeconds = distance / speed;
            currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
        }

        positionProperty.addSample(currentTime, position);

        const groundPosition = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], 0);
        viewer.entities.add({
            polyline: {
                positions: [position, groundPosition],
                width: 2,
                material: Cesium.Color.CYAN
            }
        });
    });

    return { positionProperty, positions, currentTime };
}

// 2차원 파사드 경로를 처리하는 함수
function processFacadePath(flightData) {
    const positions = [];
    const positionProperty = new Cesium.SampledPositionProperty();
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);
    const start = currentTime.clone();

    const startHeight = flightData.droneAltitude || 20;
    const maxHeight = flightData.maxAltitude || 80;
    const heightStep = 7;
    const points = drawFacadeCircle(flightData.polygons, flightData.droneSpeed, heightStep, startHeight, maxHeight);

    if (points.length > 0) {
        points.forEach((point, i) => {
            const position = Cesium.Cartesian3.fromDegrees(point.lng, point.lat, point.height);
            positions.push(position);

            if (i > 0) {
                const prevPosition = positions[i - 1];
                const distance = Cesium.Cartesian3.distance(prevPosition, position);
                const speed = flightData.droneSpeed || 3;
                const timeInSeconds = distance / speed;
                currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
            }

            positionProperty.addSample(currentTime, position);
        });
    }

    return { positionProperty, positions, currentTime, start };
}

// 2차원 폴리곤 경로를 처리하는 함수
function processPolygonPath(flightData) {
    drawPolygon(flightData.polygons);

    const positionProperty = new Cesium.SampledPositionProperty();
    const positions = [];
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);

    flightData.actions.forEach((dataPoint, i) => {
        if (dataPoint.coordinate && dataPoint.coordinate.length >= 2) {
            const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation);
            positions.push(position);

            if (i > 0) {
                const prevPosition = positions[i - 1];
                const distance = Cesium.Cartesian3.distance(prevPosition, position);
                const speed = dataPoint.speed || 3;
                const timeInSeconds = distance / speed;
                currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
            }

            positionProperty.addSample(currentTime, position);
        } else {
            console.error(`Invalid coordinate data at index ${i}`, dataPoint);
        }
    });

    return { positionProperty, positions, currentTime, start: Cesium.JulianDate.fromIso8601(flightData.creationTime) };
}

// 시뮬레이션 경로 설정 함수
function setupSimulation(viewer, positionProperty, start, currentTime) {
    const safeStart = start ? start.clone() : Cesium.JulianDate.fromDate(new Date());

    viewer.clock.startTime = safeStart;
    viewer.clock.stopTime = currentTime.clone();
    viewer.clock.currentTime = safeStart;
    viewer.timeline.zoomTo(safeStart, currentTime);
    viewer.clock.multiplier = 1;
    viewer.clock.shouldAnimate = true;

    const tm_model = "/images/drone_quad.glb";
    const tm_scale = 0.1;
    const tm_minsize = 130;

    airplaneEntity22 = viewer.entities.add({
        availability: new Cesium.TimeIntervalCollection([new Cesium.TimeInterval({ start: safeStart, stop: currentTime })]),
        position: positionProperty,
        model: {
            uri: tm_model,
            scale: tm_scale,
            minimumPixelSize: tm_minsize,
            maximumScale: 1000000,
        },
        orientation: new Cesium.VelocityOrientationProperty(positionProperty),
        outlineWidth: 4,
        label: {
            text: new Cesium.CallbackProperty(updateSpeedLabel, false),
            font: "18px sans-serif",
            showBackground: true,
            horizontalOrigin: Cesium.HorizontalOrigin.TOP,
            eyeOffset: new Cesium.Cartesian3(0, 7.2, 0),
            pixelOffsetScaleByDistance: new Cesium.NearFarScalar(
                1.5e2,
                5.0,
                1.5e7,
                0.5
            ),
        },
    });

    viewer.trackedEntity = airplaneEntity22;
}


// 메인 경로 처리 함수 수정
function processDronePath(flightData, dlDiv) {
    // dlDiv가 1일 때, 2차원 폴리곤 경로를 처리합니다.
    if (dlDiv == 1 && flightData.polygons) {
        return processPolygonPath(flightData);
    }
    // dlDiv가 2일 때, 3차원 회랑 경로를 처리합니다.
    else if (dlDiv == 2 && flightData.actions) {
        return processLongCorridorPath(flightData);
    }
    // dlDiv가 3일 때, 2차원 파사드 경로를 처리합니다.
    else if (dlDiv == 3 && flightData.actions) {
        return processFacadePath(flightData);
    }
    // dlDiv가 4일 때, 2차원 단선형 경로를 처리합니다.
    else if (dlDiv == 4 && flightData.actions) {
        return processSingleLinePath(flightData);
    }
    // dlDiv가 5일 때, 오프라인 경로를 처리합니다.
    else if (dlDiv == 5 && flightData.actions) {
        return processOfflinePath(flightData);
    }
    // 기본 처리 경로
    else {
        return processPathPositions(flightData);
    }
}

// 오프라인 경로를 처리하는 함수
function processOfflinePath(flightData) {
    const positionProperty = new Cesium.SampledPositionProperty();
    const positions = [];
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);
    const start = currentTime.clone();

    flightData.actions.forEach((dataPoint, i) => {
        if (dataPoint.command === "Waypoint" && dataPoint.coordinate && dataPoint.coordinate.length >= 2) {
            const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation);
            positions.push(position);

            if (i > 0) {
                const prevPosition = positions[i - 1];
                const distance = Cesium.Cartesian3.distance(prevPosition, position);
                const speed = dataPoint.speed || 3;
                const timeInSeconds = distance / speed;
                currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
            }

            positionProperty.addSample(currentTime, position);
        } else {
            console.error(`Invalid coordinate data or non-Waypoint command at index ${i}`, dataPoint);
        }
    });

    return { positionProperty, positions, currentTime, start };
}

// 3차원 회랑 경로를 처리하는 함수
function processLongCorridorPath(flightData) {
    const positionProperty = new Cesium.SampledPositionProperty();
    const positions = [];
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);
    const start = currentTime.clone();

    flightData.actions.forEach((dataPoint, i) => {
        if (dataPoint.command === "Waypoint" && dataPoint.coordinate && dataPoint.coordinate.length >= 2) {
            const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.elevation);
            positions.push(position);

            if (i > 0) {
                const prevPosition = positions[i - 1];
                const distance = Cesium.Cartesian3.distance(prevPosition, position);
                const speed = dataPoint.speed || 3;
                const timeInSeconds = distance / speed;
                currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
            }

            positionProperty.addSample(currentTime, position);
        } else {
            console.error(`Invalid coordinate data or non-Waypoint command at index ${i}`, dataPoint);
        }
    });

    return { positionProperty, positions, currentTime, start };
}

// 드론 FC 업로드 
function dronePathWaypoint(waypointsJson, pk, dlDiv) {
    if (!$("#checkMultiView").attr("src").includes("ToggleOpen")) {
        droneEntities.forEach(entity => viewer.entities.remove(entity));
        facadeEntities.forEach(entity => viewer.entities.remove(entity));
        polygonEntities.forEach(entity => viewer.entities.remove(entity));

        droneEntities = [];
        facadeEntities = [];
        polygonEntities = [];
    }

    const tmWayPoint = waypointsJson.dlWaypoint;
    const flightData = JSON.parse(tmWayPoint);

    const { positions } = processDronePath(flightData, dlDiv);

    if (dlDiv != 3) {
        const pathEntity = viewer.entities.add({
            polyline: { positions: positions, width: 3, material: Cesium.Color.YELLOW }
        });
        droneEntities.push(pathEntity);
    }

    viewer.clock.onStop.addEventListener(() => {
        viewer.clock.currentTime = viewer.clock.startTime.clone();
        viewer.clock.shouldAnimate = true;
    });
}

// 시뮬레이션 경로 설정
function dronePathSetting(waypointsJson, droneName, dlDiv) {
    let tmWayPoint = waypointsJson.dlWaypoint;
    let flightData = JSON.parse(tmWayPoint);

    let positionData = processDronePath(flightData, dlDiv);

    const { positionProperty, positions, currentTime, start } = positionData;
    if (positionProperty && positions && currentTime && start) {
        setupSimulation(viewer, positionProperty, start, currentTime);

        if (dlDiv != 3) {
            const pathEntity = viewer.entities.add({
                polyline: {
                    positions: positions,
                    width: 3,
                    material: Cesium.Color.YELLOW
                }
            });
            droneEntities.push(pathEntity);
        }
    } else {
        console.error("Invalid position data", positionData);
    }
}

// 2차원 단선형 경로를 처리하는 함수
// 2차원 단선형 경로를 처리하는 함수
function processSingleLinePath(flightData) {
    const positionProperty = new Cesium.SampledPositionProperty();
    const positions = [];
    let currentTime = Cesium.JulianDate.fromIso8601(flightData.creationTime);
    const start = currentTime.clone();

    const minElevation = flightData.droneAltitude || 3; // 최소 고도 설정
    const maxElevation = flightData.maxElevation || 120; // JSON에서 최고 고도 가져오기
    const speed = flightData.droneSpeed || 2; // 기본 속도 설정
    const heightStep = flightData.gridSize || 10; // 높이 간격 5m로 설정

    // 웨이포인트 처리 함수
    const processWaypoints = (waypoints, height) => {
        for (let i = 0; i < waypoints.length; i++) {
            const dataPoint = waypoints[i];
            if (dataPoint.command === "Waypoint" && dataPoint.coordinate && dataPoint.coordinate.length >= 2) {
                const position = Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], minElevation + height);
                positions.push(position);

                if (positions.length > 1) {
                    const prevPosition = positions[positions.length - 2];
                    const distance = Cesium.Cartesian3.distance(prevPosition, position);
                    const timeInSeconds = distance / speed;
                    currentTime = Cesium.JulianDate.addSeconds(currentTime, timeInSeconds, new Cesium.JulianDate());
                }

                positionProperty.addSample(currentTime, position);
            } else {
                console.error(`Invalid coordinate data at index ${i}`, dataPoint);
            }
        }
    };

    // 첫 번째 경로 처리
    processWaypoints(flightData.actions, 0);

    // 높이를 5m씩 올려가며 왕복 경로 추가
    let height = heightStep;
    while (minElevation + height <= maxElevation) {
        processWaypoints([...flightData.actions].reverse(), height);
        height += heightStep;
        if (minElevation + height <= maxElevation) {
            processWaypoints(flightData.actions, height);
            height += heightStep;
        }
    }

    return { positionProperty, positions, currentTime, start };
}



// 드론 MC 업로드
function dronePathWaypoint2(waypointsJson, pk, dlWaypointDetail) {
    const droneName = $("#topdevie option:selected").val();

    if (droneName === 'no') {
        alert("Selected No Device");
        return false;
    }
    selectdrone2(pk, droneName);

    const tmWayPoint = waypointsJson.dlWaypoint;

    const flightData = JSON.parse(tmWayPoint);

    const positions = flightData.actions.map(dataPoint =>
        Cesium.Cartesian3.fromDegrees(dataPoint.coordinate[1], dataPoint.coordinate[0], dataPoint.coordinate[2])
    );

    viewer.entities.add({
        polylineVolume: {
            positions: positions,
            shape: starPositions(3, 3.0, 2.0),
            outline: true,
            outlineWidth: 1,
            material: Cesium.Color.fromRandom({ alpha: 0.2 }),
        },
    });
}

// 하단 로그 토글
$('.logopenclose').click(function(e) {
    $("#bottomLog").toggle();
});

// 시연용
$('.smenu8').click(function(e) {
    waypointFly(waypointsJson);
});

function setVal(tmStr) {
    $("#menu999").val("lm_1000" + tmStr).prop("selected", true);
    $("#topdevie").val("lm_1000" + tmStr).prop("selected", true);
    $("#drone_select").val("lm_1000" + tmStr);

    for (let i = 0; i < 10; i++) {
        if (i === (tmStr - 1)) {
            $(`#a1000${i + 1}`).css("border", "3px solid #FFD700");
            $(`#droneState_${i}`).css("border", "3px solid #FFD700");
        } else {
            $(`#a1000${i + 1}`).css("border", "3px solid #006400");
            $(`#droneState_${i}`).css("border", "3px solid #006400");
        }
    }

    const drone = viewer.entities.getById("lm_1000" + tmStr);
    viewer.trackedEntity = drone;
}

$('#a10001').click(() => setVal(1));
$('#a10002').click(() => setVal(2));
$('#a10003').click(() => setVal(3));
$('#a10004').click(() => setVal(4));
$('#a10005').click(() => setVal(5));

// Load 3D tileset
const tileset1 = new Cesium.Cesium3DTileset({
    url: '/home/mrdev/offlinemap/1001/tileset.json'
});

viewer.scene.primitives.add(tileset1);

tileset1.readyPromise.then(() => {
    const heightOffset = 41; 
    const boundingSphere = tileset1.boundingSphere;
    const cartographic = Cesium.Cartographic.fromCartesian(boundingSphere.center);
    const surface = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, 0.0);
    const offset = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, heightOffset);
    const translation = Cesium.Cartesian3.subtract(offset, surface, new Cesium.Cartesian3());
    const newModelMatrix = Cesium.Matrix4.fromTranslation(translation);

    Cesium.Matrix4.multiply(tileset1.modelMatrix, newModelMatrix, tileset1.modelMatrix);
});

// Load the second tileset
const tileset2 = new Cesium.Cesium3DTileset({
    url: '/home/mrdev/offlinemap/1002/tileset.json'
});

viewer.scene.primitives.add(tileset2);

tileset2.readyPromise.then(() => {
    const heightOffset = 71;
    const boundingSphere = tileset2.boundingSphere;
    const cartographic = Cesium.Cartographic.fromCartesian(boundingSphere.center);
    const surface = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, 0.0);
    const offset = Cesium.Cartesian3.fromRadians(cartographic.longitude, cartographic.latitude, heightOffset);
    const translation = Cesium.Cartesian3.subtract(offset, surface, new Cesium.Cartesian3());
    const newModelMatrix = Cesium.Matrix4.fromTranslation(translation);

    Cesium.Matrix4.multiply(tileset2.modelMatrix, newModelMatrix, tileset2.modelMatrix);
});

// Ensure both tilesets are visible
Promise.all([tileset1.readyPromise, tileset2.readyPromise]).then(() => {
    viewer.zoomTo(tileset1);
}).catch(error => console.error(error));


