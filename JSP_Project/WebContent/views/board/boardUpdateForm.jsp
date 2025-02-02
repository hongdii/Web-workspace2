<%@page import="java.util.ArrayList, com.kh.board.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
	ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("list");
    Board b = (Board) request.getAttribute("b");
    Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#update-form>table{border:1px solid white}
	#update-form input , #update-form textarea{
		width: 100%;
		box-sizing: border-box;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp"%>
	
	
	<div class="outer">
		<br>
		<h2 align="center">일반게시판 수정하기</h2>
		<br>
		<!-- enctype : 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시 
			enctype="multipart/form-data" : 파일(<input type="file">)이 포함된 폼을 전송할 때 사용
		-->
		<form action="<%= contextPath%>/update.bo" id="update-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
			<!-- 카테고리, 제목, 내용, 첨부파일을 입력받고, 작성자 정보 -->
			<table align="center">
				<tr>
					<th width="100">카테고리</th>
					<td width="500">
						<select name="category">
							<% for(Category c : list) { %>
								<option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
							<% } %>
							<!-- 내가 선택한 카테고리가 자동으로 선택되어있도록 작업해주기(js활용) -->
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%= b.getBoardTitle() %>" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" required><%= b.getBoardContent() %></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<% if(at != null) { %>
							<%= at.getOriginName() %>
							<!-- 원본파일의 파일번호, 수정명을 hidden 함께 전송할 예정 -->
							<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
							<input type="hidden" name="changeFileName" value="<%= at.getChangeName() %>">							
						<% } %>
						<input type="file" name="upfile">
					
					</td>
				</tr>
			</table>
			
			<br>
			<div align="center">
				<button type="submit">수정하기</button>
			</div>
			
		</form>
	
	</div>
</body>
</html>