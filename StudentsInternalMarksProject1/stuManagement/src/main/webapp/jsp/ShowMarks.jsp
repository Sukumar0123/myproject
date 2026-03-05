<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Internal Marks</title>
    <style>
:root{
  --navy:#0b2e4a;
  --navy2:#08304f;
  --saffron:#ff9933;
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
  margin: 10px 0 18px;
}

/* Make wide table usable */
.table-wrap{
  width: 100%;
  overflow-x: auto;
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 10px;
  box-shadow: var(--shadow);
}

/* Table */
table{
  border-collapse: collapse;
  width: 100%;
  min-width: 1200px; /* helps for many columns */
  background: var(--card);
}

/* Header */
th{
  background: linear-gradient(90deg, var(--navy), var(--navy2));
  color: white;
  padding: 12px 10px;
  text-align: center;
  font-size: 13px;
  border: 1px solid rgba(255,255,255,0.15);
  position: sticky;
  top: 0; /* keeps header visible while scrolling */
  z-index: 2;
}

/* Cells */
td{
  border: 1px solid var(--border);
  padding: 10px 8px;
  text-align: center;
  font-size: 13px;
}

/* Zebra rows */
tr:nth-child(even){
  background: #f8fafc;
}

/* Hover effect */
tr:hover td{
  background: #eef4ff;
  transition: 0.2s;
}

/* Govt accent line */
.table-wrap::before{
  content:"";
  display:block;
  height:5px;
  background: var(--saffron);
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
<div class="table-wrap">
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
</div>>

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
