<!DOCTYPE html>
<html>
<head>
    <title>Add New Item</title>
    
    <style>
    /* Eric Meyer's CSS Reset */
/* http://meyerweb.com/eric/tools/css/reset/ */
/* v2.0 | 20110126 */
/* License: none (public domain) */

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}

body {
    line-height: 1;
}

ol, ul {
    list-style: none;
}

blockquote, q {
    quotes: none;
}

blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3; /* off-white background */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"], input[type="submit"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            background-color: #ddd; /* Lighter gray for button */
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .link:hover {
            background-color: #ccc; /* Darker gray on hover */
        }
        .hint {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Item</h2>
        <form action="AddItemServlet" method="post">
            <label for="itemName">Item Name:</label><br>
            <input type="text" id="itemName" name="itemName"><br>
            <label for="itemDescription">Item Description:</label><br>
            <textarea id="itemDescription" name="itemDescription" rows="4" placeholder="Enter a description (max 255 characters)"></textarea>
            <!-- <span class="hint">Max 255 characters</span><br> -->
            <input type="submit" value="Add Item">
        </form>
        <button class="link" onclick="window.location.href='display.jsp'">Back to Display</button>
    </div>
</body>
</html>
