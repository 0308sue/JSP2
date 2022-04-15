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
<table >
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
	<div align="center">
	<%
		if(count>0){
			int pageCount =count/pageSize +(count%pageSize == 0?0:1);
			int pageBlock =3;
			int startPage =(int)((currentPage-1)/pageBlock)*pageBlock+1;
			int endPage = startPage+pageBlock-1;
			if(endPage >pageCount){
				endPage = pageCount;
			}
			if(startPage > pageBlock){
			%>
			<a href="list.jsp?pageNum=<%=startPage-pageBlock%>&field=<%=field%>&word=<%=word%>">[이전]</a> 
			<%
			}
			
			for(int i =startPage; i<=endPage;i++){
				if(i == currentPage){
				%>
					[<%=i%>]
				<%
				}else{
					
				%>
				<a href="list.jsp?pageNum=<%=i%>&field=<%=field%>&word=<%=word%>"><%=i%></a> 
				<%	
				}
			}
			
			if(endPage < pageCount){
				%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock%>&field=<%=field%>&word=<%=word%>">[다음]</a> 
				<%
			}
		}
	%>
	</div>
</form>

</body>
</html>