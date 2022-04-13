<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String sid = (String)session.getAttribute("sUserid");

MemberDAO dao = MemberDAOImpl.getInstance();
dao.memberdelete(sid);
session.invalidate();
response.sendRedirect("loginForm.jsp");
%>