import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.*;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            // Establishing MySQL connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/space", "root", "724626Ashfaq_root");

            // Updating user details in the database
            String query = "UPDATE users SET fullname=?, email=? WHERE username=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.executeUpdate();

            response.sendRedirect("userDetails.jsp?username=" + username);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle errors appropriately (e.g., display error message, redirect to an error page)
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
