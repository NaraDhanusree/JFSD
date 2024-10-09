
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Base styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa; /* Light grey background */
            display: flex;
            flex-direction: column; /* Arrange children in a column */
            height: 100vh;
            overflow: hidden; /* Prevent overflow */
        }

        h3 {
            margin: 0;
            font-size: 2em;
            text-align: center;
            color: #ffffff; /* White text color */
            padding: 15px 0; /* Add some padding */
            background-color: #ff69b4; /* Pink color for the navbar */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Increased shadow for highlight */
            transition: box-shadow 0.3s ease; /* Smooth transition for the shadow */
        }

        /* Navbar styling */
        .navbar {
            background-color: #ff69b4; /* Pink background for the navbar */
            color: white;
            padding: 10px 0;
            display: flex;
            justify-content: space-around; /* Center items in the navbar */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Increased shadow for highlight */
            position: relative; /* Positioning the navbar */
            border-radius: 0 0 10px 10px; /* Rounded corners */
        }

        .navbar label {
            padding: 10px 15px; /* Adjust padding for better spacing */
            cursor: pointer;
            background-color: #ff1493; /* Slightly darker pink */
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease; /* Add transform for hover effect */
            text-align: center;
            font-weight: bold; /* Bold font for emphasis */
            color: #ffffff; /* White text color */
        }

        .navbar label:hover {
            background-color: #ff85c0; /* Light pink on hover */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }

        /* Content area */
        .content {
            padding: 40px;
            flex-grow: 1; /* Allow content area to grow */
            background-color: #ffffff; /* White background for content */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px; /* Rounded corners */
            margin: 20px; /* Space around content */
            overflow-y: auto; /* Enable scrolling */
            text-align: center; /* Center text in the content */
        }

        /* Welcome message styling */
        .welcomeMessage {
            margin: 20px 0;
            font-size: 1.8em; /* Larger font size */
            color: #343a40; /* Darker text color */
            font-weight: bold; /* Bold text */
        }

        .welcomeText {
            font-size: 1.2em; /* Slightly larger than normal */
            color: #6c757d; /* Grey color for the secondary text */
            margin: 10px 0; /* Space around the text */
        }

        /* Registration window */
        .registrationWindow {
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 10px;
            background-color: #f8f9fa; /* Light grey background */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Buttons */
        .registerButton {
            background-color: #28a745; /* Bootstrap success color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .registerButton:hover {
            background-color: #218838; /* Darker green on hover */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column; /* Stack navbar items on small screens */
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h3>Admin Dashboard</h3>
        <label class="signuplabel" onClick="Student()">Student Data</label>
        <label class="signuplabel" onClick="faculty()">Faculty Data</label>
        <label class="signuplabel" onClick="Courses()">Courses</label>
        <label class="signuplabel" onClick="Mapping()">Mapping</label>
        <label class="signuplabel" onClick="Logout()">Logout</label>
    </div>

    <div class="content">
        <div id="registrationForm" class="registrationWindow">
            <div class="welcomeMessage">
                Welcome to the Admin Dashboard
            </div>
            <div class="welcomeText">
                Manage Student and Faculty records with ease!
            </div>
        </div>
    </div>

    <script>
        function faculty() {
            location.replace("/Adminfaculty.jsp");
        }
        
        function Student() {
            location.replace("/AdminStudent.jsp");
        }
        
        function Courses() {
            location.replace("/AdminCourse.jsp");
        }
        
        function Mapping() {
            location.replace("/AdminMapping.jsp");
        }
        
        function Logout() {
            location.replace("/index.jsp");
        }
    </script>
</body>
</html>

