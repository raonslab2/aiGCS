<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="../../js/jquery.timepicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 달력 입력 datepicker 설정
		$('.inputCalendar').datepicker({

			// 날짜 포맷 변경
			 onSelect: function(formattedDate, date, inst) {
				 console.log(formattedDate);
//				 console.log(date);
//				 console.log(inst);

				 var week = ['일', '월', '화', '수', '목', '금', '토'];
				 var dayOfWeek = week[new Date(formattedDate).getDay()];

				 var newDate = formattedDate.substr(5,2) + "월 " + formattedDate.substr(8,2) + "일 " + "("+dayOfWeek+")";
				 inst.$el.val(newDate);
			 }
		});	

		// 시간입력 timepicker 설정
		$('.timepicker').timepicker({
			timeFormat: 'HH:mm', // 형식
			interval: 10, // 표현 단위 (분)
			minTime: '05',	// 시작시간
			maxTime: '23:50',	// 종료시간
			defaultTime: '',
			startTime: '05:00',	// 시작시간
			dynamic: false,
			dropdown: true,
			scrollbar: true
		});

		// 취소 버튼 클릭
		$("#btnPopCancel").click(function() {
			fnPopupClose();
		});
		
		// 업무요청 버튼 클릭
		$("#btnPopRequest").click(function() {
			alert("업무요청 프로세스 프로그래밍");
			return false;
		});
	});
</script>

<!-- 업무요청 -->
<div class="popup_guide popup_w1000">
	<a href="javascript:void(0)" class="closebtn" onclick="fnPopupClose()">닫기</a>
	<h3>업무요청</h3>
	<div class="popup_content">
		<div class=" content_col2 bg">
			<div>
				<ul>
					<li class="date_tit"><span>2021년 5월 10일 (월)</span></li>
					<li class="fc_red">대외협력기획실</li>
					<li>
						<dl class="use_box">
							<dt>가능</dt>
							<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd>
						</dl>
					</li>
					<li>
						<dl class="notuse_box">
							<dt>응답대기</dt>
							<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd>
						</dl>
					</li>
					<li>
						<dl class="notuse_box">
							<dt>불가능</dt>
							<dd><input type="checkbox"> 홍길순 (대외협력기획실, 책임) ☎ 042-388-0235</dd>
							<dd><input type="checkbox"> 윤수    (대외협력기획실, 선임) ☎ 042-388-0231</dd>
							<dd><input type="checkbox"> 홍순희 (기술혁신사업실, 책임) ☎ 042-388-0233</dd>
							<dd><input type="checkbox"> 경하경 (기술혁신사업실, 주임) ☎ 042-388-0238</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="bbs_write01">
				<ul>
					<li><span>사업명</span>
					<input type="text" class="input_w100" placeholder="세부사업명을 입력하세요.">
					</li>
					<li><span>기간</span>
					<input type="text" class="inputCalendar input_w40" name="" id="">
					~
					<input type="text" class="inputCalendar input_w40" name="" id="">
					</li>
					<li><span>평가시작시간 / 평가 완료시간</span>
					<input type="text" class="input_w30 ac timepicker" value="">
					/
					<input type="text" class="input_w30 ac timepicker" value="">
					</li>
					<li><span>요청업무</span>
					<input type="text" class="input_w100" value="평가 담당간사 지원요청">
					</li>
				</ul>
				<div class="btn_guide ac mt20">
					<button type="button" class="btn_style05 btn_gray" id="btnPopCancel">취소</button>
					<button type="button" class="btn_style05 btn_red" id="btnPopRequest">업무요청</button>
				</div>
				<!-- e :btn_guide -->
			</div>
			<!-- e :bbs_write01 -->
		</div>
		<!-- e :content_col2 -->
	</div>
	<!-- e :popup_content -->
</div>
<!-- e :popup_guide -->