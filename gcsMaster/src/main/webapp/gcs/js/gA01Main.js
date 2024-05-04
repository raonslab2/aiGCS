 
// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.
let map, infoWindow;
let markers = [];

function initMap() {

  const myLatlng = { lat: 42.87980374873266, lng: 74.59067194084379};
  const myZoom = 18;
  const mapOptions = {
    zoom: myZoom,
    center: myLatlng, 
    mapTypeId: "satellite", 
    disableDefaultUI: true,
    //mapTypeId: 'satellite',
  };
  
  const map = new google.maps.Map(document.getElementById("map"), mapOptions); 
  
  //map 위성 지도
  // map.setMapTypeId('satellite');
 
  const image =
	    "/images/drone30.png"; 
  
	// 마커 추가
	$("#addMarker").click(async function() {  
		/*
		for (let i = 0; i < 10; i++) {			
			addMarker(42.87980374873266+0.0001*i*2,74.59067194084379 +0.0001*i,map); 
		} 
		*/
		
		for (let i = 0; i < 10000; i++) {	
			deleteMarkers();
			addMarker(42.87980374873266+0.0001*i,74.59067194084379 +0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i,74.59067194084379 -0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i+0.001,74.59067194084379 -0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i+0.002,74.59067194084379 -0.0001*i-0.003,map); 
			addMarker(42.87980374873266-0.0001*i-0.001,74.59067194084379 -0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i-0.003,74.59067194084379 -0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i-0.005,74.59067194084379 -0.0001*i,map); 
			addMarker(42.87980374873266-0.0001*i-0.005,74.59067194084379 -0.0001*i+0.001,map); 
			addMarker(42.87980374873266-0.0001*i-0.005,74.59067194084379 -0.0001*i+0.002,map); 
			await sleep(1000);
			 
		} 
		 
	});
	
	//마커삭제
	$("#deleteMarker").click(function() {  
		deleteMarkers();
	});
	
	
}


function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
 }
 

 
	//Adds a marker to the map and push to the array.
	function addMarker(Tmlat,Tmlng,map) {
	  const image =
		    "/images/drone_d30.png"; 
		
	  const marker = new google.maps.Marker({
		  position:{lat: Tmlat, lng: Tmlng},
		  map: map,
		  icon: image, 
	  });
	
	  markers.push(marker);
	  
 
	}
	
	function deleteMarkers() { 
		  hideMarkers();
		  markers = [];
		}
	
	// Removes the markers from the map, but keeps them in the array.
	function hideMarkers() {
	  setMapOnAll(null);
	}
	
	// Sets the map on all markers in the array.
	function setMapOnAll(map) {
	  for (let i = 0; i < markers.length; i++) {
	    markers[i].setMap(map);
	  }
	}


	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	  infoWindow.setPosition(pos);
	  infoWindow.setContent(
	    browserHasGeolocation
	      ? "Error: The Geolocation service failed."
	      : "Error: Your browser doesn't support geolocation."
	  );
	  infoWindow.open(map);
   }
	
	
	
	
	function placeMarkerAndPanTo(latLng, map) {
		  new google.maps.Marker({
		    position: latLng,
		    map: map,
		  });
		  map.panTo(latLng);
		}