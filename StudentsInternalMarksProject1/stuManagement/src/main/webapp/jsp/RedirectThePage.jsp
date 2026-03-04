<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Check</title>
</head>
<body>

<%
String name = request.getParameter("name");
String psw  = request.getParameter("psw");

String nm = "1111";
String ps = "1234";

if (name != null && psw != null && name.equals(nm) && psw.equals(ps)) {
    response.sendRedirect(request.getContextPath() + "/pages/Registratin.html");
} else {
    response.sendRedirect(request.getContextPath() + "/pages/Login.html");
}
%>
</body>
</html>
