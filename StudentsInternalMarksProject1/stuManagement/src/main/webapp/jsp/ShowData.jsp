<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Students List</title>
    <style>
:root{
  --navy:#0b2e4a;
  --navy2:#08304f;
  --saffron:#ff9933;
  --green:#138808;
  --bg:#f5f7fa;
  --card:#ffffff;
  --text:#1f2a37;
  --border:#d9e2ec;
  --shadow:0 8px 20px rgba(11,46,74,0.15);
}

body{
  font-family: "Segoe UI", Arial, sans-serif;
  background: var(--bg);
  margin:0;
  padding:20px;
  color:var(--text);
}

h2{
  text-align:center;
  color:var(--navy);
  margin-bottom:20px;
}

/* Table container */
table{
  border-collapse:collapse;
  width:90%;
  margin:auto;
  background:var(--card);
  box-shadow:var(--shadow);
  border-radius:10px;
  overflow:hidden;
}

/* Table header */
th{
  background:linear-gradient(90deg,var(--navy),var(--navy2));
  color:white;
  padding:12px;
  font-size:15px;
  letter-spacing:0.3px;
}

/* Table cells */
td{
  border:1px solid var(--border);
  padding:10px;
  text-align:center;
  font-size:14px;
}

/* Zebra rows */
tr:nth-child(even){
  background:#f8fafc;
}

/* Hover effect */
tr:hover{
  background:#eef4ff;
  transition:0.2s;
}

/* Top accent line like other pages */
table::before{
  content:"";
  display:block;
  height:5px;
  background:var(--saffron);
}
</style>
</head>
<body>

<h2 align="center">Students Information</h2>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");  
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");

        String query = "SELECT * FROM students";
        st = con.createStatement();
        rs = st.executeQuery(query);
%>

<table>
    <tr>
        <th>Student Name</th>
        <th>Father Name</th>
        <th>Mother Name</th>
        <th>Hall Ticket Number</th>
        <th>Year</th>
        <th>College Name</th>
        <th>Date of Birth</th>
    </tr>

<%
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("stname") %></td>
        <td><%= rs.getString("fname") %></td>
        <td><%= rs.getString("mname") %></td>
        <td><%= rs.getString("HallTicketNum") %></td>
        <td><%= rs.getInt("year") %></td>
        <td><%= rs.getString("colegename") %></td>
        <td><%= rs.getString("Dataofbirth") %></td>
    </tr>
<%
    }
%>
</table>

<%
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(st != null) try { st.close(); } catch(Exception e) {}
        if(con != null) try { con.close(); } catch(Exception e) {}
    }
%>

</body>
</html>
