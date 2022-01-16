<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/faq.css">
        
        <div class="faqImg">
            <h1>문의 작성 페이지</h1>
        </div>
        <form>
            <input type="text" class="faqTitle" placeholder="제목을 입력해주세요." id="title">
            <textarea cols="50" rows="10" class="faqText" placeholder="문의하실 내용을 적어주세요." id="content"></textarea>
        </form>
        <input type="button" id="btn-save" class="btnFaqWrite" value="등록하기">
		<script src="/js/faq.js"></script>
    </body>
</html>