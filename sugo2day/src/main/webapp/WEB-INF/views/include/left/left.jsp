<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						<li>사용자 이름(닉네임)
							<ol>
								<li>My Profile</li>
								<li>Edit Profile</li>
								<li>Settings</li>
							</ol>
						</li>
					</ul>
				</div>

				<!-- 퀘스트 정보 -->
				<div>
					<ul>
						<li>퀘스트
							<ol>
								<li>
								<a href=/project/quest/questReg>퀘스트 작성</a>
								<a href="<c:url value="/login" />">[로그인]</a>
								</li>
				
				
								
								<li>진행중인 퀘스트</li>
								<li>퀘스트 리스트</li>
								<li>결과 분석</li>
							</ol>
						</li>
				</div>

				<!-- 퀘스트 랭킹-->
				<div>
					<ul>
						<li>랭킹
							<ol>
								<li>파트별 랭킹</li>
								<li>누적 랭킹</li>
								<li>현재 랭킹</li>
								<li>나의랭킹</li>
							</ol>
						</li>
					</ul>
				</div>

				<!-- 스케줄러 -->
				<div>CLENDAR</div>
			</div>


		
		</div>
</body>
</html>