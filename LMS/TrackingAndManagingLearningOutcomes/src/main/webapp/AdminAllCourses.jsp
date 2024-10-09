<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Courses</title>
    <link rel="stylesheet" type="text/css" href="css/student.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .topnav {
            background-color: #333;
            color: white;
            padding: 14px 16px;
            text-align: center;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        }
        .sidebar {
            width: 200px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #333;
            padding-top: 20px;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 8px;
            border-radius: 4px;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .sidebar ul li a:hover {
            background-color: #575757;
        }
        .container {
            margin-left: 200px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
        }
        .update-btn, .delete-btn {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .delete-btn {
            background-color: #f44336;
        }
        #updateForm {
            display: none;
            margin-top: 20px;
        }
        #updateForm h3 {
            margin-bottom: 10px;
        }
        #updateForm form {
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }
        #updateForm label {
            display: block;
            margin-bottom: 5px;
        }
        #updateForm input[type="text"], #updateForm input[type="email"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        #updateForm button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- Top Navbar -->
    <div class="topnav">
        <span class="project-title">Student Learning Management System</span>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="AdminCourse.jsp">Dashboard</a></li>
            <li><a href="#">ALL COURSES</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container">
        <table id="courseTable">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="courseData">
                <!-- Data will be populated here using JavaScript -->
            </tbody>
        </table>

        <!-- Update Form (Initially Hidden) -->
        <div id="updateForm">
            <h3>Update Course</h3>
            <form id="courseUpdateForm">
                <label for="updateCourseName">Course Name:</label><br>
                <input type="text" id="updateCourseName" name="updateCourseName" required><br>

                <label for="updateDescription">Description:</label><br>
                <input type="text" id="updateDescription" name="updateDescription" required><br>

                <!-- Hidden input to store Course ID -->
                <input type="hidden" id="updateId" name="updateId">

                <br>
                <button type="button" onclick="submitCourseUpdate()">Submit Update</button>
            </form>
        </div>
    </div>

    <!-- Script to handle API calls and update functionality -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to fetch all course data from the backend
        function loadCourseData() {
            var url = "http://localhost:8080/courses/readAllCourses";  // API endpoint to get all courses
            console.log("Loading course data from: ", url);
            callApi("GET", url, null, displayCourseData);  // Call API using callApi() method defined in main.js
        }

        // Callback function to display course data in the table
        function displayCourseData(response) {
            console.log("Received course data: ", response);
            var courseData = JSON.parse(response);  // Parse JSON response
            var courseTable = document.getElementById("courseData");

            // Clear existing table rows
            courseTable.innerHTML = "";

            // Populate table with course data
            courseData.forEach(function(course) {
                var row = "<tr>" +
                            "<td>" + course.courseid + "</td>" +
                            "<td>" + course.coursename + "</td>" +
                            "<td>" + course.coursedescription + "</td>" +
                            "<td>" +
                                "<button class='update-btn' onclick='populateCourseUpdateForm(" + JSON.stringify(course) + ")'>Update</button>" +
                                "<button class='delete-btn' onclick='deleteCourse(" + course.courseid + ")'>Delete</button>" +
                            "</td>" +
                          "</tr>";
                courseTable.innerHTML += row;
            });
        }

        // Function to populate update form with selected course's data
        function populateCourseUpdateForm(course) {
            document.getElementById("updateCourseName").value = course.coursename;
            document.getElementById("updateDescription").value = course.coursedescription;
            document.getElementById("updateId").value = course.courseid;

            // Show the update form
            document.getElementById("updateForm").style.display = "block";
        }

        // Function to submit update form
        function submitCourseUpdate() {
            var updateId = document.getElementById("updateId").value;
            var updatedName = document.getElementById("updateCourseName").value;
            var updatedDescription = document.getElementById("updateDescription").value;

            // Create the update data object
            var updateData = {
                courseid: updateId,
                coursename: updatedName,
                coursedescription: updatedDescription
            };

            var url = "http://localhost:8080/courses/update"; // Update API endpoint
            callApi("PUT", url, JSON.stringify(updateData), function(response) {
                console.log("Update response: ", response);
                loadCourseData();  // Reload course data
                document.getElementById("updateForm").style.display = "none";  // Hide form after update
                
                alert("Course updated successfully.");
            });
        }

        // Function to delete a course
        function deleteCourse(id) {
            // Show confirmation dialog before deletion
            var confirmDelete = confirm("Are you sure you want to delete this course?");
            
            if (confirmDelete) {
                var url = "http://localhost:8080/courses/delete/" + id;  // Updated URL for delete API
                callApi("DELETE", url, null, function(response) {
                    console.log("Delete response: ", response);
                    loadCourseData();  // Reload course data
                    alert("Course deleted successfully.");  // Success message
                }, function(error) {
                    console.error("Delete error: ", error);
                    alert("An error occurred while deleting the course.");  // Error message
                });
            } else {
                alert("Deletion canceled.");  // Message if user cancels deletion
            }
        }

        // Load course data on page load
        window.onload = loadCourseData;
    </script>
</body>
</html>
