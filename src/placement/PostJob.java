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
 * Servlet implementation class PostJob
 */
@WebServlet("/PostJob")
public class PostJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps, ps1 = null;
	String uID, name, email, owner, eligibility;
	long contact;
	ResultSet rs= null;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostJob() {
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
		HttpSession hs = request.getSession();
		uID = (String)hs.getAttribute("userid");
		eligibility = request.getParameter("cri");
		name = request.getParameter("job");
		con = CrudOperation.createConnection();
		String strsql1 = "select * from recuiter_detail where userid=?";
		try {
			ps1 = con.prepareStatement(strsql1);
			ps1.setString(1, uID);
			
			rs = ps1.executeQuery();
			if(rs.next()){
				 email = rs.getString("email");
				 owner = rs.getString("owner");
				 contact = rs.getLong("contact");
				 out.print(email);
				 out.print(owner);
				 out.print(contact);
			}
			else{
				out.print("sdfj");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String strsql = "insert into job_detail (userid, name, email, contact, owner, criteria ) values(?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(strsql);
			ps.setString(1, uID);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setLong(4, contact);
			ps.setString(5,owner);
			ps.setString(6, eligibility);
			int i = ps.executeUpdate();
			if(i>0){
				out.println("jfg");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
