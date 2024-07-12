<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom Styles */
        body {
            position: relative;
            background-color: #E2D0FD; /* Light grayish background */
            font-family: 'Roboto', sans-serif; /* Default font */
            color: #333; /* Darker font color for better contrast */
            overflow: hidden; /* Hide overflow to prevent scrolling */
        }
        .container {
            position: relative; /* Relative positioning */
            z-index: 5; /* Ensure content appears above background */
            max-width: 800px; /* Limit container width for better readability */
            margin: 100px auto; /* Center container */
            padding: 50px; /* Add padding for spacing */
            shadow: 0px 0px 20px rgba(0, 0, 0, 0.6);
            background-color: rgba(254, 254, 254, 0.7); /* White background */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.6); /* Subtle shadow */
        }
        .form-group {
            margin-bottom: 1.5rem; /* Add space between form fields */
        }
        label {
            font-weight: bold; /* Stronger label text */
            color: #555; /* Darker label text */
        }
        input[type="text"],
        input[type="email"] {
            background: none; /* No background */
            border: none; /* No border */
            border-bottom: 2px solid #ff6f00; /* Orange bottom border */
            border-radius: 0; /* No border radius */
            color: #333; /* Darker font color */
            outline: none; /* Remove focus outline */
            padding: 10px 0; /* Padding for space */
            width: 100%; /* Full width */
            box-sizing: border-box; /* Include padding in width */
            transition: border-bottom-color 0.2s ease-in-out; /* Smooth transition */
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border-bottom-color: #ffcc80; /* Lighter orange on focus */
        }
        button[type="submit"] {
            background-color: #ff6f00; /* Orange submit button */
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            color: #fff; /* White text */
            font-weight: bold; /* Stronger button text */
            text-transform: uppercase; /* Uppercase text */
            letter-spacing: 1px; /* Increased letter spacing */
            transition: background-color 0.3s ease; /* Smooth transition */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
        }
        button[type="submit"]:hover {
            background-color: #ff944d; /* Darker orange button on hover */
        }
        .mb-4 {
            margin-bottom: 2.5rem; /* Add space below heading */
        }
        .text-center {
            color: #333; /* Darker heading */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Edit User</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="UpdateServlet" method="post">
                    <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Update</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
