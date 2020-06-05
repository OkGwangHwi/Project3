<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.removeAttribute("id");
	session.removeAttribute("pass");

	session.invalidate();
	
	response.sendRedirect("index.jsp");
%>