<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Students List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #28a745;
            color: white;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
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
