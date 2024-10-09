
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Course Management</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }

        /* Horizontal navigation bar */
        .navbar {
            background-color: #ff69b4; /* Pink color for navbar */
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar h3 {
            color: white;
            margin: 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #ff1493; /* Darker pink for hover effect */
        }

        .content {
            padding: 20px;
            margin-top: 20px;
        }

        /* Registration Window Styling */
        .registrationWindow {
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 600px;
            margin: auto;
        }

        .registrationHeader {
            font-size: 24px;
            color: #ff69b4;
            margin-bottom: 20px;
        }

        .registrationContent div {
            font-size: 16px;
            margin-bottom: 10px;
        }

        input[type="number"], input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .registerButton {
            background-color: #ff69b4;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .registerButton:hover {
            background-color: #ff1493;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .content {
                margin-top: 10px;
                padding: 10px;
            }

            .registrationWindow {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Horizontal Navigation Bar -->
    <div class="navbar">
        <h3>Admin Dashboard</h3>
        <div>
            <a href="#" onclick="displayCourseRegistration()">Course Registration</a>
            <a href="#" onclick="ReterivewALLCourses()">Display Courses</a>
            <a href="#" onclick="AdminHome()">Back To Admin Home</a>
        </div>
    </div>

    <div class="content">
        <!-- Course Registration Form -->
        <div id="courseRegistrationForm" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">Register Course</div>
            <div class="registrationContent">
                <div>Course ID*</div>
                <input type="number" id="courseId" />

                <div>Course Name*</div>
                <input type="text" id="courseName" />

                <div>Course Description*</div>
                <input type="text" id="courseDescription" />

                <button class="registerButton" onclick="registerCourse()">Register</button>
                <div style="height: 80px;">
                    <label id="courseAck"></label>
                </div>
            </div>
        </div>

        <!-- Optional Course Display Section -->
        <div id="coursesList" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">All Courses</div>
            <div id="coursesTable" style="padding-top:20px;">
                <!-- The courses will be displayed here dynamically -->
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function displayCourseRegistration() {
            document.getElementById('courseRegistrationForm').style.display = 'block';
            document.getElementById('coursesList').style.display = 'none'; // Hide courses list if open
        }

        function registerCourse() {
            var data = JSON.stringify({
                courseid: document.getElementById('courseId').value,
                coursename: document.getElementById('courseName').value,
                coursedescription: document.getElementById('courseDescription').value
            });

            var url = "http://localhost:8080/courses/save"; // Adjust URL as needed
            callApi("POST", url, data, getCourseResponse);
        }

        function getCourseResponse(res) {
            if (res === "200") {
                document.getElementById('courseAck').style.color = "green";
                document.getElementById('courseAck').innerHTML = "Course registration successful!";
            } else {
                document.getElementById('courseAck').style.color = "red";
                document.getElementById('courseAck').innerHTML = "Course registration failed!";
            }
        }

        function ReterivewALLCourses() {
            location.replace("/AdminAllCourses.jsp");
        }

        function AdminHome() {
            location.replace("/AdminHome.jsp");
        }
    </script>
</body>
</html>
