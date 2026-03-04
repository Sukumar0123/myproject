<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Student Data</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    .success-box {
        background: white;
        padding: 40px 50px;
        border-radius: 20px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        animation: fadeIn 0.8s ease-in-out;
    }

    .success-box h1 {
        font-size: 28px;
        color: #28a745;
        margin-bottom: 20px;
        animation: pop 0.5s ease-in-out;
    }

    .success-box button {
        background: linear-gradient(135deg, #ff7e5f, #feb47b);
        color: white;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 50px;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(255,126,95,0.3);
    }

    .success-box button:hover {
        background: linear-gradient(135deg, #feb47b, #ff7e5f);
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(255,126,95,0.5);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes pop {
        0% { transform: scale(0.8); }
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
