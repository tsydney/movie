/**
 * 
 */
package org.conn;

import java.sql.*;

/**
 * @author Terry
 *
 */
public class MySQLConnUtils {

	public static Connection getMySQLConnection() 
			throws ClassNotFoundException, SQLException {
	
		//connection parameters
        final String DATABASE_URL = "jdbc:mysql://localhost:3306/sans";
        final String DATABASE_USERNAME = "student";
        final String DATABASE_PASSWORD = "mysql";

        return getMySQLConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
	}	

	public static Connection getMySQLConnection(String url, String username, String password) 
			throws ClassNotFoundException, SQLException {

        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("JDBC driver loaded");
        }catch(Exception ex){
            System.out.println(ex.toString());
        }		
        
            Connection conn = DriverManager.getConnection(url, username, password);
            return conn;
 	}
}
