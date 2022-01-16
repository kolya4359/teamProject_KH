<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/user.css">

            <form action="/auth/loginProc" method="post" onsubmit="Login__submit(this); return false;" class="loginMainBox">
                <div>
                    <img src="/images/background1.png" class="loginImg" alt="로그인 이미지">
                </div>
                <div class="loginBox">
                    <div>
                    	<c:if test="${param.error}">
   							<p style="color: red; font-weight: 700">${exception}</p>
						</c:if>
						<br>
                        <h3>로그인</h3>
                    </div>
                    <div class="GapBox"></div>
                    <div class="loginId">
                        <input type="text" placeholder="ID" id="username" name="username">
                    </div>
                    <div class="GapBox"></div>
                    <div class="loginPasswd">
                        <input type="password" placeholder="비밀번호를 입력해주세요." id="password" name="password">
                    </div>
                    <div class="GapBox"></div>
                    <div class="btnLogin">
                        <input type="submit" onclick="location.href='/'" value="로그인"> 
                    </div>
                    <div class="GapBox"></div>
                    <div class="btnKakao">
	                    <a href="https://kauth.kakao.com/oauth/authorize
						?client_id=5cc502515c3774ea8102a09ba2ba1bcc
						&redirect_uri=http://localhost:8111/auth/kakaologin
						&response_type=code">
                        <input type="button" value="카카오톡 로그인">
                        </a>
                    </div> 

						<div style="margin: 10px 0">
						<span class="forgotId"><a onload="document.getElementById('idBox2').style.display='block'">ID 찾기</a></span>
						</div>
						<div>
						<span class="psw"><a href="#" onclick="document.getElementById('idBox_pw').style.display='block'" style="color: #ffc107 !important;">비밀번호 찾기</a></span>
						</div>
						
                    <div class="GapBox"></div>
                    <div">
                        <span><p>저희 사이트가 처음이세요?</p></span>
                        <span><a href="/auth/joinForm" style="text-decoration:underline; color:skyblue">회원가입하기</a></span>
                    </div>
                </div>
            </form><!-- main-container-->

       
         
<div id="idBox2" class="modal">
	<div class="modal-content animate">
		<div class="container" style="text-align: center">
			<h1><b>ID 찾기</b></h1>
		</div>
		<br>
		<div class="container-email">
	     	<h3> ✔ 검색 결과  </h3>
		</div>
		<hr><br>
		<div>
			<h5>
				<span> 가입하신 아이디는 ' <b>${userId}</b> ' 입니다. </span>
			</h5><br>
	 	</div>
		<div class="container" style="background-color:#f1f1f1">
     		<button type="button" onclick="document.getElementById('idBox2').style.display='none'" class="cancelbtn">Cancel</button>
   		</div>
  	</div>
</div>
 
<script>
// Get the modal
var modal = document.getElementById('idBox2');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

window.onload = function(event) {
	var modal = document.getElementById('idBox2').style.display="block";
}

</script>
</body>
</html>