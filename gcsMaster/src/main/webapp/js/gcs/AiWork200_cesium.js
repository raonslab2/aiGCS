// 초기 설정
const DEFAULT_LAT = 37.20555975;
const DEFAULT_LNG = 127.74774733333334;
const DEFAULT_HEIGHT = 700;

// Cesium Ion 토큰 설정
Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1OTk5YjE3ZC1iNDk3LTRiNTItOTVhNy04ZTJhNDk4M2MzYzMiLCJpZCI6NzIzMjksImlhdCI6MTYzNTk0Mjg1Mn0.YdISux9sGatQpsMXnVUlxziv-q9XCXpfZ7h9Gxqdaes";

// 초기 위치 설정
var initialPosition = Cesium.Cartesian3.fromDegrees(DEFAULT_LNG, DEFAULT_LAT, DEFAULT_HEIGHT);

// Cesium 뷰어 초기화
var viewer = new Cesium.Viewer("cesiumContainer", {
    infoBox: false,
    selectionIndicator: false,
    shadows: true,
    shouldAnimate: true,
});

// 드론으로 촬영한 이미지의 타일 형태로 제공하는 URL
var dronePhotoTileUrl = '/images/test/{z}/{x}/{y}.jpg';

// 드론으로 촬영한 이미지를 타일 형태로 제공하는 ImageryProvider 추가
var dronePhotoProvider = new Cesium.UrlTemplateImageryProvider({
    url: dronePhotoTileUrl,
    credit: 'Drone Photo'
});

viewer.imageryLayers.addImageryProvider(dronePhotoProvider);

// 초기 카메라 방향 설정
var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0, -90, 0);

// 초기 카메라 뷰 설정
var homeCameraView = {
    destination: initialPosition,
    orientation: initialOrientation
};

// Set the initial view
viewer.scene.camera.setView(homeCameraView);
