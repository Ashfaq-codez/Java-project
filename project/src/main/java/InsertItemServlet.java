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

public class InsertItemServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if any of the fields are empty
        String itemNumString = request.getParameter("itemNum");
        String itemName = request.getParameter("itemName");
        String itemDescription = request.getParameter("itemDescription");

        if (itemNumString == null || itemNumString.isEmpty() ||
            itemName == null || itemName.isEmpty() ||
            itemDescription == null || itemDescription.isEmpty()) {
            // If any field is empty, set error parameter in URL
            response.sendRedirect("IndexItem.jsp?error=1");
            return;
        }

        // Parse itemNoString into an integer
        int itemNum;
        try {
            itemNum = Integer.parseInt(itemNumString);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Item No must be a valid number");
            request.getRequestDispatcher("IndexItem.jsp").forward(request, response);
            return;
        }

        // JDBC driver name and database URL
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/space";

        // Database credentials
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
            String sql = "INSERT INTO items (num, name, description) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, itemNum);
            stmt.setString(2, itemName);
            stmt.setString(3, itemDescription);

            // Execute SQL query
            stmt.executeUpdate();

            // Redirect to display.jsp
            response.sendRedirect("display.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Finally block to close resources
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            } // nothing we can do
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
