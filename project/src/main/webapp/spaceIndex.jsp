<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Space Organizer</title>
    <style>
        body {
            margin: 20px;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            overflow: hidden;
        }

      header {
            text-align: center;
           /* position: absolute;*/
           
        }

       h1 {
    font-size: 5.3rem;
    font-weight: bold;
    color: #fff;
    animation: text-fade 2s ease infinite alternate, vibrate 0.1s linear infinite; /* Added vibrate animation */
    margin-bottom: 70px;
    text-align: center;
            position: absolute;
            top: -6%;
            left: 4%;
            right:80%;
            /*transform: translate(15%, 15%);*/
}


@keyframes vibrate {
    0% { transform: rotate(-0.1deg); }
    25% { transform: rotate(0.3deg); }
    50% { transform: rotate(-0.4.5deg); }
    75% { transform: rotate(0.5deg); }
    100% { transform: rotate(-0.5.5deg); }
}


        .btn-section {
            margin-top: 20px;
            text-align: center;
            position: absolute;
            top: 67%;
            left:0%;
            right:60%;
            transform: translate(20%, 10%);
        }

        .btn-section button {
            display: inline-block;
            padding: 20px 50px; /* Adjusted padding for larger buttons */
            text-decoration: none;
            border: none;
            border-radius: 50px;
            font-size: 2rem;
            margin: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
        }
.btn-section button.user-details {
    background-color: rgba(0, 123, 255, 0.55); /* Adjust transparency here (0.3 for example) */
    color: #84C7FF; /* Blue text color */
    border: 2px solid #007bff; /* Blue border */
}

.btn-section button.user-details:hover {
    background-color: #007bff; /* Solid blue on hover */
    color: #fff; /* White text color on hover */
}
.btn-section button.space-organizer {
    background-color: rgba(229, 50, 12, 0.55); /* Adjust transparency here (0.3 for example) */
    color: #F26447; /* Red text color */
    border: 2px solid #E5320C; /* Red border */
}

.btn-section button.space-organizer:hover {
    background-color: #E5320C; /* Solid red on hover */
    color: #fff; /* White text color on hover */
}

        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            filter: blur(4px);
        }
    </style>
</head>
<body>
<header>
        <h1>Welcome To Space Organizer</h1>
        </header>
        <div class="btn-section">
            

            <button class="space-organizer" onclick="window.location.href='spaceOrganiser.jsp'">&#x1F6E0; Space Organizer</button>
        </div>

    <img class="background" src="https://i.pinimg.com/originals/13/7e/45/137e45c33cb5939abcd3ff4d8f858c63.gif" alt="Background Image">
</body>
</html>
