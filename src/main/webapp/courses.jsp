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
    <title>Available Courses</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="box wide">
    <h2>Available Courses</h2>
    <p>Welcome, <%= session.getAttribute("studentName") %></p>

    <table>
        <tr>
            <th>Course</th>
            <th>Duration</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM courses");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("duration") %></td>
            <td>
                <form action="course" method="post">
                    <input type="hidden" name="courseId"
                           value="<%= rs.getInt("id") %>">
                    <button type="submit">Register</button>
                </form>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
            <tr><td colspan="3">Unable to load courses.</td></tr>
        <%
            }
        %>
    </table>

    <a href="mycourses.jsp">My Courses</a>
    <a href="logout">Logout</a>
</div>
</body>
</html>
