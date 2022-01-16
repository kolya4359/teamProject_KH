<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../layout/header.jsp"%>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/faq.css">

	<main>
		<div class="faqDetailMain">
			<div class="faqDetailGrid">
				<div class="faqDetailFlex">
					<div class="faqDeep">
						<div class="faqDetailTitle">
							<input type="text" value="${faq.title}" disabled>
						</div>
					</div>
					<div class="faqDeepTwo">
						작성자 : <span class="faqDetailWriter" ><i>${faq.user.username} </i></span>
                        <span>작성일 : <fmt:formatDate pattern = "yyyy/MM/dd hh:mm a" value="${faq.createDate}"/></span> 
					</div>
				</div>
				<div>
					<a href="/faq"><input type="button" class="faqDetailBtn" value="목록"></a>
					<a href="/faq/${faq.id}/updateForm"> <input type="button" class="faqDetailBtn" value="수정"></a> 
					<input type="hidden" id="id" value="${faq.id}" />
					<input type="button" id="btn-delete" class="faqDetailBtn" value="삭제">
				</div>
			</div>
			<hr width="96%" style="margin: 0 2% 0 2%;">
			<div class="faqDetailBox">
				<textarea cols="50" rows="7" disabled>${faq.content}</textarea>
			</div>

			<div class="card">
				<div class="card-header">댓글 리스트</div>
				<ul id="reply-box" class="list-group">
					<c:forEach var="reply" items="${faq.replys}">
						<li id="reply-${reply.id}" class="faqDetailGridBox">
							<div>${reply.content}</div>
							<div class="d-flex">
								<div class="font-italic">작성자 : ${reply.user.username} &nbsp;</div>
								<button onClick="index.replyDelete(${faq.id}, ${reply.id})" class="badge">삭제</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<form>
			<div class="faqDetailBoxTwo">
				<textarea cols="50" rows="7" placeholder="답변을 작성해 주세요." id="reply-content"></textarea>
			</div>
			<div class="faqDetailAnsBox">
				<input type="hidden" id="faqId" value="${faq.id}" />
				<input type="button" class="faqDetailAnsBtn" id="btn-reply-save" value="답변 작성하기">
			</div>
		</form>
		<script src="/js/faq.js"></script>
	</main>
</body>
</html>