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

@WebServlet("/UpdateItemServlet2")
public class UpdateItemServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemNum = Integer.parseInt(request.getParameter("itemNum"));
        String itemName = request.getParameter("itemName");
        String itemType = request.getParameter("itemType");
        String itemDescription = request.getParameter("itemDescription");

        // Database credentials
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/space";
        String USER = "root";
        String PASS = "724626Ashfaq_root";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare SQL statement
            String sql = "UPDATE items2 SET name = ?, type = ?, description = ? WHERE num = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setString(2, itemType);
            stmt.setString(3, itemDescription);
            stmt.setInt(4, itemNum);

            // Execute SQL query
            stmt.executeUpdate();

            // Redirect back to the display page after updating
            response.sendRedirect("display2.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
