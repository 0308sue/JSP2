<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.board.dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int bnum = Integer.parseInt(request.getParameter("bnum"));
BoardDAO dao = BoardDAO.getInstance();
ArrayList<CommentDTO> carr = dao.commentList(bnum);
int count = dao.getCountComment(bnum);

JSONArray jarr = new JSONArray();
for(CommentDTO c : carr){
	JSONObject obj = new JSONObject();
	obj.put("userid",c.getUserid());
	obj.put("bnum",c.getBnum());
	obj.put("cnum",c.getCnum());
	obj.put("msg",c.getMsg());
	obj.put("regdate",c.getRegdate());
	jarr.add(obj);
}
JSONObject countObj = new JSONObject();
	countObj.put("count",count);

JSONObject mainObj = new JSONObject();
	mainObj.put("main", jarr);
	mainObj.put("count", countObj);

out.println(mainObj.toJSONString());
%>