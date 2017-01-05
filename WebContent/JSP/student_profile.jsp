<%@page import="placement.CrudOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Student</title>
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
<%System.out.println("in student"); %>
<%HttpSession he=request.getSession(false);
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
	String name, email, gender, course, father, mother, qualification, college,uID;
	int passing_year, percentage;
	long contact;
	ResultSet rs;
	%>
<% 
	HttpSession hs = request.getSession(false);
	uID = (String)hs.getAttribute("userid");
	System.out.println(uID);
Connection con = CrudOperation.createConnection();
	String strsql = "select * from student_detail where userid=?";
	try
	{
	PreparedStatement ps = con.prepareStatement(strsql);
	ps.setString(1, uID);
	rs = ps.executeQuery();
	if(rs.next()){
		name = rs.getString("name");
		email=rs.getString("email");
		gender = rs.getString("gender");
		father = rs.getString("father");
		course = rs.getString("course");
		mother = rs.getString("mother");
		//qualification = rs.getString("qualification");
		college = rs.getString("college");
		passing_year = rs.getInt("passing_year");
		percentage = rs.getInt("percentage");
		contact = rs.getLong("contact");
	}
	}catch (SQLException e) 
	       {
			 e.printStackTrace();
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
              <li><a href="/placement/JSP/student_edit_profile.jsp">EDIT PROFILE</a></li>
              <li><a href="/placement/JSP/doubts.jsp">DOUBTS</a></li>
              <li><a href="/placement/JSP/cleared doubts.jsp">ANSWERED DOUBTS</a></li>
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
          
		  <h1 class="page-header">
            HELLO!
            <p class="lead"><%=name %></p>
          </h1>
           <h3 >
            Your Profile
          </h3>
          
          <div class="row placeholders">
              <div class="table-responsive">
            <table class="table table-striped">
            
               
              <tbody>
               <tr><th>Name :</th><th><%=name%></th></tr>
               <tr><th>Email :</th><th><%=email%></th></tr>
               <tr><th>Contact :</th><th><%=contact%></th></tr>
               <tr><th>Gender :</th><th><%=gender%></th></tr>
               <tr><th>Course :</th><th><%=course%></th></tr>
               <tr><th>Passing Year :</th><th><%=passing_year%></th></tr>
               <tr><th>Percentage :</th><th><%=percentage%></th></tr>
              
         </tbody>
         </table>
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