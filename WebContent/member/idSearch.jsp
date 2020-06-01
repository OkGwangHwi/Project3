<%@page import="java.util.HashMap"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
SMTPAuth smtp = new SMTPAuth();

String email = request.getParameter("email");
String from = request.getParameter("from");
String subject = request.getParameter("subject");

MemberDAO dao = new MemberDAO(application);

Map<String,String> map = dao.idSearch(email);

Map<String,String> emailContent = new HashMap<String,String>();
emailContent.put("from",request.getParameter("from"));
emailContent.put("to",request.getParameter("email"));
emailContent.put("subject",request.getParameter("subject"));
emailContent.put("content",map.get("id"));

if(map.get("id")!=null){
	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		%>
			<script>
				alert("메일발송성공");
			</script>
		<%
	}
	else{
		%>
		<script>
			alert("메일발송실패");
		</script>
	<%
	}
	return;
}
%>
