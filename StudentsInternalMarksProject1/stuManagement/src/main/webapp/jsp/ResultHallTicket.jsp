<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>University Certificate</title>
<style>
    body {
        background-color: #fdf9e3; /* Cream background */
        font-family: 'Times New Roman', serif;
        margin: 0;
        padding: 0;
    }
    .certificate {
        width: 900px;
        margin: 20px auto;
        padding: 20px;
        border: 8px double #006400; 
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }
    .header {
        text-align: center;
        color: #006400;
        font-weight: bold;
    }
    .header h1 {
        font-size: 26px;
        margin: 0;
    }
    .sub-header {
        text-align: center;
        font-size: 14px;
        margin-bottom: 20px;
    }
    .details {
        font-size: 16px;
        margin-bottom: 15px;
    }
    .details span {
        font-weight: bold;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 15px 0;
    }
    table, th, td {
        border: 1px solid #006400;
    }
    th, td {
        padding: 8px;
        text-align: center;
        font-size: 14px;
    }
    .signature-section {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
    }
    .signature {
        text-align: center;
        font-size: 14px;
    }
    .note {
        font-size: 12px;
        color: #333;
        margin-top: 20px;
    }
</style>
</head>
<body>

<div class="certificate">
    <div class="header">
        <h1>Vikrama Simhapuri University</h1>
        <div class="sub-header">Directorate of Government Examinations - Post Graduation Certificate</div>
    </div>

<%
    String name = request.getParameter("name");
    String htnum = request.getParameter("htnum");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");

        String query = "SELECT s.stname, s.fname, s.mname, s.HallTicketNum, s.year, s.colegename, s.Dataofbirth, " +
                       "m.sub1, m.intern11, m.intern12, m.semi1, m.present1, " +
                       "m.sub2, m.intern21, m.intern22, m.semi2, m.present2, " +
                       "m.sub3, m.intern31, m.intern32, m.semi3, m.present3, " +
                       "m.sub4, m.intern41, m.intern42, m.semi4, m.present4, " +
                       "m.sub5, m.intern51, m.intern52, m.semi5, m.present5 " +
                       "FROM students s " +
                       "JOIN StuInternalMarks m ON s.stname = m.sname AND s.HallTicketNum = m.htm " +
                       "WHERE s.stname = ? AND s.HallTicketNum = ?";

        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, htnum);

        rs = ps.executeQuery();

        if (rs.next()) {
%>

    <div class="details">
        <p><span>Hall Ticket No:</span> <%= rs.getString("HallTicketNum") %></p>
        <p><span>Name of the Candidate:</span> <%= rs.getString("stname") %></p>
        <p><span>Father’s Name:</span> <%= rs.getString("fname") %></p>
        <p><span>Mother’s Name:</span> <%= rs.getString("mname") %></p>
        <p><span>College Name:</span> <%= rs.getString("colegename") %></p>
        <p><span>Date of Birth:</span> <%= rs.getString("Dataofbirth") %></p>
        <p><span>Year of Examination:</span> <%= rs.getInt("year") %></p>
    </div>

    <table>
        <tr>
            <th>Subject</th>
            <th>Internal 1 Marks</th>
            <th>Internal 2 Marks</th>
            <th>SeminarMarks</th>
            <th>PresentMarks</th>
        </tr>
        <tr>
            <td><%= rs.getString("sub1") %></td>
            <td><%= rs.getInt("intern11") %></td>
            <td><%= rs.getInt("intern12") %></td>
            <td><%= rs.getInt("semi1") %></td>
            <td><%= rs.getInt("present1") %></td>
        </tr>
        <tr>
            <td><%= rs.getString("sub2") %></td>
            <td><%= rs.getInt("intern21") %></td>
            <td><%= rs.getInt("intern22") %></td>
            <td><%= rs.getInt("semi2") %></td>
            <td><%= rs.getInt("present2") %></td>
        </tr>
        <tr>
            <td><%= rs.getString("sub3") %></td>
            <td><%= rs.getInt("intern31") %></td>
            <td><%= rs.getInt("intern32") %></td>
            <td><%= rs.getInt("semi3") %></td>
            <td><%= rs.getInt("present3") %></td>
        </tr>
        <tr>
            <td><%= rs.getString("sub4") %></td>
            <td><%= rs.getInt("intern41") %></td>
            <td><%= rs.getInt("intern42") %></td>
            <td><%= rs.getInt("semi4") %></td>
            <td><%= rs.getInt("present4") %></td>
        </tr>
        <tr>
            <td><%= rs.getString("sub5") %></td>
            <td><%= rs.getInt("intern51") %></td>
            <td><%= rs.getInt("intern52") %></td>
            <td><%= rs.getInt("semi5") %></td>
            <td><%= rs.getInt("present5") %></td>
        </tr>
    </table>

<%
        } else {
%>
    <p style="color:red;">No record found for given student.</p>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>

    <div class="signature-section">
        <div class="signature">_________________<br>Head of Department</div>
        <div class="signature">_________________<br>Director of Examinations</div>
    </div>

    <div class="note">
        Note: This is a system-generated certificate. Valid for official use.
    </div>
</div>

<center>
    <button onclick="window.print()" style="background-color:black;width: 100px;border:2px solid white;color: white;">
        Print
    </button>
</center>

</body>
</html>
