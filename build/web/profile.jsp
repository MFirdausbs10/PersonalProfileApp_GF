<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Personal Profile Form</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #b8eacb, #e6f7ef);
        }

        .container {
            width: 850px;
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

        label {
            font-weight: 600;
            color: #2e7d63;
            display: block;
            margin-bottom: 6px;
        }

        input, textarea {
            width: 100%;
            padding: 14px;
            border-radius: 14px;
            border: 1.5px solid #a7e1c3;
            background-color: #eefcf4;
            margin-bottom: 22px;
            font-size: 15px;
        }

        textarea {
            resize: none;
            height: 100px;
        }

        button {
            width: 100%;
            padding: 15px;
            border-radius: 16px;
            border: none;
            background: linear-gradient(135deg, #2e7d63, #3fae84);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .view {
            text-align: center;
            margin-top: 25px;
        }

        .view a {
            color: #2e7d63;
            font-weight: 600;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Personal Profile Form</h2>

    <form action="ProfileServlet" method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Student ID</label>
        <input type="text" name="student_id" required>

        <label>Programme</label>
        <input type="text" name="programme" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Hobbies</label>
        <input type="text" name="hobbies">

        <label>Self Introduction</label>
        <textarea name="introduction" placeholder="Tell us about yourself"></textarea>

        <button type="submit">Submit Profile</button>
    </form>

    <div class="view">
        <a href="viewProfiles.jsp">View All Profiles</a>
    </div>
</div>
</body>
</html>
