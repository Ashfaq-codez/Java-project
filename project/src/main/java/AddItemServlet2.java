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

@WebServlet("/AddItemServlet2")
public class AddItemServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        String itemType = request.getParameter("itemType");
        String itemDescription = request.getParameter("itemDescription");

        // Database credentials
        String DB_URL = "jdbc:mysql://localhost/space";
        String USER = "root";
        String PASS = "724626Ashfaq_root";

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO items2 (name, type, description) VALUES (?, ?, ?)")) {

            // Prepare SQL statement
            stmt.setString(1, itemName);
            stmt.setString(2, itemType);
            stmt.setString(3, itemDescription);

            // Execute SQL query
            stmt.executeUpdate();

            // Redirect back to the display page after adding
            response.sendRedirect("display2.jsp");
        } catch (SQLException e) {
            // Log the exception
            e.printStackTrace(); // You can replace this with a logging mechanism
        }
    }
}
