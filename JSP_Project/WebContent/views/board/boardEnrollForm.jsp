<%@page import="com.kh.board.model.vo.Category, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#enroll-form>table{board:1px solid white}
	
	#enroll-form input, #enroll-form textarea{
		width: 100%;
		box-sizing:border-box;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	
	<div class="outer">
		<br>
		<h2 align="center">일반게시판 작성하기</h2>
		<br>
		<!-- enctype : 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시 
			enctype="multipart/form-data" : 파일(<input type="file">)이 포함된 폼을 전송할 때 사용
		-->
		<form action="<%= contextPath%>/insert.bo" id="enroll-form" method="post" enctype="multipart/form-data">
		
			<!-- 카테고리, 제목, 내용, 첨부파일을 입력받고, 작성자 정보 -->
			<table align="center">
				<tr>
					<th width="100">카테고리</th>
					<td width="500">
						<select name="category">
							<% for(Category c : list) { %>
								<option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
							<% } %>
<!-- 							<option value="10">공통</option> -->
<!-- 							<option value="20">운동</option> -->
<!-- 							<option value="30">등산</option> -->
<!-- 							<option value="40">게임</option> -->
<!-- 							<option value="50">낚시</option> -->
<!-- 							<option value="60">요리</option> -->
<!-- 							<option value="70">기타</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" required></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
			</table>
			
			<br>
			<div align="center">
				<button type="submit">작성하기</button>
				<button type="reset">취소하기</button>
			</div>
			
		</form>
	
	</div>
</body>
</html>