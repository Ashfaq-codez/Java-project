import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username parameter from the request
        String username = request.getParameter("username");

        // Perform delete operation
        boolean deleted = deleteUser(username);

        // Redirect to the user details page
        if (deleted) {
            response.sendRedirect("userDetails.jsp?deleted=true");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private boolean deleteUser(String username) {
        // Initialize database connection variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/space", "root", "724626Ashfaq_root");

            // Prepare SQL statement for deleting user
            String query = "DELETE FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);

            // Execute the delete statement
            int rowsAffected = pstmt.executeUpdate();

            // Check if any rows were affected (user deleted successfully)
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Close resources
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
