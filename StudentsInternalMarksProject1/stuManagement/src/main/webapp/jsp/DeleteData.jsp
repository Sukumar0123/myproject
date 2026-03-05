<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    margin:0;
    font-family: Arial, sans-serif;
    background: var(--bg);
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:20px;
    color:var(--text);
}

.success-box{
    background: var(--card);
    padding: 36px 46px;
    border-radius: 16px;
    text-align: center;
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
    animation: fadeIn 0.6s ease-in-out;
    position:relative;
    max-width:560px;
    width:100%;
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
    font-family:"Segoe UI",sans-serif;
}

/* Button */
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
    box-shadow: 0 8px 18px rgba(11,46,74,0.18);
}

.success-box button:hover{
    transform: translateY(-1px);
    box-shadow: 0 14px 26px rgba(11,46,74,0.22);
}

/* Link inside button */
.success-box a{
    text-decoration:none;
    color:white;
    display:inline-block;
}

/* Animation */
@keyframes fadeIn{
    from { opacity:0; transform: translateY(12px); }
    to   { opacity:1; transform: translateY(0); }
}
</style>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%
    String name = request.getParameter("name");
    String htm = request.getParameter("htm");
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsudata", "root", "root");

        String query = "delete from students where stname='"+name+"'and HallTicketNum='"+htm+"' ";

            ps = con.prepareStatement(query);
        	int rows = ps.executeUpdate();
        if (rows > 0) { %> 
        <div class="success-box">
               <h1>&#10004; Successfully Deleted Data!</h1>
               <button><a href='../pages/Deletestudata.html' style="text-decoration: none; color: white;">Redirect The Page</a></button>
           </div>
           <% 
        } else {
            out.println("<h2 style='color:red;text-align:center;'>❌ Deletion Failed!</h2>");
        }
    } catch(Exception e) {
        %> 
        <div class="success-box">
            <h1><%= e.getMessage() %></h1>
            <button>
                <a href='../pages/De.html' style="text-decoration: none; color: white;">Redirect The Page</a>
            </button>
        </div>
        <%

    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</body>
</html>