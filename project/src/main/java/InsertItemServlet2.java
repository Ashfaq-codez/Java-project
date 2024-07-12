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

@WebServlet("/InsertItemServlet2")
public class InsertItemServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if any of the fields are empty
        String itemNumString = request.getParameter("itemNum");
        String itemName = request.getParameter("itemName");
        String itemType = request.getParameter("itemType");
        String itemDescription = request.getParameter("itemDescription");

        System.out.println("Parameters received: itemNum=" + itemNumString + ", itemName=" + itemName + ", itemType=" + itemType + ", itemDescription=" + itemDescription);

        if (itemNumString == null || itemNumString.isEmpty() ||
            itemName == null || itemName.isEmpty() ||
            itemDescription == null || itemDescription.isEmpty()) {
            // If any field is empty, set error parameter in URL
            System.out.println("Empty field detected. Redirecting to IndexItem2.jsp with error=1");
            response.sendRedirect("IndexItem2.jsp?error=1");
            return;
        }

        // Parse itemNoString into an integer
        int itemNum;
        try {
            itemNum = Integer.parseInt(itemNumString);
        } catch (NumberFormatException e) {
            System.out.println("NumberFormatException: Item No must be a valid number");
            request.setAttribute("errorMessage", "Item No must be a valid number");
            request.getRequestDispatcher("IndexItem2.jsp").forward(request, response);
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
            System.out.println("JDBC Driver registered");

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to database");

            // Prepare SQL statement
            String sql = "INSERT INTO items2 (num, name, type, description) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, itemNum);
            stmt.setString(2, itemName);
            stmt.setString(3, itemType);
            stmt.setString(4, itemDescription);
            System.out.println("SQL statement prepared: " + sql);

            // Execute SQL query
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            // Redirect to display.jsp
            response.sendRedirect("display2.jsp");
        } catch (SQLException se) {
            se.printStackTrace();
            System.out.println("SQLException: " + se.getMessage());
            // Handle any SQL errors
            request.setAttribute("errorMessage", "Database error: " + se.getMessage());
            request.getRequestDispatcher("IndexItem2.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception: " + e.getMessage());
            // Handle any other errors
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("IndexItem2.jsp").forward(request, response);
        } finally {
            // Finally block to close resources
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
