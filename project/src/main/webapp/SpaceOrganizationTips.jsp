<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Space Organization Tips</title>
    <style>
        body {
            background-color: #f2f2f2; /* Light gray background */
            margin: 0;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff; /* White background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Box shadow */
        }

        h1 {
            text-align: center;
            color: #4CAF50; /* Green color for heading */
            margin-top: 30px;
        }

        p {
            text-align: justify;
            color: #333; /* Dark gray text */
            font-size: 18px;
            line-height: 1.5;
            margin-top: 20px;
        }

        ul {
            list-style-type: none; /* No bullet points */
            margin-top: 20px;
            padding-left: 0;
            color: #555; /* Medium gray text */
        }

        li {
            margin-bottom: 10px;
        }

        .back-button {
            display: block;
            margin-top: 30px;
            text-align: center;
        }

        .back-button a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50; /* Green button */
            color: #fff; /* White text */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        .different-option-button {
            text-align: center;
            margin-top: 20px;
        }

        .different-option-button a {
            display: inline-block;
            padding: 15px 25px;
            background-color: #FF5F6D; /* Coral color */
            color: #fff; /* White text */
            text-decoration: none;
            border-radius: 50px; /* Round border */
            border: 2px solid #FF5F6D; /* Coral color border */
            font-weight: bold;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .different-option-button a:hover {
            background-color: #FF3C4E; /* Darker coral on hover */
            border-color: #FF3C4E; /* Darker coral border on hover */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333; /* Dark gray text */
        }

        .item {
            margin-bottom: 10px;
        }

        .item-name {
            font-weight: bold;
        }

        .item-description {
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Physical Space Organizing Tips</h1>
        
        <ul>
            <li>Declutter regularly to keep your space tidy.</li>
            <li>Assign specific places for frequently used items.</li>
            <li>Use storage solutions like bins, shelves, and drawers to maximize space.</li>
            <li>Label storage containers to easily locate items.</li>
            <li>Utilize vertical space by installing shelves or hanging organizers.</li>
        </ul>
        <h2>List of Items:</h2>
        <div class="item-list">
            <table>
                <tr>
                    <th>Name</th>
                    <th>place Specified</th>
                </tr>
                <!-- Insert items from the database here -->
                <% 
                    // Code to retrieve items from the database and display them
                    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                    String DB_URL = "jdbc:mysql://localhost/space";
                    String USER = "root";
                    String PASS = "724626Ashfaq_root";
                    Connection conn = null;
                    Statement stmt = null;
                    try {
                        Class.forName(JDBC_DRIVER);
                        conn = DriverManager.getConnection(DB_URL, USER, PASS);
                        stmt = conn.createStatement();
                        String sql;
                        sql = "SELECT * FROM items";
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String itemName = rs.getString("name");
                            String itemDescription = rs.getString("description");
                %>
                <tr class="item">
                    <td><%= itemName != null ? itemName : "" %></td>
                    <td><%= itemDescription != null ? itemDescription : "" %></td>
                </tr>
                <% 
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div class="back-button">
            <a href="display.jsp">Back to Item List</a>
        </div>
        <div class="different-option-button">
            <a href="spaceOrganiser.jsp">Organize virtual space </a>
        </div>
    </div>
</body>
</html>
