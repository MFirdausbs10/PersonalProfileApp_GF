<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #b8eacb, #e6f7ef);
        }

        .container {
            width: 900px;
            margin: 60px auto;
            background: #ffffff;
            border-radius: 22px;
            padding: 45px 55px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2e7d63;
            margin-bottom: 40px;
            font-size: 28px;
        }

        .search {
            text-align: center;
            margin-bottom: 35px;
        }

        .search input[type="text"] {
            width: 320px;
            padding: 14px;
            border-radius: 14px;
            border: 1.5px solid #a7e1c3;
            background-color: #eefcf4;
            font-size: 15px;
        }

        .search input[type="submit"] {
            padding: 14px 22px;
            border-radius: 14px;
            border: none;
            background: linear-gradient(135deg, #2e7d63, #3fae84);
            color: white;
            font-weight: bold;
            margin-left: 10px;
            cursor: pointer;
        }

        .profile {
            margin-bottom: 35px;
        }

        .row {
            margin-bottom: 18px;
        }

        .label {
            font-weight: 600;
            color: #2e7d63;
            margin-bottom: 6px;
            display: block;
        }

        .value {
            background-color: #eefcf4;
            padding: 14px;
            border-radius: 14px;
            border: 1.5px solid #a7e1c3;
            font-size: 15px;
        }

        hr {
            border: none;
            border-top: 1px solid #dff0e6;
            margin: 30px 0;
        }

        .back {
            text-align: center;
            margin-top: 30px;
        }

        .back a {
            text-decoration: none;
            color: #2e7d63;
            font-weight: 600;
            font-size: 15px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>All Student Profiles</h2>

    <!-- SEARCH -->
    <div class="search">
        <form method="get">
            <input type="text" name="keyword" placeholder="Search Name or Student ID">
            <input type="submit" value="Search">
        </form>
    </div>

<%
    // ✅ DERBY JDBC DRIVER
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    // ✅ DERBY CONNECTION
    Connection conn = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/student_profiles",
        "app",
        "app"
    );

    String keyword = request.getParameter("keyword");

    String sql = "SELECT * FROM profiles";
    if (keyword != null && !keyword.trim().isEmpty()) {
        sql += " WHERE name LIKE '%" + keyword + "%' OR student_id LIKE '%" + keyword + "%'";
    }

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);

    while (rs.next()) {
%>

    <div class="profile">
        <div class="row">
            <span class="label">Name</span>
            <div class="value"><%= rs.getString("name") %></div>
        </div>

        <div class="row">
            <span class="label">Student ID</span>
            <div class="value"><%= rs.getString("student_id") %></div>
        </div>

        <div class="row">
            <span class="label">Programme</span>
            <div class="value"><%= rs.getString("programme") %></div>
        </div>

        <div class="row">
            <span class="label">Email</span>
            <div class="value"><%= rs.getString("email") %></div>
        </div>

        <div class="row">
            <span class="label">Hobbies</span>
            <div class="value"><%= rs.getString("hobbies") %></div>
        </div>
    </div>

    <hr>

<%
    }
    conn.close();
%>

    <div class="back">
        <a href="index.html">← Back to Add Profile</a>
    </div>
</div>

</body>
</html>
