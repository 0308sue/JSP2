<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>
<br>
<form action="writePro.jsp" method="post">
	<table border="1">
		<tr>
			<td align="right" colspan="2"><a href="">글목록</a></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" > </td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject">
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" name="email"> </td>
		</tr>
		<tr>
			<th>내용</th>
			<td> <textarea cols="50" rows="10" name="content"></textarea> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="글쓰기"> 
			<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>