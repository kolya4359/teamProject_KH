<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/faq.css">

        <main>
            <form method="get" class="faqDetailMain">
                <div class="faqDetailGrid">
                    <div class="faqDetailFlex">
                        <div class="faqDeepTwo">
                            <div class="faqDetailTitle">
                                <input type="text" value="${faq.title}" id="title" disabled>
                            </div>
                        </div>
                        <div class="faqDeepTwo">
                            작성자 : <span class="faqDetailWriter"><i>${faq.user.username}</i></span>
                        </div>
                    </div>
                </div>
                <hr width="96%" style="margin: 0 2% 0 2%">
                <div class="faqDetailBox">
                    <textarea cols="50" rows="10" id="content">${faq.content}</textarea>
                </div>
            </form>
            	<div class="faqDetailAnsBox">
            		<input type="hidden" id="id" value="${faq.id}"/>
                    <input type="button" class="faqDetailAnsBtn" id="btn-update" value="글수정완료">
                </div>
		<script src="/js/faq.js"></script>
        </main>
    </body>
</html>


