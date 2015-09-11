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
      <form id="signup" class="form-horizontal" method="post" action="success.php">
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

					<p><div id="gender" name="gender" class="btn-group" data-toggle="buttons-radio">
                    <button type="button" class="btn btn-info">Male</button>
                    <button type="button" class="btn btn-info">Female</button>

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
	       <button type="submit" class="btn btn-success" >Create My Account</button>

	      </div>

	</div>

	  </form>

   </div>
</div>
</html>

 <script type="text/javascript">
	$(document).ready(function(){
	
		$("#signup").validate({
			rules:{
				fname:"required",
				lname:"required",
			email:{
				required:true,
				email: true
		},
			passwd:{
				required:true,
				minlength: 8
		},
		conpasswd:{
			required:true,
			equalTo: "#passwd"
		},
			gender:"required"
		},
			errorClass: "help-inline"
		});
</script>