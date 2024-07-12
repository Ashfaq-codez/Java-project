<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 400px;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.6);
            background-color: rgba(254, 254, 254, 0.5);
        }
        .container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .form-group label {
            font-weight: 600;
            color: #555;
        }
        .form-control {
            border: 1px solid #ccc;
            border-radius: 20px;
            padding: 12px;
            margin-bottom: 20px;
        }
        .btn-primary {
            border-radius: 20px;
            background-color: #5E35B1; /* Deep Purple color */
            border: 1px solid #5E35B1;
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            margin-top: 20px;
            transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #512DA8; /* Darker shade on hover */
            border-color: #512DA8;
        }
        .forgot-password {
            text-align: right;
            margin-top: 10px;
            color: #777;
        }
        .forgot-password a {
            color: #5E35B1; /* Deep Purple color for link */
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .forgot-password a:hover {
            color: #512DA8; /* Darker shade on hover */
        }
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            object-fit: cover;
            filter: brightness(0.5); /* Adjust brightness for contrast */
        }
        .home-link {
            text-align: center;
            margin-top: 20px;
        }
        .home-link a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #AC83EA; /* Blue color */
            color: #fff;
            text-decoration: none;
            border-radius: 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .home-link a:hover {
            background-color: #846AAC; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <form action="AdminController?action=authenticate" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="forgot-password">
            <a href="#">Forgot password?</a>
        </div>

        <!-- Home button -->
        <div class="home-link">
            <a href="index_admin.jsp">Go to Dashboard</a>
        </div>
    </div>
    <div class="image-section">
        <img class="background" src="https://i.pinimg.com/originals/3f/51/4b/3f514b185c7a7c1e190af12fed71968d.gif" alt="Background Image">
    </div>

    <!-- Bootstrap JS (Optional for some Bootstrap components) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
