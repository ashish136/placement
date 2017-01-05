package placement;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null,ps1 = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con = CrudOperation.createConnection();
		PrintWriter out = response.getWriter();
		String utype = request.getParameter("utype");
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		switch(utype){
		case "student":
			String course = request.getParameter("course");
			String year = request.getParameter("year");
			String father = request.getParameter("father");
			String mother = request.getParameter("mother");
			String college = request.getParameter("college");
			String passing = request.getParameter("passing");
			String percent = request.getParameter("per");
			String pass = request.getParameter("password");
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			String strsql="insert into student_detail values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String loginstr="insert into login values( ?, ?, ?, ?)";
			try {
				PreparedStatement ps = con.prepareStatement(strsql);
				PreparedStatement pslogin = con.prepareStatement(loginstr);
				ps.setString(1, userid);
				ps.setString(2, name);
				ps.setString(3, email);
				ps.setLong(4, Long.parseLong(contact));
				ps.setString(5, gender);
				ps.setString(6, course);
				ps.setInt(7, Integer.parseInt(year));
				ps.setString(8, address);
				ps.setString(9, father);
				ps.setString(10, mother);
				ps.setString(11, college);
				ps.setInt(12, Integer.parseInt(passing));
				ps.setInt(13, Integer.parseInt(percent));
				ps.executeUpdate();
				pslogin.setString(1,userid);
				pslogin.setString(2,pass);
				pslogin.setString(3,"Student");
				pslogin.setString(4,"true");
				pslogin.executeUpdate();
				} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "faculty":
			String subject = request.getParameter("subject");
			String department = request.getParameter("department");
			String strsql3="insert into faculty_detail values(?, ?, ?, ?, ?, ?)";
			try {
				ps = con.prepareStatement(strsql3);
				ps.setString(1, userid);
				ps.setString(2, name);
				ps.setString(3, email);
				ps.setLong(4, Long.parseLong(contact));
				ps.setString(5, subject);
				ps.setString(6 , department);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "coordinator":
			String designation = request.getParameter("designation");
			String strsql1 = "insert into  coordinator values(?, ?, ?, ?, ?)";
			try {
				PreparedStatement ps2 = con.prepareStatement(strsql1);
				ps2.setString(1,userid);
				ps2.setString(2, name);
				ps2.setString(3, email);
				ps2.setLong(4, Long.parseLong(contact));
				ps2.setString(5, designation);
				ps2.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case "recruiter":
			String owner = request.getParameter("owner");
			String website = request.getParameter("website");
			String strsql2 = "insert into  recuiter_detail values(?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement ps2 = con.prepareStatement(strsql2);
				ps2.setString(1,userid);
				ps2.setString(2, name);
				ps2.setString(3, email);
				ps2.setLong(4, Long.parseLong(contact));
				ps2.setString(5, owner);
				ps2.setString(6, website);
				
				ps2.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
	}

}
