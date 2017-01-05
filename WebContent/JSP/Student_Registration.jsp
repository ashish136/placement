<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Student Registration</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<!--<link href="/placement/css/bootstrap.min.css" rel="stylesheet">-->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 		 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="/placement/css/styles.css" rel="stylesheet">
  <script type="text/javascript">
  	function dis(val)
  	{
  		if(val=="student")
  		{
  			window.location="/placement/JSP/Student_Registration.jsp";
  		}
  		if(val=="coordinator")
  		{
  			window.location="/placement/JSP/coordinator.jsp";
  		}
  		
  		if(val=="recruiter")
  		{
  			window.location="/placement/JSP/recruiter_registration.jsp";
  		}
  		
  		if(val=="faculty")
  		{
  			window.location="/placement/JSP/faculty_Registration.jsp";
  		}
  	}
  </script>
</head>
<body class="bg-1">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Placement.com</a>
        </div>
        <div>
  	<ul class="nav navbar-nav">
  		<li class="active"><a href="/placement/JSP/home.jsp">HOME</a></li>
      	<li><a href="/placement/JSP/jobs.jsp">JOBS</a></li>
      </ul>
  	</div>
        <div class="navbar-collapse collapse">
         <ul class="nav navbar-nav navbar-right">
     <li><a href="/placement/JSP/Login.jsp"><span class="glyphicon glyphicon-log-in"></span> LOGIN</a></li>
      </ul>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
        
        
        <div class="col-sm-9 col-md-10 main" style="width: 100%;">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p> 
          
		  <h1 class="page-header">
            Sign Up
           
          </h1> 

          <div class="row placeholders">
           
			<form action="/placement/Registration" method="post" role="form" class="form-horizontal">
			
				<div class="form-group">
					<label for="usertype" class="control-label col-sm-2">Sign Up As:</label>
					<div class="col-sm-6">
						<select class="form-control" id="usertype" onchange="dis(this.value)" name="utype">
							<option value="student">Student</option>
							<option value="recruiter">Recruiter</option>
							<option value="coordinator">Placement Cell Coordinator</option>
							<option value="faculty">Faculty Coordinator</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="userid" class="control-label col-sm-2" id="uid">User Id:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="userid" placeholder="Enter User ID"  style="display:block" name="userid">
					</div>
				</div>
				
				<div class="form-group">
					<label for="name" class="control-label col-sm-2">Name:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="name" placeholder="Enter Your Name" name="name">
					</div>
				</div>
				
				<div class="form-group">
					<label for="Email" class="control-label col-sm-2">Email:</label>
					<div class="col-sm-6">
						<input type = "email" class="form-control" id="email" placeholder="Enter Email" name="email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="contact-no" class="control-label col-sm-2">Contact No:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="contact_no" placeholder="Enter Contact Number" name="contact">
					</div>
				</div>
				
				<div class="form-group">
					<label for="course" class="control-label col-sm-2">Course:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="course" placeholder="Enter Your Couse" name="course">
					</div>
				</div>
				
				<div class="form-group">
					<label for="year" class="control-label col-sm-2">Year:</label>
					<div class="col-sm-6">
						<input type = "number" class="form-control" id="year" placeholder="Enter Year" name="year">
					</div>
				</div>
				
				<div class="form-group">
					<label for="father_name" class="control-label col-sm-2">Father's Name:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="father" placeholder="Enter Father's Name" name="father">
					</div>
				</div>
				
				<div class="form-group">
					<label for="mothers_name" class="control-label col-sm-2">Mother's Name:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="mother" placeholder="Enter Mother's Name" name="mother">
					</div>
				</div>
				
				<div class="form-group">
					<label for="college_name" class="control-label col-sm-2">College Name:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="college" placeholder="Enter Your College Name" name="college">
					</div>
				</div>
				
				<div class="form-group">
					<label for="passing_year" class="control-label col-sm-2">Year of Passing:</label>
					<div class="col-sm-6">
						<input type = "number" class="form-control" id="passing_year" placeholder="Year Of Passing" name="passing">
					</div>
				</div>
				
				<div class="form-group">
					<label for="percentage" class="control-label col-sm-2">Percentage:</label>
					<div class="col-sm-6">
						<input type = "number" class="form-control" id="userid" placeholder="Percentage" name="per">
					</div>
				</div>
				
				<div class="form-group">
					<label for="password" class="control-label col-sm-2">Password:</label>
					<div class="col-sm-6">
						<input type = "password" class="form-control" id="password" placeholder="Enter Password" name="password">
					</div>
				</div>
				
				<div class="form-group">
					<label for="password" class="control-label col-sm-2">Password:</label>
					<div class="col-sm-6">
						<input type = "password" class="form-control" id="confirm_password" placeholder="Re-enter Password">
					</div>
				</div>
				
				<div class="form-group">
					<label for="address" class="control-label col-sm-2">Address:</label>
					<div class="col-sm-6">
						<textarea rows="5" cols="40" placeholder="Enter Address" id="address" name="address"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="gender" class="control-label col-sm-2">Gender:</label>
					<div class="col-sm-6">
						<div class="radio">
							<label><input type = "radio" id="male" name ="gender" value="male">Male</label>
						</div>
						<div class="radio">
							<label><input type = "radio" id="female" name ="gender" value="female">Female</label>
						</div>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<button type="submit" class="btn btn-default">Sign Up</button>
					</div>
				</div>
			</form>
          </div>
          
          <hr>
            </div><!--/row-->
	</div>
</div><!--/.container-->
<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>	
		
		
	</body>
</html>