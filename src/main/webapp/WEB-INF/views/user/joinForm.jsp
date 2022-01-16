<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/user.css">


	<form class="joinBox">
			<div>
				<h2>회원가입</h2>
			</div>
			<div class="joinGapBox"></div>
				<div style="margin-left: -505px; margin-bottom: 5px;">아이디</div>
				<div class="joinBoxId">
					<input type="text" class="joinBoxIdInput" name="username" id="username" placeholder="ID">
					<input type="button" class="btnCheck" id="btnCheck" value="중복확인">
					<span></span>
				</div>
			</div>
			<div class="joinGapBox"></div>
			<label for="password" style="margin-left: -490px; margin-bottom: 5px">비밀번호</label>
			<div class="boxpasswd">
				<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
			</div>

			<div class="joinGapBox"></div>
			<label for="passwd_check" style="margin-left: -450px; margin-bottom: 5px">비밀번호 확인</label>
			<div class="password_check">
				<input type="password" name="passwd_check" placeholder="비밀번호를 다시 입력해주세요.">
			</div>
			<div class="joinGapBox"></div>
			<label for="name" style="margin-left: -520px; margin-bottom: 5px">이름</label>
			<div class="name">
				<input type="text" name="name" id="name" placeholder="실명을 입력하세요.">
			</div>
			<div class="joinGapBox"></div>
			<label for="userEmail" style="margin-left: -470px; margin-bottom: 5px">이메일 주소</label>
			<div class="email">
				<input type="email" name="userEmail" id="userEmail" placeholder="이메일 주소를 입력해주세요.">
			</div>
			<div class="joinGapBox"></div>
			<label for="birth" style="margin-left: -490px; margin-bottom: 5px">생년월일</label>
			<div class="birthday">
				<input type="date" style="margin-left:150px;" name="birth" id="birth" min="1980-01-01" max="2021-08-31">
			</div>
			<div class="btn_sign_up" style="margin-top: 20px; color:#fff">
			<input type="button" id="btn-save" value="회원가입">
		</div>
	</form>
        
    <script src="/js/user.js"></script> 
	<script>
		$(function(){
			$('#btnCheck').click(register.idCheck);
		$('#btn-save').on('click', register.send);
		});

		var register = {
			isIDCheck: false,
		idCheck: function(){
			//console.log(this);				//이벤트가 발생한 객체를 가르킴
		// console.log(register);		
			
			var $username = $('#username');
			
			//빈값 체크
			if(!$username.val()){
				//$username.parent().after('<p>아이디를 입력하세요</p>').next().css('color', 'red');
			$username.nextAll('span').html('아이디를 입력하세요').css('color', 'red');
			return;
			}else{
				$username.isIDCheck = true;
			$username.nextAll('span').html('');
			alert('중복체크를 했습니다.');
			}
			
			//중복체크 버튼 이벤트 제거
			//$('#btn-idcheck').off('click');
		
		},
		send: function(){
			if(!register.isIDCheck){
				alert('아이디 중복체크를 하세요.');
			return;
			}
			
			alert('가입되었습니다.');
		}
		}
	</script>   
        
    </body>
</html>