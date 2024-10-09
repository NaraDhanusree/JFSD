<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty-Course Mapping</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        /* Left-side navbar styles */
        .navbar {
            background-color: #4d4d4d;
            color: white;
            width: 250px;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            font-size: 1.5em;
            margin-bottom: 30px;
        }

        .navbar label {
            display: block;
            padding: 10px;
            margin: 5px 0;
            color: white;
            font-size: 1.1em;
            cursor: pointer;
        }

        .navbar label:hover {
            background-color: #666;
        }

        /* Content section styles */
        .content {
            margin-left: 270px;
            padding: 20px;
            width: 100%;
        }

        .form-container {
            background-color: #e0e0e0;
            padding: 20px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 1.4em;
        }

        label {
            display: block;
            margin-top: 15px;
            font-size: 1.1em;
        }

        select, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        select {
            background-color: #f8f8f8;
        }

        button {
            background-color: #4d4d4d;
            color: white;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
        }

        button:hover {
            background-color: #666;
        }
    </style>
    <script>
    window.onload = function() {
        // Fetch all faculties
        fetch('/facultycourse/api/mapping/faculties')
            .then(response => response.json())
            .then(faculties => {
                const facultySelect = document.getElementById('facultyId');
                faculties.forEach(faculty => {
                    const option = document.createElement('option');
                    option.value = faculty.facultyid;
                    option.text = faculty.facultyid;
                    facultySelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching faculties:', error));

        fetch('/facultycourse/api/mapping/courses')
            .then(response => response.json())
            .then(courses => {
                const coursesSelect = document.getElementById('courseId');
                courses.forEach(course => {
                    const option = document.createElement('option');
                    option.value = course.courseid;
                    option.text = course.courseid;
                    coursesSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching courses:', error));
    };

    function submitMapping() {
        const facultyId = document.getElementById('facultyId').value;
        const courseId = document.getElementById('courseId').value;

        const payload = {
            facultyId: facultyId,
            courseId: courseId
        };

        fetch('/facultycourse/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
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

    function Mapping() {
        location.replace("/AdminMapping.jsp");
    }
    </script>
</head>
<body>

    <div class="navbar">
        <h1>Admin Panel</h1>
        <label onclick="Mapping()">Mapping</label>
        
        
    </div>

    <div class="content">
        <div class="form-container">
            <h2>Map Faculty to Course</h2>
            <form id="mappingForm">
                <label for="facultyId">Select Faculty ID:</label>
                <select id="facultyId" name="facultyId"></select>

                <label for="courseId">Select Course ID:</label>
                <select id="courseId" name="courseId"></select>

                <button type="button" onclick="submitMapping()">Submit</button>
            </form>
        </div>
    </div>

</body>
</html>
