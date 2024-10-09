
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9e7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #ff69b4;
            padding: 20px;
            color: white;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 28px;
        }

        .logout-btn {
            background-color: #ff85c0;
            color: white;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #ff52a3;
        }

        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .course {
            background-color: #ffe6f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 30%;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .course h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #cc3366;
        }

        .course p {
            color: #996699;
            font-size: 14px;
            line-height: 1.6;
        }

        .actions {
            margin-top: 15px;
        }

        .actions a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #ff69b4;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #ff52a3;
        }

        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 8px;
            text-align: center;
        }

        .modal-content h3 {
            margin-bottom: 20px;
            color: #cc3366;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .course-container {
                flex-direction: column;
            }

            .course {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Student Dashboard</h1>
        <a href="#" class="logout-btn" onclick="logout()">Logout</a>
    </div>

    <div class="container">
        <div class="course-container">
            <!-- Example Course 1 -->
            <div class="course">
                <h2>Course 1: Introduction to Java</h2>
                <p>Master the fundamentals of Java programming, including syntax, OOP, and problem-solving techniques.</p>
                <div class="actions">
                    <a href="#" onclick="showQuizDetails('Introduction to Java')">View Quizzes</a>
                    <a href="#" onclick="showAssignmentDetails('Introduction to Java')">View Assignments</a>
                </div>
            </div>

            <!-- Example Course 2 -->
            <div class="course">
                <h2>Course 2: Web Development</h2>
                <p>Learn to build responsive and modern websites using HTML, CSS, JavaScript, and frameworks like React.</p>
                <div class="actions">
                    <a href="#" onclick="showQuizDetails('Web Development')">View Quizzes</a>
                    <a href="#" onclick="showAssignmentDetails('Web Development')">View Assignments</a>
                </div>
            </div>

            <!-- Example Course 3 -->
            <div class="course">
                <h2>Course 3: Data Structures</h2>
                <p>Understand data structures like arrays, linked lists, stacks, and algorithms to optimize code efficiency.</p>
                <div class="actions">
                    <a href="#" onclick="showQuizDetails('Data Structures')">View Quizzes</a>
                    <a href="#" onclick="showAssignmentDetails('Data Structures')">View Assignments</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Quiz Details -->
    <div id="quizModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3 id="quizTitle">Quiz Details</h3>
            <p><strong>Start Date:</strong> October 5, 2024</p>
            <p><strong>Duration:</strong> 60 minutes</p>
            <button onclick="startQuiz()">Attempt Quiz</button>
        </div>
    </div>

    <!-- Modal for Assignment Details -->
    <div id="assignmentModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3 id="assignmentTitle">Assignment Details</h3>
            <p><strong>Assignment Name:</strong> Java Basics Homework</p>
            <p><strong>Due Date:</strong> October 10, 2024</p>
            <a href="assignment-file.pdf" download>Download Assignment</a>
        </div>
    </div>

    <script>
        // Function to show quiz details
        function showQuizDetails(courseName) {
            document.getElementById('quizTitle').innerText = courseName + " - Quiz Details";
            document.getElementById('quizModal').style.display = 'block';
        }

        // Function to show assignment details
        function showAssignmentDetails(courseName) {
            document.getElementById('assignmentTitle').innerText = courseName + " - Assignment Details";
            document.getElementById('assignmentModal').style.display = 'block';
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById('quizModal').style.display = 'none';
            document.getElementById('assignmentModal').style.display = 'none';
        }

        // Function to simulate starting a quiz
        function startQuiz() {
            alert("Starting the quiz...");
            closeModal(); // Close the modal when starting the quiz
        }
        function logout() {
            location.replace("index.jsp");
        }

        // Close modal if user clicks outside of it
        window.onclick = function(event) {
            var quizModal = document.getElementById('quizModal');
            var assignmentModal = document.getElementById('assignmentModal');
            if (event.target == quizModal || event.target == assignmentModal) {
                quizModal.style.display = "none";
                assignmentModal.style.display = "none";
            }
        }
    </script>
</body>
</html>
