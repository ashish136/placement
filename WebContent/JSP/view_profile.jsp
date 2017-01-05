<%@page import="placement.CrudOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login Theme</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 		 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 		 <style>
  			.bg-1 
  				{
      				background-color: #1abc9c;
      				color: #ffffff;
 				 }
  			.bg-2 
  			{
      			background-color:#222220;
      			color: #ffffff;
  			}
  			.bg-3 
  			{
     			background-color: #ffffff;
      			color: #555555;
 			 }
  			.container-fluid 
  			{
     			 padding-top: 70px;
     			 padding-bottom: 70px;
  			}
  			.navbar 
  			{
    			padding-top: 15px;
   				padding-bottom: 15px;
    			border: 0;
    			border-radius: 0;
    			margin-bottom: 0;
    			font-size: 12px;
    			letter-spacing: 5px;
			}

			.navbar-nav li a:hover 
			{
    			color: #1abc9c !important;
			}
			.cont
			{
				padding-top:50px;
				margin-top:20px;
			}
			.text-center
			{
				font-size:18px;
				letter-spacing:3px;
			}
  </style>
</head>
<body class="bg-1">
		<nav class="navbar navbar-inverse">
  			<div class="container">
    			<div class="navbar-header">
     				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
      				</button>
      				<a class="navbar-brand" href="#">placement.com</a>
    			</div>
  	<div>
  	<ul class="nav navbar-nav">
  		<li><a href="/placement/JSP/home.jsp">HOME</a></li>
      	 <li><a href="/placement/JSP/seminar.jsp">SEMINARS</a></li>
      	<li><a href="/placement/JSP/jobs.jsp">JOBS</a></li>
      	<li><a href="/placement/JSP/feedback.jsp">FEEDBACK</a></li>
      </ul>
  	</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/placement/JSP/feedback.jsp">SEND MESSAGE</a></li>
        <li><a href="/placement/JSP/feedback.jsp">VIEW MESSAGE</a></li>
      </ul>
    </div>
  </div>
</nav>
<%! 
	String name, email, gender, course, father, mother, qualification, college;
	int passing_year, percentage;
	long contact;
	%>
<% 
	HttpSession hs = request.getSession(false);
	String uID = (String)hs.getAttribute("userid");
	out.println(uID);
Connection con = CrudOperation.createConnection();
	String strsql = "select * from student_detail where userid=?";
	PreparedStatement ps = con.prepareStatement(strsql);
	ps.setString(1, uID);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		name = rs.getString("name");
		email=rs.getString("email");
		gender = rs.getString("gender");
		father = rs.getString("father");
		course = rs.getString("cource");
		mother = rs.getString("mother");
		qualification = rs.getString("qualification");
		college = rs.getString("collegename");
		passing_year = rs.getInt("passingyear");
		percentage = rs.getInt("percentage");
		contact = rs.getLong("contact");
	}
%>
<div class = "container cont bg-1 text-center">
	<h3>Name: <% out.println(name); %></h3>
	<h3>Email: <% out.println(email); %></h3>
	<h3>Gender: <% out.println(gender); %></h3>
	<h3>Father's Name: <% out.println(father); %></h3>
	<h3>Mother's Name: <% out.println(mother); %></h3>
	<h3>College: <% out.println(college); %></h3>
	<h3>Contact: <% out.println(contact); %></h3>
	<h3>Percentage: <% out.println(percentage); %></h3>
	<h3>Year Of Passing: <% out.println(passing_year); %></h3>
	<button type="button" class="btn btn-default" onclick="window.location='/placement/JSP/edit_profile.jsp'" >Edit Profile</button>

		
		</div>
	</body>
</html>