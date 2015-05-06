package com.cmpe281.multitenant.Utility;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector{

	private static final String MYSQL_DB_NAME = "Multi_Tenant_Platform";
	private static final String MYSQL_URL = "jdbc:mysql://localhost:3306/";
	private static final String USER_NAME = "root";
	private static final String PASSWORD = "kunal";
	
	/*private static final String MYSQL_DB_NAME = "multitenantapplication";
	private static final String MYSQL_URL = "jdbc:mysql://127.2.192.130:3306/";
	private static final String USER_NAME = "adminEViN5D9";
	private static final String PASSWORD = "tWmBxIcrYjDR";*/
	
	private static Connection con = null;
	
	private static void connectToMYSQL(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(MYSQL_URL+MYSQL_DB_NAME, USER_NAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getSQLInstance(){
		try {
			if(con == null || con.isClosed())
				connectToMYSQL();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConn() {
		try {
			if(con.isValid(0)){
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}