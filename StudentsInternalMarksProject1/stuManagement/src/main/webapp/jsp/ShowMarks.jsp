<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Internal Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
    </style>
</head>
<body>

<h2 align="center">Student Internal Marks</h2>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        // Load driver (use correct one based on your DB)
        Class.forName("com.mysql.cj.jdbc.Driver");  
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");
        
        String query = "SELECT * FROM StuInternalMarks";
        st = con.createStatement();
        rs = st.executeQuery(query);
%>

<table>
    <tr>
        <th>Name</th>
        <th>Roll No</th>
        <th>Year</th>
        <th>Subject 1</th><th>Int1</th><th>Int2</th><th>Semi</th><th>Present</th>
        <th>Subject 2</th><th>Int1</th><th>Int2</th><th>Semi</th><th>Present</th>
        <th>Subject 3</th><th>Int1</th><th>Int2</th><th>Semi</th><th>Present</th>
        <th>Subject 4</th><th>Int1</th><th>Int2</th><th>Semi</th><th>Present</th>
        <th>Subject 5</th><th>Int1</th><th>Int2</th><th>Semi</th><th>Present</th>
    </tr>

<%
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("sname") %></td>
        <td><%= rs.getString("htm") %></td>
        <td><%= rs.getInt("year") %></td>

        <td><%= rs.getString("sub1") %></td>
        <td><%= rs.getInt("intern11") %></td>
        <td><%= rs.getInt("intern12") %></td>
        <td><%= rs.getInt("semi1") %></td>
        <td><%= rs.getInt("present1") %></td>

        <td><%= rs.getString("sub2") %></td>
        <td><%= rs.getInt("intern21") %></td>
        <td><%= rs.getInt("intern22") %></td>
        <td><%= rs.getInt("semi2") %></td>
        <td><%= rs.getInt("present2") %></td>

        <td><%= rs.getString("sub3") %></td>
        <td><%= rs.getInt("intern31") %></td>
        <td><%= rs.getInt("intern32") %></td>
        <td><%= rs.getInt("semi3") %></td>
        <td><%= rs.getInt("present3") %></td>

        <td><%= rs.getString("sub4") %></td>
        <td><%= rs.getInt("intern41") %></td>
        <td><%= rs.getInt("intern42") %></td>
        <td><%= rs.getInt("semi4") %></td>
        <td><%= rs.getInt("present4") %></td>

        <td><%= rs.getString("sub5") %></td>
        <td><%= rs.getInt("intern51") %></td>
        <td><%= rs.getInt("intern52") %></td>
        <td><%= rs.getInt("semi5") %></td>
        <td><%= rs.getInt("present5") %></td>
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
