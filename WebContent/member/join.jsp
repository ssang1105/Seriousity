<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link href="css\bootstrap/bootstrap.css" rel="stylesheet">
	<link href="css\bootstrap/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="css/hello.css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Seriousity</title>
</head>
  <body>

 	    <div class="container">
<legend>Sign Up</legend>
<div class="well">
      <form id="joinForm" class="form-horizontal" method="post" action="joinfinish.do">
		<div class="control-group">
	        <label class="control-label">User Name</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="fname" name="fname" placeholder="First Name">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Email</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-envelope"></i></span>
					<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Gender</label>
			<div class="controls">

					<p><div id="gender" class="btn-group" data-toggle="buttons-radio">
					<INPUT type="radio" name="gender" value="M" checked> <font size="4px">male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
					<INPUT type="radio" name="gender" value="F"> <font size="4px">female</font>
       
                  </div></p>

			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Confirm Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password">
				</div>
			</div>
		</div>

		<div class="control-group">
		<label class="control-label"></label>
	      <div class="controls">
	       <button id="gojoin" class="btn btn-success" >Create My Account</button>

	      </div>

	</div>

	  </form>

   </div>
</div>
</html>
<SCRIPT type="text/JavaScript" src="js/common.js"></SCRIPT>
 <script type="text/javascript">
	$(document).ready(function(){
	
		$('#gojoin').click(function(){
			
		
		var fnameInput = $('input:text[name=fname]');
		var fnameValue = trim(fnameInput.val());
		
		if(fnameValue === "")
		{
			window.alert("이름을 입력하세요.");
			fnameValue.select();
			return false;
		}
		
		fnameInput.val(fnameValue);

		   

	     // 이메일 체크
	    var emailInput = $('input:text[name=email]');
	    var emailValue = trim(emailInput.val());
	    if(emailValue !== "")
	    {
	       if(isEmailChar(emailValue))
	       {
	          window.alert("이메일 주소에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
	          emailInput.select();
	          return false;
	       }
	       if(emailValue.indexOf("@") == -1 || emailValue.indexOf(".") == -1 || emailValue.indexOf(".")<emailValue.indexOf("@") || isNum(emailValue.charAt(0)))
	       {
	          window.alert("이메일 주소를 확인 하세요.");
	          emailInput.select();
	          return false;
	       }
	    }
	    else
	    {
	       window.alert("이메일을 반드시 입력바랍니다.");
	       emailInput.select();
	       return false;
	    }
	    
	    //성별 체크
	    var genderValue = $('input:radio[name=gender]:checked').val();
		
    
	   // 비밀번호 값 체크
	   var passwdInput = $('input:password[name=passwd]');    
	   var passwdValue = trim(passwdInput.val());
	
	   if(passwdValue === "")
	   {
	      window.alert("비밀번호를 입력하세요.");
	      passInput.select();
	      return false;
	   }
	   if(passwdValue.length<4 || passwdValue.length>20)
	   {
	      window.alert("비밀번호는 4자 이상 20자 이하로 입력하세요.");
	      passwdInput.select();
	      return false;
	   }
	   if(isEngNum(passwdValue))
	   {
	      window.alert("비밀번호는 숫자 또는 영문 소문자만 가능합니다.");
	      passwdInput.select();
	      return false;
	   }
	   
	   passwdInput.val(passwdValue);
	   
	   var conpasswdInput = $('input:password[name=conpasswd]');    
	   var conpasswdValue = trim(conpasswdInput.val());
	
	   if( passwdValue != conpasswdValue)
	   {
		   window.alert("비밀번호 확인을 다시 해주세요");
		   conpasswdInput.select();
		   return false;
	   }
	   
	   conpasswdInput.val(conpasswdValue);		
	     
	     // $("#joinForm").submit();
	      
		});
		
	});
</script>