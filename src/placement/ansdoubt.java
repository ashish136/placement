package placement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ansdoubt
 */
@WebServlet("/ansdoubt")
public class ansdoubt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
	PreparedStatement ps=null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ansdoubt() {
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
		con=CrudOperation.createConnection();
		String answer= request.getParameter("ans");
		String doubtid= request.getParameter("mid");
		System.out.println("I am "+doubtid);
		HttpSession hs = request.getSession(false);
		String userid = (String)hs.getAttribute("userid");
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd= new java.sql.Date(dt.getTime());
		try
		{
			con.setAutoCommit(false);	
			String strsql="insert into ansdoubt(doubtid,ansfromid,answer,dateofans,status) value(?,?,?,?,?)";
			ps=con.prepareStatement(strsql);
			
			ps.setString(1, doubtid);					
			ps.setString(2, userid);					
			ps.setString(3, answer);									
			ps.setDate(4, sd);					
			ps.setString(5, "true");		
			int rw=ps.executeUpdate();
			if(rw>0)
			{	
				String strsql2="update doubts set status='true' where doubtid=?";
				ps=con.prepareStatement(strsql2);
				ps.setString(1, doubtid);
				ps.executeUpdate();
				con.setAutoCommit(true);
				
					//response.sendRedirect("/placement/JSP/doubts.jsp");
			}
		}catch(SQLException s)
		{
			s.printStackTrace();
		}
		response.sendRedirect("/placement/JSP/ansdoubt.jsp.jsp");

	}

}
