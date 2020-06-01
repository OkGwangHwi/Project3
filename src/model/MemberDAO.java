package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;


public class MemberDAO {
	
	//멤버변수(클래스 전체 멤버메소드에서 접근 가능)
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	//기본생성자
	public MemberDAO() {
		System.out.println("MemberDAO생성자 호출");
	}
	
	public MemberDAO(String driver,String url) {
		try {
		Class.forName(driver);
		String id = "suamil_user";
		String pw = "1234";
		con = DriverManager.getConnection(url,id,pw);
		System.out.println("DB연결성공");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDAO(ServletContext ctx) {
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
	
	
	//회원의 중복확인 판단한다.
	public int idCheck(String id){
		  int rst = 0;
		  try {
			   String sql = "select * from membership where id=?";
			   psmt = con.prepareStatement(sql);
			   psmt.setString(1, id);
			   rs = psmt.executeQuery();
			   if(rs.next()){
			   rst = 1;
			   }
		  }
		  catch(Exception e){
		   e.printStackTrace();
		  }
		  return rst;
		 }
	
	//방법2 : 회원인증후 MemberDTO객체로 회원정보를 반환한다. 
	/*public MemberDTO getMemberDTO(String uid, String upass) {
		//DTO객체를 생성한다. 
		MemberDTO dto = new MemberDTO();
		//쿼리문을 작성
		String query = "SELECT id, pass, name FROM "
				+ " membership WHERE id=? AND pass=?";
		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다. 
				dto.setId(rs.getString("id"));
				dto.setPass1(rs.getString("pass"));
				dto.setName(rs.getString(3));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		
		//DTO객체를 반환한다. 
		return dto;
	}*/
	
	
	//방법3 : 
	public Map<String, String> getMemberMap(String id,String pwd){
		Map<String, String> maps = new HashMap<String, String>();
		
		String sql = "SELECT id,pass,name FROM membership "
				+ " WHERE id=? AND pass=?";
		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다.
				maps.put("name",rs.getString("name"));
				maps.put("id",rs.getString("id"));
				maps.put("pass",rs.getString("pass"));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		//DTO객체를 반환한다.
		return maps;
	}
	
	public int joinMember(MemberDTO dto) {
		
		int affected = 0;
		try {
			/*
			  Oracle에서는 시퀀스를 사용해서 일련번호를 입력하지만
			  MariaDB에서는 auto_increment제약조건으로 컬럼 자체를
			  자동증가 컬럼으로 지정한다. 자동증가컬럼은 임의의 값을
			  입력하는것보다 쿼리에서 제외시켜 주는것이 좋다.
			 */
			String query = "INSERT INTO membership ( "
					+ " name,id,pass,tel,mob,email,addr) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass1());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMob());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getAddr());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//아이디 찾기
	/*public Map<String, String> idSearch(String name,String email){
		Map<String, String> maps = new HashMap<String, String>();
		
		String sql = "SELECT name,email FROM membership "
				+ " WHERE name=? AND email=?";
		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, name);
			psmt.setString(2, email);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다.
				maps.put("name",rs.getString("name"));
				maps.put("email",rs.getString("email"));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("idSearch오류");
			e.printStackTrace();
		}
		//DTO객체를 반환한다.
		return maps;
	}*/
	
	public Map<String,String> idSearch(String email){
		Map<String,String> maps = new HashMap<String,String>();
		  try {
			   String sql = "SELECT id FROM membership WHERE email=?";
			   psmt = con.prepareStatement(sql);
			   psmt.setString(1, email);
			   rs = psmt.executeQuery();
			   if(rs.next()){
				   maps.put("id",rs.getString("id"));
			   }
		  }
		  catch(Exception e){
		   e.printStackTrace();
		  }
		  return maps;
	}
	
	public Map<String,String> pwSearch(String id){
		Map<String,String> maps = new HashMap<String,String>();
		  try {
			   String sql = "SELECT pass FROM membership WHERE id=?";
			   psmt = con.prepareStatement(sql);
			   psmt.setString(1, id);
			   rs = psmt.executeQuery();
			   if(rs.next()){
				   maps.put("pass",rs.getString("pass"));
			   }
		  }
		  catch(Exception e) {
			  e.printStackTrace();
		  }
		  return maps;
	}
}