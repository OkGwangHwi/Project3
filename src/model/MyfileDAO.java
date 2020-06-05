package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class MyfileDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public MyfileDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id = "suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("MariaConnectURL"),id,pw);
			System.out.println("DB 연결성공");
		}
		catch(Exception e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}
	}
	
	public MyfileDAO() {
		try {
			Context initCtx = new InitialContext();

			Context ctx = (Context)initCtx.lookup("java:comp/env");
			
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			
			con = source.getConnection();
			
			System.out.println("DBCP 연결성공");
		}
		catch(Exception e) {
			System.out.println("DBCP 연결실패");
			e.printStackTrace();
		}
	}
	
	//DB자원해제
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}
	
	
	public int myfileInsert(MyfileDTO dto) {
		int affected = 0;
		try {
			String query = "INSERT INTO myfile ( "
					+ " title,content,id,visitcount,bname,ofile,sfile) "
					+ " VALUES ( "
					+ " ?, ?, ?, 0, ?, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setNString(3, dto.getId());
			psmt.setNString(4, dto.getBname());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e ) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<MyfileDTO> myFileList(){
		
		List<MyfileDTO> fileList = new Vector<MyfileDTO>();
		
		String query = "SELECT * FROM myfile "
				+ " WHERE 1=1 "
				+ " ORDER BY idx DESC ";
		System.out.println("query="+query);
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				
				dto.setTitle(rs.getString(3));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				
				fileList.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return fileList;
	}
}
