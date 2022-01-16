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
						<span class="forgotId"><a onclick="document.getElementById('idBox').style.display='block'" href="#" style="color: #ffc107 !important;">ID 찾기</a></span>
						</div>
						<div>
						<span class="psw"><a href="#" onclick="document.getElementById('idBox_pw').style.display='block'" style="color: #ffc107 !important;">비밀번호 찾기</a></span>
						</div>

                    <div class="GapBox"></div>
                    <div>
                        <span><p>저희 사이트가 처음이세요?</p></span>
                        <span><a href="/auth/joinForm" style="text-decoration:underline; color:skyblue">회원가입하기</a></span>
                    </div>
                </div>
            </form><!-- main-container-->

			<div id="idBox" class="modal">
	
				<form class="modal-content animate" action="/find/email" method="post">
					  <div class="container" style="text-align: center">
						<h2><b>ID찾기</b></h2>
					</div>
						  <p style="text-align: center"> 💌 가입시 입력한 이메일로 가입여부를 체크합니다.</p>
					  
					  <div class="container-email">
						 <input type="email" class="loginEmail" placeholder="이메일을 입력해주세요 ex) email@email.com" name="userEmail" required>
		
						  <button type="submit" class="findBtn" onclick="document.getelementById('idBox').style.display='block'">아이디 찾기</button>
					  </div>
					  <div class="container" style="background-color:#f1f1f1">
						  <button type="button" onclick="document.getElementById('idBox').style.display='none'" class="cancelBtn">Cancel</button>
						  <!-- document.getElementById('idBox').style.display='none' -->
					  </div>
				</form>
				</div>
				
				<div id="idBox_pw" class="modal">
				<form class="modal-content animate" action="/find/password" method="post">
					  <div class="container" style="text-align: center">
						<h2><b>비밀번호 찾기</b></h2>
					</div>
					<br>
						  <p style="text-align: center"> 💌 가입시 입력한 ID와 이메일로 가입여부를 체크합니다.</p>
						  <p style="text-align: center"> 💌 가입시 입력한 이메일로 임시 비밀번호를 발송해드립니다.</p>
			  
					  <div class="container-email">
						 <input type="text" class="loginEmail" placeholder="ID를 입력해주세요" name="username" required>
						  <div><br></div>
						 <input type="email" class="loginEmail" placeholder="이메일을 입력해주세요 ex) email@email.com" name="userEmail" required>
		
						  <button type="submit" class="findBtn" onclick="document.getelementById('idBox_pw').style.display='block'">임시 비밀번호 발송</button>
					  </div>
					  <div class="container" style="background-color:#f1f1f1">
						  <button type="button" onclick="document.getElementById('idBox_pw').style.display='none'" class="cancelBtn">Cancel</button>
						  <!-- document.getElementById('idBox').style.display='none' -->
					  </div>
				</form>
				</div>
				
				<script>
				// Get the modal
				var modal = document.getElementById('idBox');
				var model = document.getElementById('idBox_pw');
		
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
				

				
				// 로그인 유효성 검사
				var Login__submitDone = false;
		
				function Login__submit(form) {
					
					if ( Login__submitDone ) {
						alert('처리중입니다.')
						return;
					}
					
					form.username.value = form.username.value.trim();
					
					if ( form.username.value.length == 0 ) {
						alert('로그인 아이디를 입력해주세요.');
						return;
					} 
					
					form.password.value = form.password.value.trim();
					
					if (form.password.value.length == 0 ) {
						alert('비밀번호를 입력해주세요.')
						return;
					}
					
					
					form.submit();
					Login__submitDone = true;
				}
				</script>
    </body>
</html>