<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body class="jejumyeongjo">
        
<div class="container" style="margin-top: 300px;">

<h1>검색결과 : ${keywordList}</h1> <br>

<c:forEach var="api" items="${apiList}"><br>
	
<div class="card" onclick="location.href='/detail/${api.title}'" style="max-width: 900px; margin: 0 auto; border-color: #b8b8b8; cursor:pointer">
	<form action="/search/${api.title}" style="display: grid; grid-template-columns: 50% 50%;" method="get">
    <div class="card-body" style="padding:0;">
    	<div style="display: block; width: 100%; max-width: 300px; float:left;"></div>
            <div>
                <img src="${api.thumbnailpath}">
            </div>
            </div>
            <div>
                <h4 style="text-align: center; margin-top: 100px;">${api.title}</h4><br>
                <p class="card-text" style="text-align: center">${api.address}</p>
            </div>
        </div>
     </div>
     </form>
     
</div>

</c:forEach> 

</div>

<c:choose>
<c:when test="${empty apiList}">
<h2 style="text-align: center; margin-top: 150px; margin-bottom: 330px">검색 결과가 없습니다.</h2>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>

        
    </body>
</html>