<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Courses</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="box wide">
    <h2>My Registered Courses</h2>

    <table>
        <tr>
            <th>Course</th>
            <th>Duration</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();

                String sql = "SELECT c.name, c.duration FROM registrations r " +
                             "JOIN courses c ON r.course_id=c.id " +
                             "WHERE r.student_id=?";

                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, (Integer) session.getAttribute("studentId"));

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("duration") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
            <tr><td colspan="2">Unable to load registered courses.</td></tr>
        <%
            }
        %>
    </table>

    <a href="courses.jsp">Back to Courses</a>
    <a href="logout">Logout</a>
</div>
</body>
</html>
