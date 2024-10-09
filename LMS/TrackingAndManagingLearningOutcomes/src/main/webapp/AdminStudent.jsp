<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            display: flex;
            flex-direction: column;
            margin: 0;
            height: 100vh; /* Full height */
            font-family: 'Arial', sans-serif; /* Font styling */
            background-color: #fce4ec; /* Light pink background */
        }
        
        .navbar {
            display: flex;
            justify-content: space-around; /* Space between items */
            background-color: #d81b60; /* Darker pink for the navbar */
            color: white;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Shadow for depth */
        }
        
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 25px; /* Rounded corners */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
            font-weight: bold; /* Bold font for emphasis */
        }
        
        .navbar a:hover {
            background-color: #c51162; /* Lighter pink on hover */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
        
        .content {
            margin: 20px; /* Space around content */
            flex-grow: 1; /* Allow content area to grow */
            padding: 20px;
            background-color: #ffffff; /* White background for content */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Shadow for content */
            border-radius: 10px; /* Rounded corners */
            overflow-y: auto; /* Enable scrolling if content exceeds the viewport */
        }
        
        .registrationWindow {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            background-color: #fce4ec; /* Light pink for registration window */
        }
        
        .registerButton {
            background-color: #d81b60; /* Button color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px; /* Rounded corners */
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth transition */
            margin-top: 10px;
        }
        
        .registerButton:hover {
            background-color: #c51162; /* Darker pink on hover */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h3 style="margin: 0;">Admin Dashboard</h3>
        <a href="#" onclick="displayStudentRegistration()">Student Registration</a>
        <a href="#" onclick="ReterivewALLStudent()">Display Students</a>
        <a href="#" onclick="AdminHome()">Back To Admin Home</a>
    </div>

    <div class="content">
        <div id="registrationForm" class="registrationWindow" style="display:none;">
            <div class="registrationHeader" style="font-size: 1.5em; margin-bottom: 10px;">Register Student</div>
            <div class="welcomeMessage" style="font-size: 1.2em; margin-bottom: 10px; color: #d81b60;">
                Welcome to the Student Registration!
            </div>
            <div class="registrationContent">
                <div style="display:block;padding-top:20px">Username*</div>
                <input type="text" id="username" />
                
                <div style="display:block;padding-top:20px">First Name*</div>
                <input type="text" id="firstName" />
                
                <div style="display:block;padding-top:20px">Last Name*</div>
                <input type="text" id="lastName" />
                
                <div style="display:block;padding-top:20px">Email*</div>
                <input type="email" id="email" />
                
                <div style="display:block;padding-top:20px">Password*</div>
                <input type="password" id="password" />
                
                <button class="registerButton" onclick="registerStudent()">Register</button>
                <div style="display:block;height:80px;line-height:80px">
                    <label id="ack"></label>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function displayStudentRegistration() {
            document.getElementById('registrationForm').style.display = 'block';
        }

        function registerStudent() {
            var data = JSON.stringify({
                username: document.getElementById('username').value,
                firstname: document.getElementById('firstName').value,
                lastname: document.getElementById('lastName').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            });

            var url = "http://localhost:8080/student/save"; // Adjust URL as needed
            callApi("POST", url, data, getResponse);
        }

        function getResponse(res) {
            if (res === "200") {
                document.getElementById('ack').style.color = "green";
                document.getElementById('ack').innerHTML = "Registration successful!";
            } else {
                document.getElementById('ack').style.color = "red";
                document.getElementById('ack').innerHTML = "Registration failed!";
            }
        }
        
        function ReterivewALLStudent() {
            location.replace("/AdminAllStudents.jsp");
        }

        function AdminHome() {
            location.replace("/AdminHome.jsp");
        }
    </script>
</body>
</html>
