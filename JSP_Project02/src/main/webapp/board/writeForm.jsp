<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
request.setCharacterEncoding("utf-8");
int num = 0,ref =1,re_step =0,re_level =0;
if(request.getParameter("num")!=null){
	num = Integer.parseInt(request.getParameter("num"));
	ref = Integer.parseInt(request.getParameter("ref"));
	re_step = Integer.parseInt(request.getParameter("re_step"));
	re_level = Integer.parseInt(request.getParameter("re_level"));
}
%>
</head>
<body>
<h1>글쓰기</a></h1>
<br>
<form action="writePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>"/>
<input type="hidden" name="ref" value="<%=ref%>"/>
<input type="hidden" name="re_step" value="<%=re_step%>"/>
<input type="hidden" name="re_level" value="<%=re_level%>"/>
	<table border="1">
		<tr>
			<td align="right" colspan="2"><a href="list.jsp">글목록</a></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" > </td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<%
			if(request.getParameter("num")!=null){
				%>
				<input type="text" name="subject" value="[댓글]">
				<%	
			}else{
			%>			
			<input type="text" name="subject">
			<%
			}
			%>
			</td>
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