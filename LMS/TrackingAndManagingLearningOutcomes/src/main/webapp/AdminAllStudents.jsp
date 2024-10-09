<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Students</title>
    <link rel="stylesheet" type="text/css" href="css/student.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #fce4ec; /* Light pink background */
        }
        .topnav {
            background-color: #d81b60; /* Darker pink for the navbar */
            color: white;
            padding: 15px 0;
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
            background-color: #d81b60; /* Darker pink for the sidebar */
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
            padding: 10px;
            transition: background-color 0.3s; /* Smooth transition */
        }
        .sidebar ul li a:hover {
            background-color: #c51162; /* Lighter pink on hover */
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
            border: 1px solid #ccc; /* Light border for table */
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #d81b60; /* Dark pink for header */
            color: white;
        }
        .update-btn, .delete-btn {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
            background-color: #4CAF50; /* Green for update */
            color: white;
            border: none;
            border-radius: 4px;
        }
        .delete-btn {
            background-color: #f44336; /* Red for delete */
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
            background-color: #ffffff; /* White background for the form */
            border-radius: 4px;
        }
        #updateForm label {
            display: block;
            margin-bottom: 5px;
        }
        #updateForm input[type="text"], #updateForm input[type="email"], #updateForm input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        #updateForm button {
            background-color: #d81b60; /* Dark pink for the submit button */
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
        #updateForm button:hover {
            background-color: #c51162; /* Lighter pink on button hover */
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
            <li><a href="AdminStudent.jsp">Dashboard</a></li>
            <li><a href="#">ALL STUDENTS</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container">
        <table id="studentTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="studentData">
                <!-- Data will be populated here using JavaScript -->
            </tbody>
        </table>

        <!-- Update Form (Initially Hidden) -->
        <div id="updateForm">
            <h3>Update Student</h3>
            <form id="studentUpdateForm">
                <label for="updateUsername">Username:</label><br>
                <input type="text" id="updateUsername" name="updateUsername" required><br>

                <label for="updateFristname">First Name:</label><br>
                <input type="text" id="updateFristname" name="updateFristname" required><br>

                <label for="updateLastname">Last Name:</label><br>
                <input type="text" id="updateLastname" name="updateLastname" required><br>

                <label for="updateEmail">Email:</label><br>
                <input type="email" id="updateEmail" name="updateEmail" required><br>
                
                <label for="updatePassword">Password:</label><br>
                <input type="password" id="updatePassword" name="updatePassword" required><br>

                <!-- Hidden input to store Student ID -->
                <input type="hidden" id="updateId" name="updateId">

                <br>
                <button type="button" onclick="submitUpdate()">Submit Update</button>
            </form>
        </div>
    </div>

    <!-- Script to handle API calls and update functionality -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to fetch all student data from the backend
        function loadStudentData() {
            var url = "http://localhost:8080/student/readAll";  // API endpoint to get all students
            console.log("Loading student data from: ", url);
            callApi("GET", url, null, displayStudentData);  // Call API using callApi() method defined in main.js
        }

        // Callback function to display student data in the table
        function displayStudentData(response) {
            console.log("Received student data: ", response);
            var studentData = JSON.parse(response);  // Parse JSON response
            var studentTable = document.getElementById("studentData");

            // Clear existing table rows
            studentTable.innerHTML = "";

            // Populate table with student data
            studentData.forEach(function(student) {
                var row = "<tr>" +
                            "<td>" + student.id + "</td>" +
                            "<td>" + student.username + "</td>" +
                            "<td>" + student.fristname + "</td>" +  // Correct key for first name
                            "<td>" + student.lastname + "</td>" +  // Correct key for last name
                            "<td>" + student.email + "</td>" +      // Correct key for email
                            "<td>" + student.password + "</td>" +   // Correct key for password
                            "<td>" +
                                "<button class='update-btn' onclick='populateUpdateForm(" + JSON.stringify(student) + ")'>Update</button>" +
                                "<button class='delete-btn' onclick='deleteStudent(" + student.id + ")'>Delete</button>" +
                            "</td>" +
                          "</tr>";
                studentTable.innerHTML += row;
            });
        }

        // Function to populate update form with selected student's data
        function populateUpdateForm(student) {
            document.getElementById("updateUsername").value = student.username;
            document.getElementById("updateFristname").value = student.fristname;  // Populate first name
            document.getElementById("updateLastname").value = student.lastname;  // Populate last name
            document.getElementById("updateEmail").value = student.email;  // Correct key for email
            document.getElementById("updateId").value = student.id;
            document.getElementById("updatePassword").value = student.password; // Correct key for password

            // Show the update form
            document.getElementById("updateForm").style.display = "block";
        }

        // Function to submit update form
        function submitUpdate() {
            var updateId = document.getElementById("updateId").value;
            var updatedUsername = document.getElementById("updateUsername").value;
            var updatedFristname = document.getElementById("updateFristname").value;  // Get first name
            var updatedLastname = document.getElementById("updateLastname").value;  // Get last name
            var updatedEmail = document.getElementById("updateEmail").value;
            var updatedPassword = document.getElementById("updatePassword").value;

            // Create the update data object
            var updateData = {
                id: updateId,
                username: updatedUsername,
                fristname: updatedFristname,
                lastname: updatedLastname,
                email: updatedEmail,
                password: updatedPassword
            };

            var url = "http://localhost:8080/student/update"; // Update API endpoint
            callApi("PUT", url, JSON.stringify(updateData), function(response) {
                console.log("Update response: ", response);
                loadStudentData();  // Reload student data
                document.getElementById("updateForm").style.display = "none";  // Hide form after update
            });
        }

        // Function to delete a student
        function deleteStudent(id) {
            // Show confirmation dialog before deletion
            var confirmDelete = confirm("Are you sure you want to delete this student?");
            
            if (confirmDelete) {
                var url = "http://localhost:8080/student/delete/" + id;  // Updated URL for delete API
                callApi("DELETE", url, null, function(response) {
                    console.log("Delete response: ", response);
                    loadStudentData();  // Reload student data
                    alert("Student deleted successfully.");  // Success message
                }, function(error) {
                    console.error("Delete error: ", error);
                    alert("An error occurred while deleting the student.");  // Error message
                });
            } else {
                alert("Deletion canceled.");  // Message if user cancels deletion
            }
        }

        // Load student data on page load
        window.onload = loadStudentData;
    </script>
</body>
</html>
