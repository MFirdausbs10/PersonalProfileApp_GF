<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.ProfileBean" %>

<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #b8eacb, #e6f7ef);
        }

        .container {
            width: 600px;
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

        .row {
            margin-bottom: 20px;
        }

        .label {
            font-weight: 600;
            color: #2e7d63;
            margin-bottom: 8px;
            display: block;
            font-size: 16px;
        }

        .value {
            background-color: #eefcf4;
            padding: 14px;
            border-radius: 14px;
            border: 1.5px solid #a7e1c3;
            font-size: 15px;
        }

        .buttons {
            text-align: center;
            margin-top: 35px;
        }

        .buttons a {
            display: inline-block;
            margin: 0 10px;
            padding: 12px 22px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #2e7d63, #3fae84);
            color: white;
        }

        .btn-secondary {
            background: #eefcf4;
            color: #2e7d63;
            border: 1.5px solid #a7e1c3;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Profile Saved Successfully</h2>

    <div class="row">
        <span class="label">Name</span>
        <div class="value"><%= p.getName() %></div>
    </div>

    <div class="row">
        <span class="label">Student ID</span>
        <div class="value"><%= p.getStudentId() %></div>
    </div>

    <div class="row">
        <span class="label">Program</span>
        <div class="value"><%= p.getProgramme() %></div>
    </div>

    <div class="row">
        <span class="label">Email</span>
        <div class="value"><%= p.getEmail() %></div>
    </div>

    <div class="row">
        <span class="label">Hobbies</span>
        <div class="value"><%= p.getHobbies() %></div>
    </div>

    <div class="row">
        <span class="label">Introduction</span>
        <div class="value"><%= p.getIntroduction() %></div>
    </div>

    <div class="buttons">
        <a href="index.html" class="btn-secondary">Add New Profile</a>
        <a href="viewProfiles.jsp" class="btn-primary">View All Profiles</a>
    </div>
</div>

</body>
</html>
