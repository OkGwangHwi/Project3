<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 파일명 : isLogin.jsp --%>
<%
if(session.getAttribute("id")==null){
%>
	<script>
		alert("로그인 후 이용해주십시오.");
		location.href = "../member/login.jsp";
	</script>
<%
	return;
}
%>