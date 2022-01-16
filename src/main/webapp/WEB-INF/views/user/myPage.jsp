<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/user.css">

	<form class="myPageBox">
		<div>
			<h2>회원정보 수정</h2>
		</div>
		<div class="myPageGapBox"></div>
		<div style="margin-left: -505px; margin-bottom: 5px;">아이디</div>
			<input type="text" class="myPageBoxId" name="username" id="username" placeholder="ID" value="${userid}" disabled>
		</div>
		<div class="myPageGapBox"></div>
		<label for="password" style="margin-left: -490px; margin-bottom: 5px">비밀번호</label>
		<div class="myPagePasswd">
			<input type="password" name="password" id="pw-modify" placeholder="비밀번호를 입력해주세요">
		</div>

		<div class="myPageGapBox"></div>
		<label for="passwdCheck" style="margin-left: -450px; margin-bottom: 5px">비밀번호 확인</label>
		<div class="passwdCheck">
			<input type="password" name="passwdCheck" placeholder="비밀번호를 다시 입력해주세요.">
		</div>
		<div class="myPageGapBox"></div>
		<label for="name" style="margin-left: -520px; margin-bottom: 5px">이름</label>
		<div class="myPageName">
			<input type="text" name="name" id="name" value="${name}" placeholder="실명을 입력하세요." disabled>
		</div>
		<input type="hidden" id="id" value="${id}">
		<div class="myPageGapBox"></div>
		<label for="userEmail" style="margin-left: -470px; margin-bottom: 5px">이메일 주소</label>
		<div class="myPageEmail">
			<input type="email" name="email" id="modify-email" value="${email}" placeholder="이메일 주소를 입력해주세요.">
		</div>
		<div class="myPageGapBox"></div>
		<label for="birth" style="margin-left: -490px; margin-bottom: 5px">생년월일</label>
		<div class="birthDay">
			<input type="date" style="margin-left:150px;" name="birth" id="birth" value="${birth}" min="1980-01-01" max="2021-08-31" disabled>
		</div>
	</form>

		<div class="btnMyPage">
			<div class="btnCrt">
				<input type="button" class="btnCorrection" id="userinfo-modify-btn" value="회원정보 수정">
			</div>
			<div class="btnScs">
				<input type="button" class="btnSecession" id="userdrop" value="탈퇴">
			</div>
		</div>
		</div>
</body>
</html>


<script type="text/javascript" src="/js/user.js"></script>