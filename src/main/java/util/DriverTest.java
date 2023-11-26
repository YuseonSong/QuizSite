package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverTest {

	public static void main(String[] args) {
		Connection conn = null;
		 
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/webproject?useSSL=false&allowPublicKeyRetrieval=true", 
                    "root", "mysql");  
            System.out.println("Success");
        }
        catch(SQLException ex){ 
            System.out.println("SQLException" + ex);
            ex.printStackTrace();
        }
        catch(Exception ex){ 
            System.out.println("Exception:" + ex);
            ex.printStackTrace();
        }
    }
}
