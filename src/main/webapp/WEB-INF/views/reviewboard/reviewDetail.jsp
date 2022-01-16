<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/review.css">

        <main>
            <form method="get" class="reviewDetailMain">
                <div class="reviewDetailGrid">
                    <div class="reviewDetailFlex">
                        <div class="reviewDeep">
                            <div class="reviewDetailTitle">
                                <input type="text" value="${board.title}" disabled>
                            </div>
                        </div>
                        <div class="reviewDeepTwo">
                            작성자 : <span class="reviewDetailWriter" ><i>${board.user.username} </i></span>
                            <span>작성일 :<fmt:formatDate pattern = "yyyy/MM/dd hh:mm a" value="${board.createDate}"/></span>
                        </div>
                    </div>
                    <div>
                        <a href="/board/${board.id}/updateForm"><input type="button" class="reviewDetailBtn" value="수정"></a>
                        <input type="hidden" id="id" value="${board.id}"/>
                        <input type="button" id="btn-delete" class="reviewDetailBtn" value="삭제">
                    </div>
                </div>
                <hr style="margin: 2% 2% 0 2%;" width="96%">
                <div class="reviewDetailText">
                    <textarea cols="50" rows="20">${board.content}</textarea>
                </div>
                <hr width="96%" style="margin: 0 2% 0 2%;">
                    <input type="button" class="reviewDetailGoList" value="목록으로 가기" onclick="history.back()">
            </form>
        </main>
        <script src="/js/board.js"></script>
    </body>
</html>