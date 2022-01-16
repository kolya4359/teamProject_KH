<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/style.css?after">
<link rel="stylesheet" type="text/css" href="/css/review.css?after">
	
        <div class="reviewImg">
            <h1>후기</h1>
            <h3 class="reviewH3">When you walk along the blue valley and the white sky,<br>
            you arrive the green valley.</h3>
        </div>
        <main class="reviewMain">
            <div>
                <div class="reviewList">
                    <div class="reviewListHead">
                        <div class="num">번호</div>
                        <div class="tit">제목</div>
                        <div class="writer">글쓴이</div>
                        <div class="reviewDate">작성일</div>
                    </div>
                    
        <!--             <form action="/board" method="get"> -->
                    
                    <div class="reviewListBody">
                    <c:forEach var="board" items="${boards}">
                        <div class="item">
							<div class="num"><a href="/board/${board.id}">${board.id}</a></div>
                            <div class="tit"><a href="/board/${board.id}">${board.title}</a></div>
                            <div class="writer">${board.user.username}</div> 
                            <div class="reviewDate"><fmt:formatDate pattern = "yyyy/MM/dd hh:mm a" value="${board.createDate}"/></div>     
                        </div>
                     </c:forEach>
                    </div>                  
                <!--    </form> -->
            </div>
        </main>
        <input type="button" class="btnReviewWrite" value="작성하기" onclick="location.href='/board/saveForm'">
    </body>
</html>