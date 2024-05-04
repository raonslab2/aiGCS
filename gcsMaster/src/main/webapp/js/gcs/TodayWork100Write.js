	;(function() {
	 
		$(function() {
			//js first start
		 
		
		}); 
		
		//data save evnet
	    $("#dataInsert").click(function(){
	      // var tdSubject = $("#tdSubject").val();
            var formSer = $('#insertForm').serialize();
			$.ajax({
				url : '/gcs/TD0001/insertTodayWork100Write.do' //
				, type : 'post'
				, data :formSer
			}).done(function(res) {
		 
				if(res.result=="0"){
					alert("insert Success ");
				}
				 
			}).fail(function() {
				alert("실패");
			});
	    });


        $("#btn-list").click(function() {
             window.location.href = "/gcs/TD0001/TodayWork100.do";
        });


	})();
	
 
 