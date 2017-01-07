package service;
import java.net.URISyntaxException;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB 
{
	public Connection conn;
	public ConnectDB(){}
//	public Connection getConn() throws Exception
//	{
//	  	Class.forName("org.postgresql.Driver");
//  		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/boutique","postgres","root");
//	      return conn;
//	}
	
	public Connection getConn() throws URISyntaxException, SQLException {
	    String dbUrl = System.getenv("JDBC_DATABASE_URL");
	    return DriverManager.getConnection(dbUrl);
	}

	
	public int countRow(String table){
	    int count=0;
	    try {
			String req = "SELECT * FROM "+table;
		 	Statement stmt = conn.createStatement();
		 	ResultSet res = stmt.executeQuery(req);
		 	while (res.next()) {
				count++;
		 	}
	 	}
	    catch (Exception e1) {
		  e1.printStackTrace();
	  	}
	  	return count;
	}
}
