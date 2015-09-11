<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="css/login.css" rel="stylesheet">

<div style="width:100%;height:100%">
	this is login page <br><br>
	<form id="loginForm" method="post" action="gologin.do">
		아이디 : <input type="text" name="email" id="email"> <br><br>
		비밀번호 :<input type="Password" name="passwd" id="passwd"> <br><br>
		<button id="gologin">Login</button>
	</form>	
</div>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		$('#gologin').click(function(){
			
			  var passwdInput = $('input:password[name=passwd]');    
			   var passwdValue = trim(passwdInput.val());
			
			   if(passwdValue === "")
			   {
			      window.alert("비밀번호를 입력하세요.");
			      passInput.select();
			      return false;
			   }			
	     
	      $("#loginForm").submit(); 
	      
		});		
	});
</script>