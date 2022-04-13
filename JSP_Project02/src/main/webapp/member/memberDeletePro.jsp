<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");

String userid = request.getParameter("userid");
MemberDAO dao = MemberDAOImpl.getInstance();
dao.memberdelete(userid);
ArrayList<MemberDTO> arr = dao.memberList();
int count = dao.getCount();


JSONArray jarr = new JSONArray();
for(MemberDTO m : arr){
	String mode =m.getAdmin() == 0?"일반회원":"관리자";
	JSONObject obj = new JSONObject();
	obj.put("name",m.getName());
	obj.put("userid",m.getUserid());
	obj.put("emile",m.getEmail());
	obj.put("phone",m.getPhone());
	obj.put("pwd",m.getPwd());
	obj.put("admin",mode);
	jarr.add(obj);
}
JSONObject countObj = new JSONObject();
countObj.put("count",count);

JSONObject mainObj = new JSONObject();
mainObj.put("jarrObj", jarr);
mainObj.put("countObj", countObj);

out.println(mainObj.toJSONString());
%>