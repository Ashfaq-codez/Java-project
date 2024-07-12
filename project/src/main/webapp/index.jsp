<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            background-image: linear-gradient(to bottom right, lavender, lavenderblush);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.92);
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
            padding: 30px;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #7b68ee; /* Lavender color */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: 500;
            color: orange; /* Darker orange color */
        }
        .form-control {
            border-radius: 20px;
            box-shadow: none;
        }
        .btn-primary {
            border-radius: 20px;
            width: 100%;
            background-color: orange; /* Darker orange color */
            border-color: #ff6000; /* Darker orange color */
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: darkorange; /* Even darker orange color on hover */
            border-color: #ff4500; /* Even darker orange color on hover */
        }
        .mt-3 {
            text-align: center;
            margin-top: 20px;
            color: #7b68ee; /* Lavender color */
        }
        .mt-3 a {
            color: #ff6347; /* Darker orange color */
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .mt-3 a:hover {
            color: #ff4500; /* Even darker orange color on hover */
        }
         .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            /*filter: blur(3px);*/
        }
         .image-section {
            text-align: center;
            position: relative; /* make image section relative for absolute positioning */
            margin-bottom: 40px; /* increased margin bottom for image section */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="SignUpServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter unique email ID" required>
               
            
            </div>
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" class="form-control" id="fullname" name="fullname" required>
            </div>
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
        <p class="mt-3">Already registered? <a href="login.jsp">Login here</a></p>
    </div>
        <div class="image-section">
            <img class="background" src="https://i.pinimg.com/originals/bf/cf/48/bfcf48d206e2d19c27705b476a8bfa04.gif" alt="Living Room" class="room-image">
            
        </div>
    


    

    <!-- Bootstrap JS (optional) -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</body>
</html>