<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
        background: linear-gradient(to bottom, #A3BAF0, #CB76E7);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: #fff;
        padding: 10px; /* Reduced padding */
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px; /* Reduced max-width */
        width: 100%;
    }

    h1 {
    	font-size:25px;
        text-align: center;
        color: #FF6600; /* Added color */
        padding: 4px; /* Added padding for better appearance */
    }

    form {
        display: flex;
        flex-direction: column;
    }

    input[type="text"], textarea {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: border-color 0.3s ease;
        width: 100%; /* Make text area full width */
    }

    input[type="text"]:focus, textarea:focus {
        outline: none;
        border-color: #7e7eff;
    }

    input[type="submit"], button[type="button"] {
        background-color: #4caf50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 10px;
    }

    input[type="submit"]:hover, button[type="button"]:hover {
        background-color: #45a049;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-bottom: 10px;
        display: none; /* Initially hide error message */
    }

    /* Style for the hint */
    .hint {
        font-size: 12px;
        color: #666;
    }

    .note {
        background-color: #ffc107;
        color: #333;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
        margin-top: 10px;
    }
</style>

</head>
<body>
    <div class="container">
        <h1>Add Files/Data</h1>
        <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
            <p class="error-message">Please enter all details.</p>
        <% } %>
        <form action="InsertItemServlet2" method="post" onsubmit="return validateForm()">
            <label for="itemNum" class="form-label">Item No:</label>
            <input type="text" class="form-control" id="itemNum" name="itemNum">
            <label for="itemName" class="form-label">Item Name:</label>
            <input type="text" class="form-control" id="itemName" name="itemName">
            <label for="itemType" class="form-label">Item Type:</label>
            <input type="text" class="form-control" id="itemType" name="itemType">
            <label for="itemDescription" class="form-label">Item Description:</label>
            <textarea id="itemDescription" name="itemDescription" rows="4" class="form-control" placeholder="Enter a description (max 255 characters)"></textarea>
            
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='display2.jsp'" style="margin-bottom: 10px;">Display Items</button>
            
            <div class="note">
                <strong>Note:</strong> To ensure Best Space Organization of the items, please mention the suitable Type Place for the item in the description box.
            </div>
        </form>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for form validation -->
    <script>
        function validateForm() {
            var itemNo = document.getElementById("itemNum").value;
            var itemName = document.getElementById("itemName").value;
            var itemDescription = document.getElementById("itemDescription").value;

            if (itemNo.trim() === "" || itemName.trim() === "" || itemDescription.trim() === "") {
                // Display error message if any field is empty
                document.querySelector(".error-message").style.display = "block";
                return false; // Prevent form submission
            }
            return true; // Allow form submission if all fields are filled
        }
    </script>
</body>
</html>
