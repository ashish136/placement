package placement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class EditCoorDinator
 */
@WebServlet("/EditCoorDinator")
public class EditCoorDinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection con = null;
	private PreparedStatement ps = null;
	//private ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCoorDinator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		con = CrudOperation.createConnection();
		HttpSession hs = request.getSession(false);
		String user=(String) hs.getAttribute("userid");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String table="",utype="";
		String type="Select utype from login where userid=?";
		try {
			ps=con.prepareStatement(type);
			ps.setString(1, user);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				utype=rs.getString("utype");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		switch(utype)
		{
		case "Coordinator":table="Coordinator";
		      break;
		case "Recruiter":table="recuiter_detail";
	      break;
		case "Student":table="student_detail";
	      break;
		case "Faculty":table="faculty_detail";
	      break;
		
		}
		//System.out.println(table);
		String strsql="update "+table+" set contact=? , email=? where userid=?";
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1, phone);
			ps.setString(2, email);
			ps.setString(3, user);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(con!=null)
			con.close();
			if (ps != null)
				ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
