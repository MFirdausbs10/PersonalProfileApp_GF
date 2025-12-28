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
            background: white;
            border-radius: 22px;
            padding: 45px 55px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2e7d63;
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
        }

        hr {
            border: none;
            border-top: 1px solid #dff0e6;
            margin: 30px 0;
        }

        .back {
            text-align: center;
            margin-top: 25px;
        }

        .back a {
            text-decoration: none;
            color: #2e7d63;
            font-weight: 600;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>All Student Profiles</h2>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/student_profiles",
        "app",
        "app"
    );

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM profiles");

    while (rs.next()) {
%>

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

    <div class="row">
        <span class="label">Self Introduction</span>
        <div class="value"><%= rs.getString("introduction") %></div>
    </div>

    <hr>

<%
    }
    conn.close();
%>

    <div class="back">
        <a href="profile.jsp">← Back to Add Profile</a>
    </div>
</div>
</body>
</html>
