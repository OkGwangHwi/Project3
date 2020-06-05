<%@page import="model.MemberDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글작성 완료 전 로그인 체크하기 -->
<%-- <%@ include file="../common/isLogin.jsp" %>
<%@ include file="../common/isFlag.jsp" %> --%>
<%
//폼값전송받기
String name = request.getParameter("name"); 
String id = request.getParameter("id"); 
String pass1 = request.getParameter("pass1"); 
String tel1 = request.getParameter("tel1"); 
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String tel = tel1+tel2+tel3;
String mob1 = request.getParameter("mobile1"); 
String mob2 = request.getParameter("mobile2"); 
String mob3 = request.getParameter("mobile3"); 
String mob = mob1+mob2+mob3;
String email1 = request.getParameter("email1"); 
String email2 = request.getParameter("email2");
String email = email1+"@"+email2;
String zip1 = request.getParameter("zip1");
String address = request.getParameter("address");
String detailAddress = request.getParameter("detailAddress");
String extraAddress = request.getParameter("extraAddress");
String addr = zip1+" "+address+" "+detailAddress+" "+extraAddress;
String grade = request.getParameter("grade");

MemberDTO dto = new MemberDTO();
dto.setName(name);
dto.setId(id);
dto.setPass1(pass1);
dto.setTel(tel);
dto.setMob(mob);
dto.setEmail(email);
dto.setAddr(addr);
dto.setGrade(grade);

MemberDAO dao = new MemberDAO(application);

int affected = dao.joinMember(dto);
if(affected == 1){
%>
<script>
	alert("회원가입 성공");
</script>
<%
	response.sendRedirect("../main/main.do");
}
else{
%>
<script>
	alert("회원가입 실패");
	history.go(-1);
</script>
<%
}
%>