<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Student Data</title>
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
    --shadow:0 6px 18px rgba(11,46,74,0.15);
}

body{
    font-family: 'Segoe UI', Arial, sans-serif;
    background: var(--bg);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    padding: 20px;
    color: var(--text);
}

.success-box{
    background: var(--card);
    padding: 36px 46px;
    border-radius: 16px;
    text-align: center;
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
    animation: fadeIn 0.6s ease-in-out;
    position: relative;
    max-width: 560px;
    width: 100%;
}

/* Govt accent bar */
.success-box::before{
    content:"";
    position:absolute;
    top:0; left:0;
    width:100%;
    height:5px;
    background: var(--saffron);
    border-radius:16px 16px 0 0;
}

.success-box h1{
    font-size: 24px;
    color: var(--green);
    margin: 12px 0 18px;
    font-family: "Segoe UI", sans-serif;
    animation: pop 0.45s ease-in-out;
}

.success-box button{
    background: linear-gradient(90deg, var(--navy), var(--navy2));
    color: white;
    border: none;
    padding: 12px 22px;
    font-size: 15px;
    font-weight: 700;
    border-radius: 10px;
    cursor: pointer;
    transition: 0.25s;
    box-shadow: 0 10px 20px rgba(11,46,74,0.18);
}

.success-box button:hover{
    transform: translateY(-1px);
    box-shadow: 0 16px 28px rgba(11,46,74,0.22);
}

.success-box a{
    text-decoration: none;
    color: white;
    display: inline-block;
}

/* Animations */
@keyframes fadeIn{
    from { opacity: 0; transform: translateY(12px); }
    to   { opacity: 1; transform: translateY(0); }
}

@keyframes pop{
    0% { transform: scale(0.96); }
    100% { transform: scale(1); }
}
</style>
</head>
<body>

<%
String stname = request.getParameter("sname");
String fname = request.getParameter("fname");
String mname = request.getParameter("mname");
String Htmnum = request.getParameter("htmnum");
int year = Integer.parseInt(request.getParameter("year"));
String collegename = request.getParameter("college");
String dateofbirth = request.getParameter("dataofbith");

Connection con = null;
Statement stmt = null;

String query = "INSERT INTO students VALUES ('" + stname + "','" + fname + "','" + mname + "','" + Htmnum + "'," + year + ",'" + collegename + "','" + dateofbirth + "')";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");
    stmt = con.createStatement();
    int rowsInserted = stmt.executeUpdate(query);  // FIXED

    if (rowsInserted > 0) {
%>
    <div class="success-box">
        <h1>&#10004; Successfully Inserted Data!</h1>
        <button><a href='../pages/InsertStuData.html' style="text-decoration: none; color: white;">Redirect The Page</a></button>
    </div>
<%
    } else {
        out.println("<h2 style='color:red;'>Failed to insert data.</h2>");
    }
} catch (ClassNotFoundException e) {
    out.println("Driver Not Found: " + e.getMessage());
} catch (SQLException e) {
    out.println("SQL Exception: " + e.getMessage());
} finally {
    try { if (stmt != null) stmt.close(); if (con != null) con.close(); } catch (SQLException e) {}
}
%>

</body>
</html>
