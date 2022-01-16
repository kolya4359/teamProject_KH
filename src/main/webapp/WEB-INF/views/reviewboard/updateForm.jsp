<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/review.css">
        
    <div class="reviewImg">
        <h1>후기</h1>
        <h3 class="reviewH3">When you walk along the blue valley and the white sky,<br>
        you arrive the green valley.</h3>
    </div>
    <form>
        <input type="text" class="reviewTitle" name="title" id="title" value="${board.title}">
        <textarea cols="50" rows="10" class="reviewText" name="content" id="content">${board.content}</textarea>
        <input type="hidden" id="id" value="${board.id}"/>
        
    </form>

    <input type="button" id="btn-update" class="btnReview" value="수정하기">

    <script src="/js/board.js"></script>
</body>
</html>