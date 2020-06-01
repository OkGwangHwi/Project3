<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
SMTPAuth smtp = new SMTPAuth();

String email = request.getParameter("email2");
String id = request.getParameter("id");
String from = request.getParameter("from2");
String subject = request.getParameter("subject2");

MemberDAO dao = new MemberDAO(application);

Map<String,String> map = dao.pwSearch(id);

Map<String,String> emailContent = new HashMap<String,String>();
emailContent.put("from",request.getParameter("from2"));
emailContent.put("to",request.getParameter("email2"));
emailContent.put("subject",request.getParameter("subject2"));
emailContent.put("content",map.get("pass"));

if(map.get("pass")!=null){
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