package klu.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.CourseRepository;

@Service
public class CoursesManager {
	@Autowired
	CourseRepository CR;
	
	public String SaveCourses(Courses C) {
        try {
            // Check if the faculty ID is already in use
            if (CR.validateUsername(C.getCourseid()) > 0) {
                throw new Exception("401"); // Faculty ID already exists
            }

            // Save the faculty entity
            CR.save(C);
            return "200"; // Success
        } catch (Exception e) {
            // Return or log the error message
            return e.getMessage(); // Log the error message or use a logger
        }
	}
        
        public List<Courses> ReadData() {
            return CR.findAll(); // Correctly returning the list of courses
        }
        public String updateCourse(Courses C) {
            try {
                if (CR.existsById(C.getCourseid())) {
                    CR.save(C);  // Update the course in the database
                    return "Course updated successfully";
                } else {
                    throw new Exception("Course not found");  // Handle non-existing course ID
                }
            } catch (Exception e) {
                return e.getMessage();  // Return error message
            }
        }

        // Delete a course by ID
        public String deleteCourse(Long id) {
            try {
                if (CR.existsById(id)) {
                    CR.deleteById(id);  // Delete the course from the database
                    return "Course deleted successfully";
                } else {
                    throw new Exception("Course not found");  // Handle non-existing course ID
                }
            } catch (Exception e) {
                return e.getMessage();  // Return error message
            }
        }


}
