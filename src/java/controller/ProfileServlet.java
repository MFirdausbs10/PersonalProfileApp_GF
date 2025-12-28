package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("student_id");
        String programme = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String introduction = request.getParameter("introduction");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profiles",
                "app",
                "app"
            );

            String sql = "INSERT INTO profiles "
                       + "(name, student_id, programme, email, hobbies, introduction) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, programme);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, introduction);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("viewProfiles.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
