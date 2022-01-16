<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css?after">
<link rel="stylesheet" href="/css/faq.css?after">

        <div class=faqImg>
            <h1>문의 페이지</h1>
        </div>
        
        <main class="faqMain">
            <div>
                <div class="faqList">
                    <div class="faqListHead">
                        <div class="num">번호</div>
                        <div class="tit">제목</div>
                        <div class="writer">글쓴이</div>
                        <div class="faqdate">작성일</div>
                    </div>
                    <div class="faqListBody">
					<c:forEach var="faq" items="${faqs.content}">
						<div class="item">
							<div class="num">${faq.id}</div>
							<div class="tit"><a href="/faq/${faq.id}">${faq.title}</a></div>
							<div class="writer">${faq.user.username}</div>
							<div class="faqdate"><fmt:formatDate pattern = "yyyy/MM/dd hh:mm a" value="${faq.createDate}"/></div>
						</div>
					</c:forEach>
				</div>
                </div>
                <div class="paging">
                    <a class="bt prev" href="?page=${faqs.number-1}">이전 페이지</a>
                    <a class="bt next" href="?page=${faqs.number+1}">다음 페이지</a>
                </div>
            </div>
            <div>
                <input type="button" class="btnFaqWrite" value="작성하기" onclick="location.href='/faq/saveForm'">
            </div>
        </main>
    <script>
        var dt = new Date();
            var time = dt.getHours() + ":" + dt.getMinutes() + ":"+" ";
            time+= dt.getHours()>=12?"PM":"AM"
            document.getElementById("dt").innerHTML = time;
    </script>
    </body>
</html>