
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Mapping Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Base styling */
        body {
            margin: 0;
            height: 100vh;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }
        
        h2 {
            color: #ff69b4;
        }

        /* Navbar styling - Horizontal */
        .navbar {
            width: 100%;
            background-color: #ff69b4; /* Pink theme */
            color: white;
            padding: 15px;
            display: flex;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            z-index: 1000;
        }
        
        .navbar label {
            color: white;
            margin: 0 20px;
            font-size: 1.1em;
            cursor: pointer;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .navbar label:hover {
            background-color: #ff1493; /* Darker pink on hover */
        }
        
        /* Content area */
        .content {
            padding: 100px 40px; /* Add top padding for fixed navbar */
            background-color: #fff;
            max-width: 1200px;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow-y: auto;
        }

        /* Registration window */
        .registrationWindow {
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Buttons */
        .registerButton {
            background-color: #007BFF;
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
            background-color: #0056b3;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <!-- Horizontal Navigation Bar -->
    <div class="navbar">
        <label onClick="StudentCourseMapping()">Student Course Mapping</label>
        <label onClick="FacultyCourseMapping()">Faculty Course Mapping</label>
        <label onClick="Logout()">Logout</label>
    </div>
    
    <div class="content">
        <div id="registrationForm" class="registrationWindow">
            <!-- Main content -->
            <h2>Welcome to Admin Dashboard</h2>
            <p>Select a section from the navigation bar above to manage Student or Faculty records.</p>
        </div>
    </div>

    <script>
        function StudentCourseMapping() {
            location.replace("StudentCourseMapping.jsp");
        }

        function FacultyCourseMapping() {
            location.replace("FacultyCourseMapping.jsp");
        }

        function Logout() {
            location.replace("/index.jsp");
        }
    </script>
</body>
</html>
