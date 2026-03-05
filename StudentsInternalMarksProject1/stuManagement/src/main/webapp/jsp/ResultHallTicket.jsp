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
:root{
  --navy:#0b2e4a;
  --navy2:#08304f;
  --saffron:#ff9933;
  --green:#138808;
  --bg:#f5f7fa;
  --card:#ffffff;
  --text:#1f2a37;
  --muted:#6b7280;
  --border:#d9e2ec;
  --shadow:0 10px 28px rgba(11,46,74,0.18);
}

body{
  background: var(--bg);
  font-family: "Times New Roman", serif;
  margin: 0;
  padding: 0;
  color: var(--text);
}

/* CERTIFICATE CARD */
.certificate{
  width: 900px;
  margin: 22px auto;
  padding: 24px;
  background: var(--card);
  border: 2px solid var(--border);
  box-shadow: var(--shadow);
  position: relative;
  overflow: hidden;
}

/* Top govt accent bar */
.certificate::before{
  content:"";
  position:absolute;
  top:0; left:0;
  width:100%;
  height:7px;
  background: linear-gradient(90deg, var(--saffron), var(--green));
}

/* Inner border (official look) */
.certificate::after{
  content:"";
  position:absolute;
  inset: 14px;
  border: 2px double rgba(11,46,74,0.35);
  pointer-events:none;
}

/* HEADER */
.header{
  text-align:center;
  font-weight: bold;
  margin-top: 10px;
}
.header h1{
  font-size: 28px;
  margin: 0;
  color: var(--navy);
  letter-spacing: 0.3px;
}
.sub-header{
  text-align:center;
  font-size: 14px;
  margin: 6px 0 18px;
  color: var(--muted);
}

/* DETAILS */
.details{
  font-size: 16px;
  margin-bottom: 10px;
  padding: 14px 16px;
  border: 1px solid var(--border);
  border-radius: 10px;
  background: #fbfdff;
}
.details p{
  margin: 8px 0;
}
.details span{
  font-weight: bold;
  color: var(--navy);
}

/* TABLE */
table{
  width:100%;
  border-collapse: collapse;
  margin: 14px 0 6px;
  border: 1px solid var(--border);
  border-radius: 10px;
  overflow: hidden;
}

th, td{
  padding: 10px 8px;
  text-align:center;
  font-size: 14px;
  border: 1px solid var(--border);
}

th{
  background: linear-gradient(90deg, var(--navy), var(--navy2));
  color: #ffffff;
  font-weight: 700;
}

td{
  background: #ffffff;
}

tr:nth-child(even) td{
  background: #f8fafc;
}

/* SIGNATURES */
.signature-section{
  display:flex;
  justify-content: space-between;
  margin-top: 26px;
  gap: 20px;
}
.signature{
  text-align:center;
  font-size: 14px;
  color: var(--navy);
  width: 45%;
}
.signature br{
  line-height: 1.8;
}

/* NOTE */
.note{
  font-size: 12px;
  color: var(--muted);
  margin-top: 18px;
  padding-top: 10px;
  border-top: 1px dashed rgba(11,46,74,0.25);
}

/* PRINT BUTTON (kept your inline styles working too) */
button{
  background: var(--navy);
  border: 2px solid #ffffff;
  color: #ffffff;
  width: 110px;
  padding: 10px 0;
  border-radius: 8px;
  cursor:pointer;
  font-weight:700;
  box-shadow: 0 10px 18px rgba(11,46,74,0.18);
}
button:hover{
  background: #06233a;
}

/* Print-friendly: remove shadows & keep clean borders */
@media print{
  body{ background:#ffffff; }
  .certificate{ box-shadow:none; margin:0; }
  center{ display:none; }
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
