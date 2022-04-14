<%@page import="com.board.dto.BoardDTO"%>
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
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = BoardDAO.getInstance();
BoardDTO b =dao.findByNum(num);
int ref = b.getRef();
int re_step = b.getRe_step();
int re_level = b.getRe_level();
%>

<script >
function del() {
	if(confirm("정말 삭제할까요?")){
		location.href="deletePro.jsp?num=<%=num%>";	
	}
	
}

</script>

</head>
<body>
<h2>상세보기</h2>
<table border="1">
	<tr>
		<th>글번호</th>
		<td><%=b.getNum() %></td>
		<th>조회수</th>
		<td><%=b.getReadcount() %></td>
	<tr>
		<th>작성자</th>
		<td><%=b.getWriter() %></td>
		<th>작성일</th>
		<td><%=b.getReg_date() %></td>
	</tr>
	<tr>
		<th>글제목</th>
		<td colspan="3"><%=b.getSubject() %></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colspan="3"><%=b.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4" >
		<input type="button" value="글수정폼" onclick="location.href='updateForm.jsp?num=<%=num%>'"> 
		<input type="button" value="글삭제" onclick="del()">
		<input type="button" value="답글쓰기" onclick="location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"> 
		<input type="button" value="글목록" onclick="location.href='list.jsp'"> 
		</td>
	</tr>
	</table>
</body>
</html>