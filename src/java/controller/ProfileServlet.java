package controller;

import model.ProfileBean;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String programme = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String introduction = request.getParameter("introduction");

        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgramme(programme);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(introduction);

        try {
            // ✅ DERBY DRIVER
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // ✅ DERBY CONNECTION
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profiles",
                "app",
                "app"
            );

            String sql = "INSERT INTO profiles "
                       + "(name, student_id, programme, email, hobbies, introduction) "
                       + "VALUES (?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, programme);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, introduction);

            ps.executeUpdate();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("profile", profile);
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
