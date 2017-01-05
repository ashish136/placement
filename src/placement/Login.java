package placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public Login() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("not2316666666666668597#$#%&%^*(&^*^&)(&)&(*^&^%$%^$#$");
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		} 
		catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String uID = request.getParameter("userid");
		String uPass = request.getParameter("password");
		String uType = null;
		String uStatus = null;
		String strsql = "select * from login where userid=? and userpass=?";
		System.out.println("allowed1");
		try 
		{
			System.out.println("allowed1");
			ps = con.prepareStatement(strsql);
			ps.setString(1, uID);
			ps.setString(2, uPass);
			rs = ps.executeQuery();
			if(rs.next()){
				System.out.println("allowed1");
				
				uStatus = rs.getString("status");
				if(uStatus.equals("true")){
					System.out.println("hurray");
					HttpSession hs = request.getSession(true);
					hs.setAttribute("userid",uID);
					hs.setAttribute("userpass",uPass);
					request.setAttribute("invalidLogin", "false");
					uType= rs.getString("utype");
					switch(uType){
					case "Student":
						response.sendRedirect("/placement/JSP/student_profile.jsp");
						break;
					case "Coordinator":
						response.sendRedirect("/placement/JSP/coordinator_profile.jsp");
						break;
					case "Recruiter":
						response.sendRedirect("/placement/JSP/recruiter_profile.jsp");
						break;
					case "Faculty":
						 response.sendRedirect("/placement/JSP/faculty_profile.jsp");
						 break;
						
						
					}
					/* if (uType.equals("recruiter")){
						response.sendRedirect("/placement/JSP/recruiter_profile.jsp");
					 }
					 if(uType == "coor"){
						 response.sendRedirect("/placement/JSP/coordinator_profile.jsp");
					 }
					 if(uType == "student"){
						 response.sendRedirect("/placement/JSP/student_profile.jsp");
					 }
					if(uType == "faculty"){
						 response.sendRedirect("/placement/JSP/faculty_profile.jsp");
					 }*/
				}
				else
				{
					System.out.println("not allowed1");
					request.setAttribute("invalidLogin", "true");
					RequestDispatcher rd = request.getRequestDispatcher("/JSP/Login.jsp");
					rd.forward(request, response);
				}
			}
			else
			{
				System.out.println("not allowed2");
				request.setAttribute("invalidLogin", "true");
				RequestDispatcher rd = request.getRequestDispatcher("/JSP/Login.jsp");
				rd.forward(request, response);
			}
				
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
			try {
				if(con!=null)
				con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
