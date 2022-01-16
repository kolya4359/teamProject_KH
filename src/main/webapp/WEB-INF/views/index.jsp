<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <meta name="description" content="서로의 여행 정보를 공유하는 사이트">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/indexSearch.css">
    </head>

    <body class="jejumyeongjo">
        <header class="page-header wrapper">
            <img class="indexLogo" src="/images/logo1.png" onclick="location.href='/'" alt="로고">
            <nav>
                <ul class="main-nav">
                    <li><a href="/board">후기페이지</a></li>
                    <li><a href="/faq">문의페이지</a></li>
                    <li></li>
                    <li></li>
                    <c:choose>
                	<c:when test="${empty principal}">
					<li><a href="/auth/loginForm" style="color: black; font-size: 1.15rem;">로그인</a></li>
                    <li><a href="/auth/joinForm" style="color: black; font-size: 1.15rem;">회원가입</a></li>
					</c:when>
					<c:otherwise>
					
					<li><a href="/user/mypage">회원정보페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					</c:otherwise>
					</c:choose>
                </ul>

            </nav>
        </header>
        <div class="indexBox">
            <img src="/images/mainPont.png">
            <div class="indexSearchBox"></div>
            
            <form action="/search" method="get">
            <div class="search">
                <input type="text" name="keyword" placeholder="검색어 입력">
                <button>검색</button>          
            </div>
            </form>
            
        </div>
        
        <div class="indexContainer">
            <form action="/search/${api.title}" method="get">
            <h2>추천 여행지</h2>
            
            <div class="indexGrid">
                <c:forEach var="random" items="${randomIndex}"> 
                    <div class="item" style="cursor:pointer" onclick="location.href='/detail/${random.title}'">
                       <div class="indexRandomImg"><img src="${random.thumbnailpath}"></div>
                        <p>${random.title}</p>
                    </div>		
                </c:forEach>
            </div>
            </form>
        </div>

</body>
</html>