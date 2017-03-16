<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC 게시판</title>
</head>

<body>
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">MVC 게시판</td>
		</tr>
		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>

			<td style="font-family: 돋음; font-size: 12">
			</td>
		</tr>

		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<table border=0 width=490 height=250 style="table-layout: fixed">
					<tr>
						<td valign=top style="font-family: 돋음; font-size: 12">#{board.num} 
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">첨부파일</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<%
					
				%> 
				
			</a> <%
 	
 %>
			</td>
		</tr>

		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5"><font size=2> <a
					href="./BoardReply.bo?num="> [답변]
				</a>&nbsp;&nbsp; <a
					href="./BoardModify.bo?num=${board.num}>"> [수정] </a>&nbsp;&nbsp;
					<a href="./BoardDelete.bo?num="> [삭제]
				</a>&nbsp;&nbsp; <a href="./BoardList.bo">[목록]</a>&nbsp;&nbsp;
			</font></td>
		</tr>
	</table>
	<!-- 게시판 수정 -->
</body>
</html>