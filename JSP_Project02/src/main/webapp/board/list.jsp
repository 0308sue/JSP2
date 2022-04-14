<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
BoardDAO dao = BoardDAO.getInstance();
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";
}
String field = "";
String word = "";
if(request.getParameter("word")!=null){
	field = request.getParameter("feild");
	word = request.getParameter("word");
}

int currentPage = Integer.parseInt(pageNum);
int pageSize = 5;

int startRow = (currentPage-1)*pageSize+1;
int endRow = currentPage*pageSize;

ArrayList <BoardDTO> arr = dao.boardList(field,word,startRow,endRow);
int count = dao.getCount(field,word);
%>
</head>
<body>
<div align="right">
<a href="writeForm.jsp"></a>
</div>
<h2>전체보기(<%= count %>)</h2>
<a href="writeForm.jsp">글쓰기</a>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<%
	for(BoardDTO b:arr){
		%>
	<tbody>	
		<tr>
			<td><%= b.getNum() %></td>
			<td><a href="boardView.jsp?num=<%= b.getNum() %>"> <%= b.getSubject() %></a></td>
			<td><%= b.getWriter() %></td>
			<td><%= b.getReg_date() %></td>
			<td><%= b.getReadcount() %></td>
		</tr>
		</tr>
		<%
		}
		%>
	</tbody>
	</table>
<br> <br>
<form action="list.jsp" name="search" method="get">
<select name = "feild">
	<option value="subject">제목
	<option value="writer">작성자
</select>
	<input type="text" size="16" name="word">
	<input type="submit" value="찾기">
</form>

</body>
</html>