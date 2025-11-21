/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.IOException;
/**
 *
 * @author kms03
 */
public class DB_MAN {
    String strDriver = "com.mysql.cj.jdbc.Driver";
    String strURL = "jdbc:mysql://localhost:3306/academicdb?characterEncoding=UTF-8&serverTimezone=UTC";
    String strUser = "root";
    String strPWD = "inha1958"; 

    Connection DB_con;
    Statement DB_stmt;
    public ResultSet DB_rs;
    
    public void dbOpen() throws IOException {
        try {
            Class.forName(strDriver);

            DB_con = DriverManager.getConnection(strURL, strUser, strPWD);

            DB_stmt = DB_con.createStatement();
            
            System.out.println("DB Connection Success!");

        } catch (Exception e) {
            System.out.println("DB Connection Failed: " + e.getMessage());
        }
    }
    public void dbClose() throws IOException {
        try {
            if (DB_stmt != null) DB_stmt.close();
            if (DB_con != null) DB_con.close();
            if (DB_rs != null) DB_rs.close();
            System.out.println("DB Connection Closed!");
        } catch (Exception e) {
            System.out.println("SQLException : " + e.getMessage());
        }
    }
}
