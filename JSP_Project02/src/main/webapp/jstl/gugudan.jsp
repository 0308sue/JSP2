<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>구구단</h3>
<%
for(int i=1; i<10; i++){
	%>
	<%=i%>단<br>
	<%
	for(int j=1;j<10;j++){
%>
		<%=i%>*<%=j%> = <%=i*j%><br>
<%
	}
}
%>

<hr>
<c:forEach begin="1" end="9" var="dan" step="1"><!-- step 생략하면 1증가 -->
	${dan}단<br>
	<c:forEach begin="1" end="9" var="j">
	${dan}*${j }=${dan*j }<br>
	
	</c:forEach>

</c:forEach>




</body>
</html>