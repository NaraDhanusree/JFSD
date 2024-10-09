<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student-Course Mapping</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Set body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            color: #333;
            display: flex;
        }

        /* Navbar Styling */
        .navbar {
            width: 200px;
            background-color: #333;  /* Grey color */
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            padding: 20px;
        }

        .navbar h1 {
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        .navbar ul {
            list-style-type: none;
            padding-left: 0;
        }

        .navbar ul li {
            margin: 15px 0;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            font-size: 1.1rem;
            padding: 8px 12px;
            border-radius: 5px;
            display: block;
            transition: background-color 0.3s;
        }

        .navbar ul li a:hover {
            background-color: #555; /* Darker grey when hovered */
        }

        /* Content Section */
        .content {
            margin-left: 220px;  /* Space for the navbar */
            padding: 20px;
            width: 100%;
        }

        /* Form Styling */
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin: 20px auto;
        }

        h2 {
            margin-bottom: 20px;
            color: #007bff;
        }

        label {
            font-size: 1.1rem;
            margin-bottom: 10px;
            display: inline-block;
        }

        select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        // Function to populate students and courses when the page loads
        window.onload = function() {
            fetch('/studentcourse/api/mapping/students')
                .then(response => response.json())
                .then(students => {
                    const studentSelect = document.getElementById('studentId');
                    students.forEach(student => {
                        const option = document.createElement('option');
                        option.value = student.id;
                        option.text = student.id;  // Display student ID only
                        studentSelect.appendChild(option);
                    });
                })
                .catch(error => console.error('Error fetching students:', error));

            fetch('/studentcourse/api/mapping/courses')
                .then(response => response.json())
                .then(courses => {
                    const coursesSelect = document.getElementById('courseId');
                    courses.forEach(course => {
                        const option = document.createElement('option');
                        option.value = course.courseid;  // Corrected to use course.courseid
                        option.text = course.courseid;   // Corrected to use course.courseid
                        coursesSelect.appendChild(option);
                    });
                })
                .catch(error => console.error('Error fetching courses:', error));
        };

        // Function to handle form submission for mapping
        function submitMapping() {
            const studentId = document.getElementById('studentId').value;
            const courseId = document.getElementById('courseId').value;

            // Log the values to make sure you're sending the correct data
            console.log('Sending studentId:', studentId, 'courseId:', courseId);

            // Create the payload as JSON
            const payload = {
                studentId: studentId,
                courseId: courseId
            };

            // Send the request with proper headers and body
            fetch('/studentcourse/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',  // Ensure the Content-Type is set to application/json
                },
                body: JSON.stringify(payload)  // Convert the payload to JSON string
            })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    alert('Mapping added successfully!');
                } else {
                    alert('Error in adding mapping!');
                }
            })
            .catch(error => {
                console.error('Error occurred while adding mapping:', error);
                alert('Error occurred while adding mapping!');
            });
        }
    </script>
</head>
<body>

    <!-- Left Side Navbar -->
    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <ul>
            <li><a href="AdminStudent.jsp">Student</a></li>
            <li><a href="AdminFaculty.jsp">Faculty</a></li>
            <li><a href="AdminCourse.jsp">Courses</a></li>
            <li><a href="AdminMapping.jsp">Mappings</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content Section -->
    <div class="content">
        <h2>Map Student to Course</h2>
        <form id="mappingForm">
            <label for="studentId">Select Student ID:</label>
            <select id="studentId" name="studentId">
                <!-- The list of student IDs will be dynamically populated by JavaScript -->
            </select>

            <label for="courseId">Select Course ID:</label>
            <select id="courseId" name="courseId">
                <!-- The list of course IDs will be dynamically populated by JavaScript -->
            </select>

            <button type="button" onclick="submitMapping()">Submit</button>
        </form>
    </div>

</body>
</html>
