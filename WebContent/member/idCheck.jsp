<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO dao= new MemberDAO(application);

int rst = 0;
String id = request.getParameter("id");
rst = dao.idCheck(id);

if(rst == 1){
%>
<script>
	alert("중복");
</script>
<%}else{ %>
<script>
	alert("중복아님");
</script>
<%} %>