<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList, com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
/* 		최소값 높이 800px로 지정. 사진 튀어나오는거 방지  */
		min-height: 800px;
	}
	.list-area{
		width: 760px;
		margin: auto;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br> <h2 style="text-align:center">사진게시판</h2> <br>
		
		<% if(loginUser != null) { %>
			<div align="right" style="width: 860px">
				<a href="<%= contextPath %>/insert.th" class="btn btn-secondary">글작성</a>
				<br><br>
			</div>
		<% } %>
		<div class="list-area">
<!-- 		 리스트목록을 가져오고 -->
<!-- 		리스트목록 for문을 이용 -->
			
			<% for( Board b : list) {%>
				<div class="thumnail" align="center">
					<input type="hidden" value="<%= b.getBoardNo() %>">
<%-- 					<%= b.setTitleImg(at.getChangeName()+at.getFilePath()) %> --%>
					<img src="<%=contextPath %>/<%= b.getTitleImg() %>" width="200px" height="150px">
<!-- 					titleImg -->
					<p>
						NO.<%= b.getBoardNo() %> <%= b.getBoardTitle() %><br>
						조회수 : <%= b.getCount() %>
					</p>
				</div>
			<% } %>
			
			
		</div>
	
	
	</div>
	
	<script>
		$(function(){
			
			$(".thumnail").click(function(){
				location.href = "<%= contextPath %>/detail.th?bno="+$(this).chilren().eq(0).val();
			})
		});
	</script>
	
</body>
</html>