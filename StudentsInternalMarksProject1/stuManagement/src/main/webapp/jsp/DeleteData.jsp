<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
    }</style>
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