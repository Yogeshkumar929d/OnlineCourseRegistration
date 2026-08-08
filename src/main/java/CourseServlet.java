import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object studentObject = session.getAttribute("studentId");

        if (studentObject == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (Integer) studentObject;
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO registrations(student_id,course_id) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ps.executeUpdate();

            con.close();

            response.sendRedirect("mycourses.jsp");

        } catch (Exception e) {
            throw new ServletException("Course registration failed", e);
        }
    }
}
