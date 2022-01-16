let index = {
	init:function() {
		$("#btn-reply-save").on("click", () => {

			this.replySave();
		});
		
	},

	replySave:function() {
		let data = {
			content: $("#reply-content").val()
		};

		let titleId = $("#titleId").val();

		$.ajax({
			type: "POST",
			url: `/detail/${titleId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("댓글작성이 완료되었습니다.");
			location.href = `/detail/${titleId}`;
		}).fail(function(error) {
			location.href = `/auth/loginForm`;
		});

	},
	
	replyDelete:function(titleId, replyId) {
		$.ajax({
			type: "DELETE",
			url: `/detail/${titleId}/reply/${replyId}`,
			dataType: "json"
		}).done(function(resp) {
			alert("댓글삭제 성공");
			location.href = `/detail/${titleId}`;
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

}

index.init();