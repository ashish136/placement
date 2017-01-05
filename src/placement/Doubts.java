package placement;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Doubts
 */
@WebServlet("/Doubts")
public class Doubts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Doubts() {
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
		String subject= request.getParameter("subject");
		String message= request.getParameter("message");
		HttpSession hs = request.getSession(false);
		String userid = (String)hs.getAttribute("userid");
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd= new java.sql.Date(dt.getTime());
		try
		{
			con.setAutoCommit(false);	
			String strsql="insert into doubts(Fromid,subject,doubt,Dateofdoubt,status) value(?,?,?,?,?)";
			ps=con.prepareStatement(strsql);
			
			ps.setString(1, userid);					
			ps.setString(2, subject);					
			ps.setString(3, message);									
			ps.setDate(4, sd);					
			ps.setString(5, "false");		
			int rw=ps.executeUpdate();
			if(rw>0)
			{	
				con.setAutoCommit(true);
				
					response.sendRedirect("/placement/JSP/doubts.jsp");
			}
		}catch(SQLException s)
		{
			s.printStackTrace();
		}
	}

}
