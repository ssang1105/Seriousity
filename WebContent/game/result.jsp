<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/brainprofile.css">

<% 
	String id=(String)request.getAttribute("id");
	String score=(String)request.getAttribute("score");
%>
<div style="width:100%;height:100%">
	<%=id%> 님의 점수는 <%=score%> 입니다.
</div>