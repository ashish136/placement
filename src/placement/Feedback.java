package placement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps=null;
	ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
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
		String feedback = request.getParameter("feedback");
		HttpSession hs = request.getSession();
		String userid = (String)hs.getAttribute("userid");
		PrintWriter out = response.getWriter();
		//out.print(feedback);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			out.print("driver not found");
			e1.printStackTrace();
		}// load the driver class

		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			out.print("disconnected");
		}
		
		String strsql = "insert into feedback (userid, message) values (?,?)";
		try {
			ps = con.prepareStatement(strsql);
		}
			catch (SQLException e) {
				e.printStackTrace();
				out.printf("dfkhkd");
			}
			try {
				ps.setString(1, userid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.print("abhay");
				e.printStackTrace();
			}
			try {
				ps.setString(2, feedback);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.println("tiwari");
			}
			int i;
			try {
				i = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.print("kumar");
				e.printStackTrace();
			}
			//out.print(i);
			//if(i>0){
			////	out.print("feedback saved");
			//}
		}
		
	}


