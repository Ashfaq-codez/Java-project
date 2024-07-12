<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");
    if (adminLoggedIn == null || !adminLoggedIn) {
        response.sendRedirect(request.getContextPath() + "/AdminController?action=login");
        return; // Ensure nothing else on this page executes if not logged in
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5A436; /* Light gray background color */
            padding-top: 20px;
        }
        .container-box {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px; /* Rounded corners */
            padding: 20px; /* Padding inside the box */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08); /* Box shadow */
            margin-bottom: 20px; /* Bottom margin */
        }
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            background-color: transparent;
        }
        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }
        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }
        .btn-group {
            margin-top: 10px;
        }
        .btn-enter-space {
            margin-right: 5px;
            padding: 20px 60px; /* Adjusted padding for larger size */
            transition: background-color 0.3s, color 0.3s;
            border: 2px solid transparent; /* Transparent border */
            border-radius: 50px; /* Rounded border */
            font-size: 24px; /* Font size */
            background-color: #2196F3; /* Solid color - blue */
            color: #fff; /* Text color */
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1); /* Box shadow */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Display as inline block */
            position: relative; /* Relative positioning */
            overflow: hidden; /* Hidden overflow */
        }
        .btn-enter-space:hover {
            background-color: #1976D2; /* Adjusted hover color */
            color: #fff; /* Adjusted hover text color */
            transform: translateY(-5px); /* Move up on hover */
            box-shadow: 0 15px 20px rgba(0, 0, 0, 0.15); /* Enhanced box shadow on hover */
        }
        .btn-enter-space::before {
            content: ""; /* Empty content */
            position: absolute; /* Absolute positioning */
            top: 0;
            left: 50%;
            width: 300%; /* Larger width */
            height: 100%;
            background: rgba(255, 255, 255, 0.2); /* Semi-transparent white */
            transition: all 0.3s ease-out; /* Smooth transition */
            z-index: 2; /* Above button */
            transform: translateX(-50%) skewX(-15deg); /* Skew and center */
        }
        .btn-enter-space:hover::before {
            width: 0; /* Shrink width on hover */
        }
        .btn-enter-space span {
            position: relative; /* Relative positioning */
            z-index: 3; /* Above pseudo-element */
        }
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        .image-section {
            text-align: center;
            position: relative;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="container-box">
            <h2 class="text-center mb-4">User Details</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                    
                        try {
                            // Establishing MySQL connection
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/space", "root", "724626Ashfaq_root");
                    
                            // Retrieving user details from the database
                            String query = "SELECT * FROM users";
                            pstmt = conn.prepareStatement(query);
                            rs = pstmt.executeQuery();
                    
                            while (rs.next()) {
                                String username = rs.getString("username");
                                String fullName = rs.getString("fullname");
                                String email = rs.getString("email");
                    %>
                    <tr>
                        <td><%= username %></td>
                        <td><%= fullName %></td>
                        <td><%= email %></td>
                        <td>
                            <div class="btn-group">
                                <a href="EditServlet?username=<%= username %>" class="btn btn-primary" style="font-size: 14px;">Edit Details</a>
                                <a href="DeleteServlet?username=<%= username %>" class="btn btn-danger" style="font-size: 14px;">Delete Account</a>
                            </div>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (ClassNotFoundException | SQLException e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <!-- Logout button -->
        <div class="text-center mt-4">
            <form action="AdminController" method="post">
                <input type="hidden" name="action" value="logout">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>

    <div class="image-section">
        <img class="background" src="https://i.pinimg.com/originals/59/03/c9/5903c9e3bebf40d0aeab36a30ad217cf.gif" alt="Living Room">
    </div>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
