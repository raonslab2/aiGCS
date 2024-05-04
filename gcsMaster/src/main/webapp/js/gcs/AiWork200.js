$(document).ready(function() {
	// 데이터 목록 항목을 동적으로 생성합니다.
	var imageList = [
		"/images/test/DJI_0001.JPG",
		"/images/test/DJI_0002.JPG"
		// 필요한 만큼 이미지 경로를 추가할 수 있습니다.
	];

	var dataList = $("#dataList");
	$.each(imageList, function(index, imageUrl) {
		var listItem = $("<li>").addClass("list-item").attr("data-image", imageUrl).text("이미지 " + (index + 1));
		dataList.append(listItem);
	});

	// 첫 번째 이미지 로드
	var firstImage = imageList[0];
	$("#mainImage").attr("src", firstImage);

	// 이미지 클릭 시 해당 이미지 로드
	$(".list-item").click(function() {
		var imageUrl = $(this).data('image');
		$("#mainImage").attr("src", imageUrl);
	});

	// 라벨링 버튼 클릭 시 동작
	$("#labelButton").click(function() {
		// 도구 툴에서 선택한 도구에 따라 동작하는 함수입니다.
		// 이 함수는 라벨링 작업을 수행하도록 구현합니다.
	});

	// 사각 영역 도구 버튼 클릭 시 동작
	$("#rectangleTool").click(function() {
		// 해당 도구를 선택하면 사각 영역을 그릴 수 있도록 동작하는 함수를 호출하거나
		// 해당 도구를 활성화하는 코드를 작성합니다.
		alert("rectangleTool");
	});

	// 폴리라인 도구 버튼 클릭 시 동작
	$("#polylineTool").click(function() {
		// 해당 도구를 선택하면 폴리라인을 그릴 수 있도록 동작하는 함수를 호출하거나
		// 해당 도구를 활성화하는 코드를 작성합니다.
		alert("polylineTool");
	});

	// 폴리곤 도구 버튼 클릭 시 동작
	$("#polygonTool").click(function() {
		// 해당 도구를 선택하면 폴리곤을 그릴 수 있도록 동작하는 함수를 호출하거나
		// 해당 도구를 활성화하는 코드를 작성합니다.
		alert("polygonTool");
	});
});