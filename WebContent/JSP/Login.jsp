<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Login</title>
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
function no(tmp) 
{
	alert(tmp);	
	window.location.href="/placement/JSP/Login.jsp";
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
       <li><a href="/placement/JSP/Student_Registration.jsp"><span class="glyphicon glyphicon-user"></span> SIGN UP</a></li>
      </ul>
        </div>
      </div>
</nav>

<div class="container-fluid" >
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         
        
        <div class="col-sm-9 col-md-10 main" style="width: 100%;">
          
         
          
		  <h1 class="page-header">
            Login
           
          </h1> 

          <div class="row placeholders">
            <div class = "container cont bg-1">
			<form role="form" class="form-horizontal" action="/placement/Login" method="post">
				<div class="form-group">
					<label for="userid" class="control-label col-sm-2">User Id:</label>
					<div class="col-sm-6">
						<input type = "text" class="form-control" id="userid" placeholder="Enter User ID" name="userid">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="control-label col-sm-2">Password:</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="password" placeholder="Enter Password" name="password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
			</form>
		</div>
          </div>
          
          <hr>
            </div><!--/row-->
	</div>
</div><!--/.container-->
<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>

		<%
				  				
				  					String message=(String)request.getAttribute("msg");
				  					if(message!=null)
				  					{
				  				%>
				  					<script>
				  					no('<%=message%>');
				  					</script>
				  				<%		
				  					}
				  				%>
	</body>
</html>