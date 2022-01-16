let index = {
	init: function(){
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteByid();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		$("#btn-reply-save").on("click",()=>{
			this.replySave();
		});
	},
	
	save:function(){
		
		let data={
			title:$("#title").val(),
			content:$("#content").val()
		};
		
		
		$.ajax({
			type: "POST",
			url:"/api/faq",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/faq";
		}).fail(function(error){
			location.href = `/auth/loginForm`;
		});
	},
	
	deleteByid:function(){
		let id = $("#id").val();
		
		$.ajax({
			type: "DELETE",
			url:"/api/faq/"+id,
			data: JSON.stringify(id),
			dataType:"json"
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/faq";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update:function(){
		let id = $("#id").val();
		
		let data={
			title:$("#title").val(),
			content:$("#content").val()
		};
		
		
		$.ajax({
			type: "PUT",
			url:"/api/faq/"+id,
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("글수정이 완료되었습니다.");
			location.href="/faq";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replySave:function(){
		let data={
			content:$("#reply-content").val()
		};
		let faqId = $("#faqId").val();
		
		$.ajax({
			type: "POST",
			url:`/api/faq/${faqId}/reply`,
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("댓글작성이 완료되었습니다.");
			location.href=`/faq/${faqId}`;
		}).fail(function(error){
			location.href = `/auth/loginForm`;
		});
	},
	
		replyDelete:function(faqId, replyId){
		$.ajax({
			type: "DELETE",
			url:`/api/faq/${faqId}/reply/${replyId}`,
			dataType:"json"
		}).done(function(resp){
			alert("댓글삭제 성공");
			location.href=`/faq/${faqId}`;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
}

index.init();
