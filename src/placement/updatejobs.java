package placement;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class updatejobs
 */
@WebServlet("/updatejobs")
public class updatejobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	PrintWriter out;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatejobs() {
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
		con = CrudOperation.createConnection();
		HttpSession hs = request.getSession(false);
		String user=(String) hs.getAttribute("userid");
		String jobname= request.getParameter("jobname");
		String criteria= request.getParameter("criteria");
		String strsql="update job_detail set criteria=? where name=?";
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1, criteria);
			ps.setString(2, jobname);
			int n=-1;
			n=ps.executeUpdate();
		   if(n>=0)
			{
			 System.out.println("update successful");
			}
			else System.out.println("you enter wrong job name");
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
		response.sendRedirect("/placement/JSP/Update_jobs.jsp");
	}

}
