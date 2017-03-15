<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원가입 입력 페이지 -->
	<div id="rg_from">
		<div id="trem_header_2">
			<h1>
				<a class="trem_logo">수고했어 오늘도</a>
				<!-- a태그에 href="http://www.수고했어 오늘도 추가 해야함" -->
			</h1>
		</div>
		<div id="trem_body_2">
			<div id="trem_content_2">
				<div id="form_body">
					<form>
					<!-- form을 어떤걸 넣어야할지..ㅠㅠ -->
						<fieldset class="form_join_1">
							<div id="fj_top" class="fj_row">
								<div id="join_mail" class="join_row">
									<span id="mail_box">
										<input type="text" id="f_mail" autocomplete="off" placeholder="이메일" class="int">
										<label id="lb_mail">이메일</label>
									</span>
								</div>
								<div id="join_pwd" class="join_row">
									<span id="pwd_box">
										<input type="password" id="f_pwd" autocomplete="off" placeholder="비밀번호" class="int">
										<label id="lb_pwd">비밀번호</label>
									</span>
								</div>
								<div id="join_pwd_cof" class="join_row">
									<span id="pwd_cof_box">
										<input type="password" id="f_pwd_cof" autocomplete="off" placeholder="비밀번호확인" class="int">
										<label id="lb_pwd_cof">비밀번호확인</label>
									</span>
								</div>
								<!-- 비밀번호 비밀번호 확인이 일치하게끔 설정해야함 -->
							</div>
						</fieldset>
						<fieldset class="form_join_2">
							<div id="fj_mid" class="fj_row">
								<div id="join_nick" class="join_row">
									<span id="nick_box">
										<input type="text" id="f_nick" autocomplete="off" placeholder="닉네임" class="int">
										<label id="lb_nick">닉네임</label>
									</span>
								</div>
								<div id="join_radio" class="join_row">
									<span id="radio_box">
										<span id="rb_man" class="rb_select">
											<input type="radio" id="man" value="0" class="gender_check" onclick="man()?">
											<label id="lb_man">남자</label>
										</span>
										<span id="rb_woman" class="rb_select">
											<input type="radio" id="woman" value="1" class="gender_check" onclick="woman()?">
											<label id="lb_woman">여자</label>
										</span>
										<!-- 온클릭 설정 부탁드려용  -->
									</span>
								</div>
								<div id="join_birthday" class="join_row">
									<div id="join_sb">
										<span>
											생일
										</span>
										<span class="year_sb" class="join_sb">
											<input type="hidden" name="memBirth"> 
											<select id="year">
												<option>년도</option>
											</select>
										</span>
										<span class="month_sb" class="join_sb">
											<input type="hidden" name="memBirth">
											<select id="month">
												<option>월</option>
											</select>
										</span>
										<span class="day_sb" class="join_sb">
											<input type="hidden" name="memBirth">
											<select id="day">
												<option>일</option>
											</select>
										</span>
									</div>
								</div>
								<div id="join_check" class="join_row">
									<span id="check_box">
										<span  id="cb_business" class="cb_select">
											<input type="checkbox" id="business">
											<label>
												기업회원
											</label>
										</span>
									</span>
								</div>
							</div>
						</fieldset>
						<div id="button_cof">
							<span>
								<a href="#" onclick="submitDisagree();" id="form_discof">
									취소
								</a>
							</span>
							<span>
								<a href="#" onclick="submitagree();" id="form_cof">
									확인
								</a>
							</span>
							<!-- 확인버튼을 눌렀을때 회원가입완료 페이지(registerEnd)으로 이동 취소 버튼누를시 메인화면으로 / 확인버튼은 초록색 취소는 빨강색 -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>