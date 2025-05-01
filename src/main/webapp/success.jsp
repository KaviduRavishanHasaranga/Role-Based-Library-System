<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Successful</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .success-container {
            text-align: center;
            padding: 60px;
        }

        .checkmark {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            display: inline-block;
            border: 5px solid #4CAF50;
            position: relative;
            animation: pop 0.4s ease-out forwards;
        }

        .checkmark::after {
            content: '';
            position: absolute;
            left: 28px;
            top: 14px;
            width: 25px;
            height: 50px;
            border-right: 5px solid #4CAF50;
            border-bottom: 5px solid #4CAF50;
            transform: rotate(45deg);
            animation: draw 0.4s ease-out 0.4s forwards;
        }

        @keyframes pop {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        @keyframes draw {
            0% {
                height: 0;
                width: 0;
            }
            100% {
                height: 50px;
                width: 25px;
            }
        }

        h2 {
            margin-top: 30px;
            color: #2c3e50;
        }

        .message {
            font-size: 18px;
            color: #555;
            margin-top: 10px;
        }

        .btn-link {
            margin-top: 30px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .btn-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container success-container">
    <div class="checkmark"></div>
    <h2>Reservation Successful!</h2>
    <p class="message">Thank you. Your book has been reserved.</p>
    <a href="dashboard.jsp" class="btn-link">Back to Dashboard</a>
</div>

</body>
</html>
