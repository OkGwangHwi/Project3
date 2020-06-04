<%@page import="model.MemberDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글작성 완료 전 로그인 체크하기 -->
<%-- <%@ include file="../common/isLogin.jsp" %>
<%@ include file="../common/isFlag.jsp" %> --%>
<%
String id = request.getParameter("inputID");
String name = request.getParameter("firstName")+request.getParameter("lastName");;
String email = request.getParameter("inputEmail");
String pass = request.getParameter("inputPassword");
String tel = request.getParameter("inputTelephone");
String mob = request.getParameter("inputMobile");
String addr = request.getParameter("inputAddress");

MemberDTO dto = new MemberDTO();

dto.setName(name);
dto.setId(id);
dto.setPass1(pass);
dto.setTel(tel);
dto.setMob(mob);
dto.setEmail(email);
dto.setAddr(addr);

MemberDAO dao = new MemberDAO(application);

int affected = dao.joinMember(dto);
if(affected == 1){
%>
<script>
	alert("회원가입 성공");
</script>
<%
	response.sendRedirect("login.html");
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