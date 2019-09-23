package mysql;


import java.sql.Connection;
import java.sql.DriverManager;
 
/**
 * This class is used to create a JDBC 
 * connection with MySql DB.

 */
public class Connect {
	//JDBC and database properties.
	private static final String DB_DRIVER = 
		           "com.mysql.cj.jdbc.Driver";       
	private static final String DB_URL = 
		        "jdbc:mysql://localhost:3306/practice";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "rubeena"; 
 
	public static void main(String args[]){
		
		//creation of object to connect the database
		Connection conn = null;
		
		//to know where the exception can occur
		try{
			//Register the JDBC driver
			Class.forName(DB_DRIVER);
 
			//open the connection using getConnection method
			conn = DriverManager.
			getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
 
			if(conn != null){
			   System.out.println("Successfully connected to database.");
			}else{
			   System.out.println("Failed to connect to database.");
			}
			
			//handle the exception
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
}