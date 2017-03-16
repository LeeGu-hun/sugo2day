<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!-- Header 부분 -->

		<div id="div-header">
			<p>
				<b><a href="#">This is a link1</a></b>
				<b><a href="#">This is a link2</a></b>
				<b><a href="#">This is a link3</a></b>
			</p>
			<h3>헤더 영역</h3>

		<!-- Member 부분 -->
			<div id="member-box">
				<c:if test="${empty authInfo }">
					<p><a href="<c:url value="/login" />">[로그인]</a>&nbsp;&nbsp;&nbsp;
					<a href="<c:url value="/register/registerTerm" />">[회원가입]</a></p>		
				</c:if>
				<c:if test="${!empty authInfo }">
					<p>${authInfo.name }님, 환영합니다.</p>
					<p><a href="<c:url value='/logout' />">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/edit/changePassword' />">[비밀번호 변경]</a></p>
					<a href="<c:url value="/boardList" />">[게시판]</a></p>
			</c:if>
			</div>
		</div>
</body>
</html>