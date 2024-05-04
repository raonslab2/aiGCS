package egovframework.or.kr.GA01MAIN.web;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	 static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";  
	 
	 private static String DB_URL;
	 private static String USER;
	 private static String PASS;
	 
	 private Connection conn;
	 private Statement stmt;
 
	 public DBConnection() {
		 try {     
			//DB_URL = "jdbc:mariadb://13.209.238.3:3306/sepm_db";
			DB_URL = "jdbc:mariadb://127.0.0.1.3:3306/sepm_db";
			USER = "mrdev";
			PASS = "mrdev1";
		    Class.forName(JDBC_DRIVER);
		    conn = DriverManager.getConnection(DB_URL,USER,PASS);
		    stmt = conn.createStatement();
		 } catch(SQLException se) {
			 se.printStackTrace();
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
	 }
	 
	 public void insertData(String ip, String url, String redirect) {
		 String sql = "INSERT INTO connections VALUES ('" + ip + "', '" + url + "', '" + redirect + "', NOW())";
		 try {
			 stmt.executeUpdate(sql);
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }
		 close();
	 }
	 
	 public void insertData(String ip, String msg) { 
		 String sql = "INSERT INTO br_log(id,msq) VALUES ('" + ip + "', '" + msg + "')";
		 try {
			 stmt.executeUpdate(sql);
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }
		 close();
	 }
	 
	 public ResultSet selectData() { 
		 ResultSet rs = null;
		 String sql = "SELECT a.dl_id\r\n" + 
		 		"      ,a.dl_name\r\n" + 
		 		"      ,b.st_satelite_num\r\n" + 
		 		"      ,b.st_bat_voltage\r\n" + 
		 		"      ,b.st_bat_level\r\n" + 
		 		"      ,b.st_speed\r\n" + 
		 		"      ,b.st_x\r\n" + 
		 		"      ,b.st_y\r\n" + 
		 		"      ,b.st_z\r\n" + 
		 		"      ,b.st_atitude\r\n" + 
		 		"   FROM br_drone_list a\r\n" + 
		 		"     LEFT JOIN br_drone_state b\r\n" + 
		 		"     ON b.st_pk = ( select MAX(st_pk) from br_drone_state WHERE dl_id =  a.dl_id  )\r\n" + 
		 		"WHERE a.dl_state = 1\r\n" + 
		 		"  ";
		 try {
			 rs = stmt.executeQuery(sql);
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }  
		 return rs;
	 }
	 
	 
	 public String getStatusOutput() {
		 StringBuilder res = new StringBuilder();
		 String sql;
		 ResultSet rs;
		 try {
			 res.append("����� ���������� ��������: ");
			 sql = "SELECT COUNT(*) FROM connections";
			 rs = stmt.executeQuery(sql);
			 if (rs.next()) {
				 res.append(rs.getInt(1));
			 }
			 
			 res.append("\n���������� ���������� ��������: ");
			 sql = "SELECT COUNT(*) FROM (SELECT * FROM connections GROUP BY ip, url) AS temp";
			 rs = stmt.executeQuery(sql);
			 if (rs.next()) {
				 res.append(rs.getInt(1));
			 }
			 
			 res.append("\n\n������� �������� �� ������ IP:\n");
			 sql = "SELECT ip, COUNT(*) as count, MAX(time) AS last FROM connections GROUP BY ip";
			 rs = stmt.executeQuery(sql);
			 while (rs.next()) {
				 res.append("IP: " + rs.getString(1) + " ����������: " + rs.getString(2) + " ���������: " + rs.getString(3) + "\n");
			 }
			 
			 res.append("\n���������� �������������:\n");
			 sql = "SELECT redirect, COUNT(*) FROM connections WHERE redirect IS NOT NULL GROUP BY redirect";
			 rs = stmt.executeQuery(sql);
			 while (rs.next()) {
				 res.append("������: " + rs.getString(1) + " - " + rs.getString(2) + " ���\n");
			 }
		} catch (SQLException e) {
			 e.printStackTrace();
			 return "Can't get output!";
		}
		 
		 return res.toString();
	 }
	 
	 public void close() {
		 try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 }
	 
}