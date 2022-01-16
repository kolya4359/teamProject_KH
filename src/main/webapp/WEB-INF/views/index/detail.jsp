<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/detail.css">

	<div class="mainDetail">
			<div class="topDetail">
				<div>
					<h1 class="bigTitleDetail">${content.title}</h1>
				</div>
				<div class="reviewDetail">
					<input type="button" class="reviewDetailBtn" value="후기 작성하기" onclick="location.href='/board/saveForm'">
				</div>
			</div>
			<img src="${content.imgpath}" class="maindataDetail">
			<div class="contentsDetail">
				<div class="introDetail">
					<input type="text" class="smallTitleDetail" placeholder="주소" value="${content.address}" disabled>
					<textarea cols="50" rows="20" class="longIntroDetail" placeholder="간단한 소개글" disabled>${content.instruction}</textarea>
				</div>
				<div id="map" class="kakaoMap" >
					<!-- 카카오 지도 -->
					<table style="">
						<!-- 카카오 지도 설명 => 이 부분이 없으면 지도가 안나옴 -->
						<tr>
							<td style=""><table style="">
									<tr>
										<td style=""><table style="">
												<tr>
													<td style="">
														<div id="map_canvas"></div>
													</td>
												</tr>
											</table></td>
									</tr>
								</table></td>
						</tr>
					</table>
				</div>

			</div>
			<div class="lastDetail">
				<div class="miniDetailBox">
					<h1>사람들의 한줄평</h1>
				</div>
				<div class="miniTitle">
					<c:forEach var="reply" items="${content.replys}">
						<input type="text" class="dateWriter" placeholder="작성자" value="${reply.user.username}"> 
						<input type="text" class="dateWriter" value="${reply.createDate}" disabled style="margin-left: 10px;"> 
						<input type="text" class="deteText" placeholder="간단한 소개글을 작성해주세요." value="${reply.content}">
						<button class="deleteDetailBtn" onClick="index.replyDelete('${content.title}',${reply.id})">삭제</button>
					</c:forEach>
				</div>
				
				<form class="tinyOneReview">
					<input type="hidden" id="titleId" value="${content.title}">
					<input type="text" class="oneTextDetail" placeholder="한줄평을 입력해주세요." id="reply-content">
					<input type="button" class="btncommitDetail" id="btn-reply-save"  value="등록">
				</form>
				</div>
			</div>
	</div>

	<!-- 카카오 지도 스크립트 -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62da32945b5c454aa1ead3fcbcb82fe4"></script>
	<script>
       var container = document.getElementById('map');
       var options = {
           center: new kakao.maps.LatLng(${content.latitude}, ${content.longitude}),
           level: 8
       };

       var map = new kakao.maps.Map(container, options);


       // 지도 줌 컨트롤러

       // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
       var mapTypeControl = new kakao.maps.MapTypeControl();

       // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
       // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
       map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

       // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
       var zoomControl = new kakao.maps.ZoomControl();
       map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

       
       // 지도 마커 부분

       // 지도에 마커를 표시합니다 
       var marker = new kakao.maps.Marker({
           map: map, 
           position: new kakao.maps.LatLng(${content.latitude}, ${content.longitude})
       });

       // 커스텀 오버레이에 표시할 컨텐츠 입니다
       // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
       // 별도의 이벤트 메소드를 제공하지 않습니다 
       var content = '<div class="wrapp">' + 
                   '    <div class="info">' + 
                   '        <div class="title">' + 
                   '            ${content.title}' + 
                   '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                   '        </div>' + 
                   '        <div class="body"> <br>'  +   
                   '                <div class="ellipsis">${content.address}</div>' +   
                   '        </div>' + 
                   '    </div>' +    
                   '</div>';

       // 마커 위에 커스텀오버레이를 표시합니다
       // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
       var overlay = new kakao.maps.CustomOverlay({
           content: content,
           map: map,
           position: marker.getPosition()       
       });

       // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
       kakao.maps.event.addListener(marker, 'click', function() {
           overlay.setMap(map);
       });

       // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
       function closeOverlay() {
           overlay.setMap(null);     
       }
      </script>
      <script src="/js/detail.js"></script>
       
</body>
</html>

