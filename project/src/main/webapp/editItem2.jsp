<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Items</title>
    <style>
    
       body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: skyblue; /* Changed background color to sky blue */
    }

    /* Rest of your CSS styles remain unchanged */
    .container {
        max-width: 950px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1E90FF;
            color: #fff;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .btn-submit {
        	
            background-color: #1E90FF;
            color: #fff;
            cursor: pointer;
        }

        .btn-submit:hover {
        	transform: scale(1.1);
            background-color: #007bff;
        }

        .delete-link {
            color: #dc3545;
            text-decoration: none;
        }

        .delete-link:hover {
            text-decoration: underline;
        }

        .delete-box {
            text-align: center;
            border: 1px solid #dc3545;
            border-radius: 5px;
            padding: 8px;
            background-color: #fff;
            color: #dc3545;
            cursor: pointer;
            display: inline-block;
        }

        .delete-box:hover {
        transform: scale(1.1);
            background-color: pink;
            color: #fff;
        }

        .add-item-box {
            text-align: center;
        }

        .add-item-btn {
            padding: 10px 20px;
            background-color: #1E90FF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .add-item-btn:hover {
        
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Files</h2>
        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Item Type</th>
                    <th>Description</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
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
                        sql = "SELECT * FROM items2";
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            int itemNum = rs.getInt("num");
                            String itemName = rs.getString("name");
                            String itemType = rs.getString("type");
                            String itemDescription = rs.getString("description");
                %>
                <tr>
                    <form action="UpdateItemServlet2" method="post"> <!-- Form for editing item -->
                        <input type="hidden" name="itemNum" value="<%= itemNum %>">
                        <td><input type="text" name="itemName" value="<%= itemName %>"></td>
                        <td><input type="text" name="itemType" value="<%= itemType %>"></td>
                        <td><input type="text" name="itemDescription" value="<%= itemDescription %>"></td>
                        <td><input type="submit" class="btn-submit" value="Save"></td>
                    </form>
                    <td><span class="delete-box"><a href="DeleteItemServlet2?itemNum=<%= itemNum %>" class="delete-link">Delete</a></span></td> <!-- Delete link -->
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
            </tbody>
        </table>
        <div class="add-item-box">
            <a href="AddItemForm2.jsp" class="add-item-btn">Add New Item</a> <!-- Link to a form to add new item -->
        </div>
    </div>
</body>
</html>
