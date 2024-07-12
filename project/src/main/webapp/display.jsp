<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Items</title>
    <style>
    body {
        background-color: #E6E6FA; /* Lavender background */
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    h2 {
        text-align: center;
        color: #E726A6;
        padding: 20px;
        margin-top: 50px;
    }

    table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #ffCF3BA6f;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #16A085; /* Saffron color for headers */
        color: #fff; /* Text color for headers */
    }

    tr:nth-child(even) {
        background-color: #F5F5F5;
    }

    tr:hover {
        background-color: #FFFAF0;
    }

    a {
        text-decoration: none;
        color: #007bff;
    }

    a:hover {
        text-decoration: underline;
    }

    .add-link {
        display: block;
        padding: 10px 20px;
        background-color: #8FD208; /* Saffron color for button */
        color: #fff;
        border-radius: 5px;
        text-decoration: none;
        margin-top: 20px;
        width: fit-content;
        margin-left: auto;
        margin-right: auto;
    }

    .add-link:hover {
        background-color: #DB9CE9; /* Darker shade of saffron on hover */
    }

    .space-tips-link {
        display: inline-block;
        background: linear-gradient(to right, #00b4db, #16A085); /* Gradient background for button */
        border: none;
        color: white;
        text-align: center;
        font-size: 24px;
        padding: 50px 90px;
        margin-top: 60px;
        text-decoration: none;
        border-radius: 25px;
        cursor: pointer;
        animation: jump 1s infinite alternate;
        font-family: 'Arial', sans-serif;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
    }

    .space-tips-link span {
        position: relative;
        z-index: 2;
    }

    .space-tips-link::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.3);
        border-radius: 25px;
        z-index: 1;
        transition: opacity 0.3s ease;
        opacity: 0;
    }

    .space-tips-link:hover::before {
        opacity: 1;
    }

    @keyframes jump {
        0% {
            transform: translateY(0);
        }
        100% {
            transform: translateY(-25px);
        }
    }
</style>

</head>
<body>
    <h2>Item List</h2>
    <table>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Place to Keep</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <% 
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
                    int itemNum = rs.getInt("num");
                    String itemName = rs.getString("name");
                    String itemDescription = rs.getString("description");
        %>
        <tr>
            <td><%= itemNum %></td>
            <td><%= itemName != null ? itemName : "" %></td>
            <td><%= itemDescription != null ? itemDescription : "" %></td>
            <td><a href="editItem.jsp?itemNum=<%= itemNum %>">Edit</a></td> <!-- Edit link -->
            <td><a href="DeleteItemServlet?itemNum=<%= itemNum %>">Delete</a></td> <!-- Delete link -->
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
    <a href="AddItemForm.jsp" class="add-link">Add New Item</a> <!-- Link to a form to add new item -->
    <!-- Centered and styled space organization button -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="SpaceOrganizationTips.jsp" class="space-tips-link">Space Organizing Tips</a>
    </div>
</body>
</html>
