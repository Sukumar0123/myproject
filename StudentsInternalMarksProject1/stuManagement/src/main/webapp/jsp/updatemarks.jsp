<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student Marks</title>

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
  --shadow:0 8px 22px rgba(11,46,74,0.15);
}

body{
  font-family: "Segoe UI", Arial, sans-serif;
  background: var(--bg);
  display:flex;
  justify-content:center;
  align-items:center;
  height:100vh;
  margin:0;
}

.success-box{
  background: var(--card);
  padding:40px 50px;
  border-radius:16px;
  text-align:center;
  box-shadow: var(--shadow);
  border:1px solid var(--border);
  position:relative;
}

/* top accent */
.success-box::before{
  content:"";
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:5px;
  background:var(--saffron);
  border-radius:16px 16px 0 0;
}

.success-box h1{
  font-size:24px;
  color:var(--green);
  margin-bottom:20px;
}

.redirect-btn{
  display:inline-block;
  background:linear-gradient(90deg,var(--navy),var(--navy2));
  color:white;
  padding:12px 25px;
  border-radius:8px;
  text-decoration:none;
  font-weight:bold;
  transition:0.3s;
}

.redirect-btn:hover{
  background:#06233a;
}
</style>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%
	String name = request.getParameter("name");
	String rollno = request.getParameter("htm");
	String year = request.getParameter("year");
	String dob = request.getParameter("dob");
	String subject1 = request.getParameter("subject1");
	String internal1_1 = request.getParameter("internal1_1");
	String internal2_1 = request.getParameter("internal2_1");
	String seminar1 = request.getParameter("seminar1");
	String present1 = request.getParameter("present1");
	String subject2 = request.getParameter("subject2");
	String internal1_2 = request.getParameter("internal1_2");
	String internal2_2 = request.getParameter("internal2_2");
	String seminar2 = request.getParameter("seminar2");
	String present2 = request.getParameter("present2");
	String subject3 = request.getParameter("subject3");
	String internal1_3 = request.getParameter("internal1_3");
	String internal2_3 = request.getParameter("internal2_3");
	String seminar3 = request.getParameter("seminar3");
	String present3 = request.getParameter("present3");
	String subject4 = request.getParameter("subject4");
	String internal1_4 = request.getParameter("internal1_4");
	String internal2_4 = request.getParameter("internal2_4");
	String seminar4 = request.getParameter("seminar4");
	String present4 = request.getParameter("present4");
	String subject5 = request.getParameter("subject5");
	String internal1_5 = request.getParameter("internal1_5");
	String internal2_5 = request.getParameter("internal2_5");
	String seminar5 = request.getParameter("seminar5");
	String present5 = request.getParameter("present5");

	Connection con = null;
	PreparedStatement ps = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");

		String sql = "UPDATE StuInternalMarks SET `year`=?, sub1=?, intern11=?, intern12=?, semi1=?, present1=?,sub2=?, intern21=?, intern22=?, semi2=?, present2=?,sub3=?, intern31=?, intern32=?, semi3=?, present3=?,sub4=?, intern41=?, intern42=?, semi4=?, present4=?,sub5=?, intern51=?, intern52=?, semi5=?, present5=? WHERE sname=? AND htm=?;";

		ps = con.prepareStatement(sql);

		ps.setInt(1, Integer.parseInt(year));

		ps.setString(2, subject1);
		ps.setInt(3, Integer.parseInt(internal1_1));
		ps.setInt(4, Integer.parseInt(internal2_1));
		ps.setInt(5, Integer.parseInt(seminar1));
		ps.setInt(6, Integer.parseInt(present1));

		ps.setString(7, subject2);
		ps.setInt(8, Integer.parseInt(internal1_2));
		ps.setInt(9, Integer.parseInt(internal2_2));
		ps.setInt(10, Integer.parseInt(seminar2));
		ps.setInt(11, Integer.parseInt(present2));

		ps.setString(12, subject3);
		ps.setInt(13, Integer.parseInt(internal1_3));
		ps.setInt(14, Integer.parseInt(internal2_3));
		ps.setInt(15, Integer.parseInt(seminar3));
		ps.setInt(16, Integer.parseInt(present3));
		ps.setString(17, subject4);
		ps.setInt(18, Integer.parseInt(internal1_4));
		ps.setInt(19, Integer.parseInt(internal2_4));
		ps.setInt(20, Integer.parseInt(seminar4));
		ps.setInt(21, Integer.parseInt(present4));
		ps.setString(22, subject5);
		ps.setInt(23, Integer.parseInt(internal1_5));
		ps.setInt(24, Integer.parseInt(internal2_5));
		ps.setInt(25, Integer.parseInt(seminar5));
		ps.setInt(26, Integer.parseInt(present5));

		ps.setString(27, name);
		ps.setString(28, rollno);

		int rows = ps.executeUpdate();
		if (rows > 0) { %>
	<div class="success-box">
        <h1>&#10004; Successfully Updated Student Marks
        <button><a href='../pages/updateRigiMaeks.html' style="text-decoration: none; color: white;">Redirect The Page</a></button>
    </div>
    <% 
		} else { %> 
        <div class="success-box">
        <h1>&#10004; Student Not Found!</h1>
        <button><a href='../pages/updateRigiMaeks.html' style="text-decoration: none; color: white;">Redirect The Page</a></button>
    </div>
    <% 
		}
	} catch (Exception e) {
		out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
	} finally {
		if (ps != null)
			try {
		ps.close();
			} catch (Exception e) {
			}
		if (con != null)
			try {
		con.close();
			} catch (Exception e) {
			}
	}
	%>

</body>
</html>