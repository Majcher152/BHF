<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SQLite Demo</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Id.</th>
                    <th>Name</th>
                    <th>Last Name</th>
                    <th>e-mail</th>
                </tr>
            </thead>
            <tbody>
            <%
                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:C:/Users/lmajcher/bhf.db");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from users;");
 
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("id") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("lastname") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("</tr>");
                }
 
                rs.close();
                conn.close();
            %>
            </tbody>
        </table>
    </body>
</html>