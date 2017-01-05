<%@page import="placement.CrudOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Coordinator</title>
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
	</head>
<body class="bg-1">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%> 
<% HttpSession he=request.getSession(false);
	System.out.println(he);
	
	String uid=(String)he.getAttribute("userid");

	if(uid==null||he.isNew())
	{
		request.setAttribute("msg", "Please! login to view your profile");
		RequestDispatcher rd=request.getRequestDispatcher("/JSP/Login.jsp");
		rd.forward(request, response);		
	}
 else{ %> 
		
<%! 
	String name, email, designation;
	long contact;
	%>
<% 
	HttpSession hs = request.getSession(false);
	String uID = (String)hs.getAttribute("userid");
Connection con = CrudOperation.createConnection();
	String strsql = "select * from coordinator where userid=?";
	PreparedStatement ps = con.prepareStatement(strsql);
	ps.setString(1, uID);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		name = rs.getString("name");
		email=rs.getString("email");
		designation = rs.getString("designation");
		contact = rs.getLong("contact");
	}
%>
	<%} %>
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
      <li><a href="/placement/Logout"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
      </ul>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
           
            <ul class="nav nav-sidebar">
              <li class="active"><a href="#">Overview</a></li>
              <li><a href="/placement/JSP/coordinator_edit_profile.jsp">EDIT PROFILE</a></li>
              <li><a href="/placement/JSP/Update_jobs.jsp">UPDATE JOBS</a></li>
              <li><a href="/placement/JSP/give_feedback.jsp">FEEDBACK</a></li>
            </ul>
          <!--  <ul class="nav nav-sidebar">
              <li><a href="">Nav item</a></li>
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
              <li><a href="">More navigation</a></li>
            </ul>
            <ul class="nav nav-sidebar">
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
            </ul>-->
          
        </div><!--/span-->
        
        <div class="col-sm-9 col-md-10 main">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p> 
          
		  <h1 class="page-header">
            HELLO!
            <p class="lead"><%=name %></p>
          </h1>

          <div class="row placeholders">
            <div class="table-responsive">
            <table class="table table-striped">
            
               
              <tbody>
               <tr><th>Name :</th><th><%=name%></th></tr>
               <tr><th>Email :</th><th><%=email%></th></tr>
               <tr><th>Contact :</th><th><%=contact%></th></tr>
               <tr><th>Designation :</th><th><%=designation%></th></tr>
         </tbody>
         </table>
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
	</body>
</html>