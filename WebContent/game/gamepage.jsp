<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/game.css">
<% 
	session.setAttribute("id","kimminki");
	String id = (String)session.getAttribute("id");
%>

<div style="width:100%;height:100%">
    <input type="button" onclick="convertScore()" value="점수환산"/>
    <input type="hidden" id="id_value" value="<%=id%>"/>
</div>

<script>
	var id = document.getElementById('id_value').value;
	var score = 10000;
	
	var convertScore = function(){
		location.href="convertscore.do?id="+id+"&score="+score;		
	};	 
</script>