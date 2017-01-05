package placement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class CrudOperation {
	private static Connection con = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;

	public static Connection createConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");// load the driver class

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		}

		catch (ClassNotFoundException | SQLException cse) {

			System.out.println(cse);
		}
		return con;

	}

	public static ResultSet executeQuery(String sql, String data) {

		con = createConnection();
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, data);
			rs = ps.executeQuery();

		} catch (SQLException se) {

			System.out.println(se);
		}
		return rs;

	}
	public static ResultSet executeintQuery(String sql, int data) {

		con = createConnection();
		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, data);
			rs = ps.executeQuery();

		} catch (SQLException se) {

			System.out.println(se);
		}
		return rs;

	}


	public static ResultSet execute2Query(String sql, String data1, String data2) {

		con = createConnection();
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, data1);
			ps.setString(2, data2);
			rs = ps.executeQuery();

		} catch (SQLException se) {

			System.out.println(se);
		}
		return rs;

	}

	public static ResultSet execute0Query(String sql) {

		con = createConnection();
		try {

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

		} catch (SQLException se) {

			System.out.println(se);
		}
		return rs;

	}

	public static String getCurrentDate() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(dt);
		return date;
	}
	
	public static String ConvertDate(String Date) {
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date uDate = null;
		try {
			uDate = (java.util.Date) sdf.parse(Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String date = sdf.format(uDate);
		return date;
	}

}
