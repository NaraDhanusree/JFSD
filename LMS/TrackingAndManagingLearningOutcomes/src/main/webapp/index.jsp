
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Learning Management System</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            color: #333;
        }

        /* Container for navbar and sidebar */
        .container {
            display: flex;
            height: 100vh;
        }

        /* Navbar */
        .navbar {
            width: 100%;
            background-color: #1a1a2e;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 2em;
            letter-spacing: 1px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: fixed; /* Fix the navbar to the top */
            top: 0;
            left: 0;
            z-index: 1000; /* Ensure it stays above other elements */
        }

        /* Sidebar for role selection */
        .sidebar {
            width: 250px;
            background-color: #f0f0f0; /* Lighter color */
            color: #333; /* Text color for better contrast */
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            padding: 30px;
            height: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            position: fixed; /* Fix the sidebar to the left */
            top: 60px; /* Position below the navbar */
        }

        .sidebar h1 {
            margin-bottom: 40px;
            font-size: 1.8em;
            text-align: center;
        }

        .sidebar ul {
            list-style-type: none;
            width: 100%;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #1a1a2e; /* Changed to match the navbar */
            background-color: #d9d9d9; /* Lighter background for links */
            padding: 12px;
            display: block;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #c0c0c0; /* Darker shade on hover */
        }

        /* Main content */
        .mainContent {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            margin-left: 250px; /* Leave space for the sidebar */
            margin-top: 60px; /* Leave space for the navbar */
        }

        .loginBox {
            background-color: white;
            padding: 40px;
            max-width: 450px;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.8s ease-in-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .loginBox h2 {
            font-size: 1.8em;
            color: #1a1a2e;
            text-align: center;
            margin-bottom: 30px;
        }

        .loginBox label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        .loginBox input {
            width: 100%;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 1em;
            background-color: #f7f9fb;
            transition: border-color 0.3s ease;
        }

        .loginBox input:focus {
            border-color: #1a1a2e;
            outline: none;
        }

        .loginBox button {
            background-color: #1a1a2e;
            color: white;
            padding: 14px;
            border: none;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .loginBox button:hover {
            background-color: #533483;
        }

        /* Error Message */
        #ack {
            text-align: center;
            color: red;
            font-size: 0.9em;
        }

    </style>
</head>
<body>
    <div class="container">
        <!-- Navbar with project name -->
        <div class="navbar">
            Student Learning Management System
        </div>

        <!-- Sidebar for role selection -->
        <div class="sidebar">
            <h1>Select Role</h1>
            <ul>
                <li><a href="#" id="adminRole" onclick="setRole('admin')">Admin</a></li>
                <li><a href="#" id="studentRole" onclick="setRole('student')">Student</a></li>
                <li><a href="#" id="facultyRole" onclick="setRole('faculty')">Faculty</a></li>
            </ul>
        </div>

        <!-- Main content with login form -->
        <div class="mainContent">
            <div class="loginBox" id="loginFormBox">
                <h2 id="roleTitle">Sign In as Admin</h2>
                <form id="loginForm">
                    <label for="username">Username*</label>
                    <input type="text" id="username" placeholder="Enter your username" required>

                    <label for="password">Password*</label>
                    <input type="password" id="password" placeholder="Enter your password" required>

                    <button type="button" onclick="login()">Sign In</button>
                    <div id="ack"></div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        let selectedRole = 'admin'; // Default to admin for now

        function setRole(role) {
            selectedRole = role;
            document.getElementById('roleTitle').innerText = `Sign In as ${role.charAt(0).toUpperCase() + role.slice(1)}`;
        }

        function login() {
    var username = document.getElementById('username').value.trim();
    var password = document.getElementById('password').value.trim();
    var ack = document.getElementById('ack');
    ack.style.color = "red";

    // Check for empty fields
    if (username === "" || password === "") {
        ack.innerHTML = "All fields are required!";
        return;
    }

    var data = JSON.stringify({
        username: username,
        password: password
    });

    var url;
    // Set URL based on selected role
    if (selectedRole === "admin") {
        url = "http://localhost:8080/admin/adminlogin";
    } else if (selectedRole === "student") {
        url = "http://localhost:8080/student/studentlogin";
    } else if (selectedRole === "faculty") {
        url = "http://localhost:8080/faculty/facultylogin";
    }

    // Send fetch request
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: data
    })
    .then(response => {
        if (response.status === 401) { // Unauthorized
            ack.innerHTML = "Login failed. Please check your credentials.";
            throw new Error("Unauthorized");
        } else if (!response.ok) { // Any other error
            ack.innerHTML = "An unexpected error occurred.";
            throw new Error("Network response was not ok");
        }
        return response.json();
    })
    .then(data => {
        // Assuming your backend sends a success response
        ack.style.color = "green";
        ack.innerHTML = "Login successful! Redirecting...";
        // Redirect or perform actions based on successful login
        setTimeout(() => {
            if (selectedRole === "admin") {
                window.location.href = "/AdminHome.jsp";
            } else if (selectedRole === "student") {
                window.location.href = "/StudentHome.jsp";
            } else if (selectedRole === "faculty") {
                window.location.href = "/FacultyHome.jsp";
            }
        }, 2000);
    })
    .catch(error => {
        ack.innerHTML = "An error occurred. Please try again later.";
        console.error('There was a problem with the fetch operation:', error);
    });
}
        
    </script>
</body>
</html>
