<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!-- Header 부분 -->

		<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

		<!-- Member 부분
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
		 -->
</body>
</html>