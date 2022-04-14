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
%>
</head>
<body>
<h2>글 수정하기</h2>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%= b.getNum()%>">
	<table border="1">
		<tr>
			<td align="right" colspan="2"><a href="list.jsp">글목록</a></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" value="<%= b.getWriter()%>" ></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"  value="<%= b.getSubject()%>">
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" name="email"  value="<%= b.getEmail()%>"> </td>
		</tr>
		<tr>
			<th>내용</th>
			<td> <textarea cols="50" rows="10" name="content"> <%= b.getContent()%></textarea> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="수정하기"> 
			<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>