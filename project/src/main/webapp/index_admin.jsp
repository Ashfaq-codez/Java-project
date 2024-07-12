<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Space Organizer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('dashboard-background.jpg'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            color: #fff;
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            height: 100vh; /* Ensure full viewport height */
        }
        .container {
            max-width: 300px; /* Adjust as needed */
            padding: 20px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black background */
            border-radius: 10px;
            margin-top: 20px; /* Space from top */
            margin-right: 20px; /* Space from right */
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #fff; /* White text color */
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        a {
            text-decoration: none;
            color: #333; /* Dark text color */
            background-color: #F3F01F; /* Yellow color scheme */
            padding: 15px 30px;
            border-radius: 25px;
            display: inline-block;
            transition: background-color 0.3s;
            font-size: 1.2em;
            margin: 10px;
        }
        a:hover {
            background-color: #FFD700; /* Darker shade of yellow on hover */
        }
        .image-section {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        .image-section img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Space Organizer</h1>
        <ul>
            <strong><li><a href="UserController">	User </a></li></strong>
            <strong><li><a href="AdminController">	Admin </a></li></strong>
        </ul>
    </div>
    <div class="image-section">
        <img src="https://i.pinimg.com/originals/47/20/51/472051c6d88bd2837525520597251d67.gif" alt="Living Room">
    </div>
</body>
</html>
