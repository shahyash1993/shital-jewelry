package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ParentDAO {
	/*******************
	 * Class Constants *
	 *******************/
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/proj2";

	static final String USERNAME = "root";
	static final String PASSWORD = "root";
	
	static final String CATEGORY_TABLE_NAME = "category";
	static final String PRODUCT_TABLE_NAME = "product";
	
	/**********************
	 * Get Connection obj *
	 **********************/
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			System.out.println("con:  "+con+" ||con==null?"+con==null);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
