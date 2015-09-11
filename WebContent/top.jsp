<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String loginYn="N";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
	   loginYn="Y";	   
	}
	
	System.out.println("loginYn ?? " +loginYn);
%>
<html>
<link rel="stylesheet" href="css/top.css">
<script>
	
	var home = function(){
		location.href = "hello.do";		
	};
	var brain_profile = function(){
<%
	if(loginYn.equals("Y"))
	{
%>		
		location.href = "brainprofile.do";		
<%
	}else{
%>
		alert('로그인 후 이용하세요');
<%		
	}
%>	
	};
	var games = function(){
		location.href = "game.do";		
	};
	var join = function(){
		location.href = "join.do";
	};
	var login = function(){
		location.href = "login.do";
	};
	var logout = function(){
		location.href = "logout.do";
	};
	var mypage = function(){
		location.href = "mypage.do";
	};	
	var btn3 = function(){
		location.href = "gamedetail.do";		
	};
	
	var btn5 = function(){
		location.href = "dbinsert.do?name='kimminki'&id='mingi1121'&password='1121'&email='makekmk1121@naver.com'&score='0'";		
	}
	
	var warn = function(){
		alert('로그인 후 이용하세요');
	}
</script>


<div id="header" >
	<a  href ="javascript:void(0);"><img   id="logo" src="resources/SERIOUSITY.png" onclick="home();"></a>
	<a href="javascript:void(0);"><div class="header_btn" onclick="home();">Home</div></a>
	<a href="javascript:void(0);"><div class="header_btn" onclick="brain_profile();">Brain Profile</div></a>
<% 
	if(loginYn.equals("Y"))
	{
%>		
	<a href="javascript:void(0);"><div class="header_btn" onclick="games();">Games</div></a>	
<%
	}
	else 
	{
%>	
	<a href="javascript:void(0);"><div class="header_btn" onclick="warn();">Games</div></a>
	<a href="javascript:void(0);"><div class="header_btn" onclick="join();">Join</div></a>
<% 
	}

	if(loginYn.equals("N"))
	{
%>	
	<a href="javascript:void(0);"><div class="header_btn" onclick="login();">Login</div></a>
	
<%
	}
	else 
	{
%>	
	<a href="javascript:void(0);"><div class="header_btn" onclick="logout();">Logout</div></a>
<% 
	}
%>
<!-- 	<div style="float : left; margin:15px;" id="btn2" onclick="btn2();">|</div>&nbsp;&nbsp;&nbsp;
	<button style="float : left; margin:15px;" id="btn3" onclick="btn3();">gamedetail</button>&nbsp;&nbsp;&nbsp;
	<button style="float : left; margin:15px;"  id="btn5" onclick="btn5();">join</button>-->
<% 
	if(loginYn.equals("N"))
	{
%>	
	<a href="javascript:void(0);"><div class="header_btn" style="font-size:20px; float:right" >Guest</div></a>
	
<%
	}
	else 
	{
%>	
	<a href="javascript:void(0);"><div class="header_btn" style="font-size:20px; float:right" onclick="mypage();"><%=session.getAttribute("email")%></div></a>
<% 
	}
%>	

 </div>	
</html>