<%@page import="placement.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Jobs</title>
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
      <li><a href="/placement/JSP/Login.jsp"><span class="glyphicon glyphicon-log-in"></span> LOGIN</a></li>
      </ul>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
        
        
      
          
         <div class="col-sm-9 col-md-10 main" style="width: 100%;">
          
		  <h1 class="page-header">
            Jobs
           
          </h1> 

          <div class="row placeholders"></div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Name</th><th>Criteria</th><th>Recruiter</th><th>Email</th><th>website</th>
                 
                </tr>
              </thead>
              <tbody>
                 
		  					<%
		Connection con =null;
	    ResultSet rs=null;
	    ResultSet rs2=null;
	    PreparedStatement ps=null;
	    PreparedStatement ps2=null;
	    con=CrudOperation.createConnection();
		String strsql = "select * from job_detail";
		try
		{
		ps = con.prepareStatement(strsql);
		rs = ps.executeQuery();
		while(rs.next()){
		 String userid=rs.getString("userid");
		 System.out.println(userid);
		 String recsql = "select * from recuiter_detail where userid=?";
		 System.out.println("one");
		ps2 = con.prepareStatement(recsql);
		System.out.println("two");
		ps2.setString(1, userid);
		System.out.println("three");
		rs2 = ps2.executeQuery();
		if(rs2.next()){
		%>
		
			<tr><td><%=rs.getString("name")%></td><td><%=rs.getString("criteria")%></td><td><%=rs.getString("owner")%></td><td><%=rs.getString("email")%></td><td><%=rs2.getString("website")%></td></tr>
	
<% }}
} catch(SQLException se)
{
 System.out.println("Exception");
}%>
                
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