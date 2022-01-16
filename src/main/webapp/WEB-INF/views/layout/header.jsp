<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="서로의 여행 정보를 공유하는 사이트">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" type="text/css" href="/css/style.css?ver=3">
        <link rel="stylesheet" type="text/css" href="/css/header.css?ver=3">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>   
        <body class="jejumyeongjo">
        <div class="pageHeader">
            <div>
                <a href="/"><img class="logo" src="/images/logo1.png" alt="로고"></a>
            </div>
            <div>
                <a href="/board">후기페이지</a>
                <a href="/faq">문의페이지</a>
            </div> 
            <div>
                <c:choose>
                <c:when test="${empty principal}">
                <a href="/auth/loginForm" class="login">로그인</a></li>
                <a href="/auth/joinForm" class="login">회원가입</a></li>
                </c:when>
                <c:otherwise>
                <a href="/user/mypage">회원정보페이지</a>
                <a href="/logout">로그아웃</a>
                </c:otherwise>
                </c:choose>
            </div>            
        </div>
            