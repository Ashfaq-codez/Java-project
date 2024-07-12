<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Spaces</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        .container {
            position: relative;
            height: 125%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .home-button {
            position: absolute;
            top: 580px;
            left: 539px;
            border: none;
            cursor: pointer;
            outline: none;
            padding: 10px 15px; /* Adjust padding */
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            transition: transform 0.3s ease;
            font-size: 18px; /* Adjust font size */
        }
        #physical-space, #virtual-space, #index-space {
            border: none;
            cursor: pointer;
            outline: none;
            margin: 18px;
            padding: 70px;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            transition: transform 0.3s ease;
            font-size: 22px;
        }
        #physical-space {
            background-image: linear-gradient(to bottom right, #ff7f0e, #ffaa00);
        }
        #virtual-space {
            background-image: linear-gradient(to bottom right, #c77dff, #7d7dff);
        }
        #index-space {
            background-color: #e0e0e0;
            color: #333;
        }
        .button:hover, .home-button:hover {
            transform: scale(1.1);
        }
        h1 {
    font-size: 7.3rem;
    font-weight: bold;
    color: white;
    background-color: rgba(248, 187, 208, 0.8);
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
    border-radius: 25px;
    margin-bottom: 50px;
    text-align: center;
            position: absolute;
            top: -6%;
            left: 4%;
            right:50%;
            /*transform: translate(15%, 15%);*/
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
        <button class="home-button" onclick="window.location.href = 'spaceIndex.jsp';">
            Home
        </button>
        <strong><h1>Spaces !</h1></strong>
        <button id="physical-space" class="button" onclick="window.location.href = 'IndexItem.jsp';">
            Physical Space
        </button>
        <button id="virtual-space" class="button" onclick="window.location.href = 'IndexItem2.jsp';">
            Virtual Space
        </button>
        
    </div>
     <div class="image-section">
            <img class="background" src="  https://i.pinimg.com/originals/3c/92/e8/3c92e83d7cafd3dbfc374fa4cfe894c2.gif   " alt="Living Room" class="room-image">
            
        </div>
</body>
</html>
