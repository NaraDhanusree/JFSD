<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Faculties</title>
    <link rel="stylesheet" type="text/css" href="css/faculty.css">
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
        #updateForm input[type="text"], #updateForm input[type="email"], #updateForm input[type="password"] {
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
            <li><a href="Adminfaculty.jsp">Dashboard</a></li>
            <li><a href="#">ALL FACULTIES</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container">
        <table id="facultyTable">
            <thead>
                <tr>
                    <th>Faculty ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="facultyData">
                <!-- Data will be populated here using JavaScript -->
            </tbody>
        </table>

        <!-- Update Form (Initially Hidden) -->
        <div id="updateForm">
            <h3>Update Faculty</h3>
            <form id="facultyUpdateForm">
                <label for="updateName">Name:</label><br>
                <input type="text" id="updateName" name="updateName"><br>

                <label for="updateDepartment">Department:</label><br>
                <input type="text" id="updateDepartment" name="updateDepartment"><br>

                <label for="updateEmail">Email:</label><br>
                <input type="email" id="updateEmail" name="updateEmail"><br>
                
                <label for="updatePassword">Password:</label><br>
                <input type="password" id="updatePassword" name="updatePassword" required><br>

                <!-- Hidden input to store Faculty ID -->
                <input type="hidden" id="updateId" name="updateId">

                <br>
                <button type="button" onclick="submitUpdate()">Submit Update</button>
            </form>
        </div>
    </div>

    <!-- Script to handle API calls and update functionality -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to fetch all faculty data from the backend
        function loadFacultyData() {
            var url = "http://localhost:8080/faculty/readAll";
            console.log("Loading faculty data from: ", url); // API endpoint to get all faculties
            callApi("GET", url, null, displayFacultyData);  // Call API using callApi() method defined in main.js
        }

        // Callback function to display faculty data in the table
        function displayFacultyData(response) {
            console.log("Received faculty data: ", response);
            var facultyData = JSON.parse(response);  // Parse JSON response
            var facultyTable = document.getElementById("facultyData");

            // Clear existing table rows
            facultyTable.innerHTML = "";

            // Populate table with faculty data
            facultyData.forEach(function(faculty) {
                var row = "<tr>" +
                            "<td>" + faculty.facultyid + "</td>" +
                            "<td>" + faculty.name + "</td>" +
                            "<td>" + faculty.department + "</td>" +
                            "<td>" + faculty.email + "</td>" +
                            "<td>" + faculty.password + "</td>" +
                            "<td>" +
                                "<button class='update-btn' onclick='populateUpdateForm(" + JSON.stringify(faculty) + ")'>Update</button>" +
                                "<button class='delete-btn' onclick='deleteFaculty(" + faculty.facultyid + ")'>Delete</button>" +
                            "</td>" +
                          "</tr>";
                facultyTable.innerHTML += row;
            });
        }

        // Function to populate update form with selected faculty's data
        function populateUpdateForm(faculty) {
            document.getElementById("updateName").value = faculty.name;
            document.getElementById("updateDepartment").value = faculty.department;  // Populate department
            document.getElementById("updateEmail").value = faculty.email;
            document.getElementById("updateId").value = faculty.facultyid;
            document.getElementById("updatePassword").value = faculty.password;

            // Show the update form
            document.getElementById("updateForm").style.display = "block";
        }

        // Function to submit update form
        function submitUpdate() {
            var updateId = document.getElementById("updateId").value;
            var updatedName = document.getElementById("updateName").value;
            var updatedDepartment = document.getElementById("updateDepartment").value;  // Get department
            var updatedEmail = document.getElementById("updateEmail").value;
            var updatedPassword = document.getElementById("updatePassword").value;

            // Create the update data object
            var updateData = {
                facultyid: updateId,
                name: updatedName,
                department: updatedDepartment,
                email: updatedEmail,
                password: updatedPassword
            };

            var updateUrl = "http://localhost:8080/faculty/update"; // API endpoint for update

            // Call API with proper headers for JSON format
            callApi("PUT", updateUrl, JSON.stringify(updateData), function(response) {
                alert("Faculty updated successfully.");
                loadFacultyData(); // Reload data after update
                document.getElementById("updateForm").style.display = "none"; // Hide update form after update
            });
        }

        // Load faculty data when the page is loaded
        window.onload = loadFacultyData;
        // Function to delete a faculty by ID
        function deleteFaculty(facultyid) {
            var deleteUrl = "http://localhost:8080/faculty/delete?facultyid=" + facultyid; // API endpoint for delete
            if (confirm("Are you sure you want to delete this faculty?")) {
                callApi("DELETE", deleteUrl, null, function(response) {
                    alert("Faculty deleted successfully.");
                    loadFacultyData(); // Reload data after deletion
                });
            }
        }

        // Load faculty data when the page loads
        window.onload = function() {
            loadFacultyData();
        };
    </script>



</body>
</html>
