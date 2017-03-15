<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
ul {
	padding: 20px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	list-style: none;
}

li {
	text-align: center;
	list-style: none;
	padding: 5px;
}
</style>



</head>
<body>
	<!-- CSS는 추후에 -->




	<!-- Content 부분 -->
	<div id="div-content">
		<!-- 여기서 로그인 Form // 회원가입 만들어라 -->


		<div id="MainMenu">

			<!-- 사용자 정보 -->
			<div>
				★★★★★ <br> 프로필사진<br> ★★★★★ <br>

				<ul>
					<li><b>사용자 이름(닉네임)</b>
						<ol>
							<li>My Profile</li>
							<li>Edit Profile</li>
							<li>Settings</li>
						</ol></li>
				</ul>
			</div>

			<!-- 퀘스트 정보 -->
			<div>
				<ul>
					<li><b>퀘스트</b>
						<ol>
							<li><a href=/sugo2day/quest/questReg>퀘스트 작성</a></li>
							<li>진행중인 퀘스트</li>
							<li><a href=/sugo2day/quest/questList>진행한 퀘스트</a></li>
						</ol></li>
			</div>

			<!-- 퀘스트 랭킹-->
			<div>
				<ul>
					<li><b>랭킹</b>
						<ol>
							<li>파트별 랭킹</li>
							<li>누적 랭킹</li>
							<li>현재 랭킹</li>
							<li>나의랭킹</li>
						</ol></li>
				</ul>
			</div>

			<!-- 스케줄러 -->
			<div>
				<b>CLENDAR<b></b>
			</div>
		</div>



	</div>
</body>
</html>