import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Admin credentials (replace with secure handling in production)
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            // Invalidate any existing session
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Show login form
            request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("adminLoggedIn") != null && (boolean) session.getAttribute("adminLoggedIn")) {
                // User is logged in, allow access to user details page
                request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
            } else {
                // Not logged in or session expired, redirect to login page
                response.sendRedirect(request.getContextPath() + "/AdminController?action=login");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("authenticate".equals(action)) {
            // Process login form submission
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
                // Successful login, set session attribute
                HttpSession session = request.getSession();
                session.setAttribute("adminLoggedIn", true);
                response.sendRedirect(request.getContextPath() + "/userDetails.jsp");
            } else {
                // Failed login, redirect back to login page with error message
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
            }
        } else if ("logout".equals(action)) {
            // Logout action
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate(); // Invalidate session
            }
            response.sendRedirect(request.getContextPath() + "/AdminController?action=login");
        } else {
            // Handle other POST requests if needed
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method not supported for this request.");
        }
    }
}
