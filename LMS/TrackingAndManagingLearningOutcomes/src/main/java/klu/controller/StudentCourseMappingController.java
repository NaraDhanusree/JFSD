package klu.controller;

import klu.model.StudentCourseMapping;
import klu.model.StudentCourseMappingManager;
import klu.model.Student;
import klu.model.Courses;
import klu.repository.StudentRepository;
import klu.repository.CourseRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;


import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


@RestController
@RequestMapping("/studentcourse")
@CrossOrigin(origins = "*") // Allow all origins for development
public class StudentCourseMappingController {

    @Autowired
    private StudentCourseMappingManager SCMM;

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    // Get all students
    @GetMapping("/api/mapping/students")
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Get all courses
 // Inside the StudentCourseMappingController.java

 // Get all courses with courseid and coursename
 @GetMapping("/api/mapping/courses")
 public List<Map<String, Object>> getAllCourses() {
     List<Courses> coursesList = courseRepository.findAll();
     List<Map<String, Object>> courseData = new ArrayList<>();
     
     // Create a list of course data with only courseid and coursename
     for (Courses course : coursesList) {
         Map<String, Object> courseMap = new HashMap<>();
         courseMap.put("courseid", course.getCourseid());
         courseMap.put("coursename", course.getCoursename());
         courseData.add(courseMap);
     }
     return courseData;
 }


 @PostMapping("/add")
 public ResponseEntity<StudentCourseMapping> addMapping(@RequestBody Map<String, Long> request) {
     Long studentId = request.get("studentId");
     Long courseId = request.get("courseId");

     System.out.println("Received studentId: " + studentId + ", courseId: " + courseId);

     // Retrieve student and course by IDs
     Student student = studentRepository.findById(studentId).orElse(null);
     Courses course = courseRepository.findById(courseId).orElse(null);

     // Check if both student and course exist in the database
     if (student == null) {
         System.out.println("Student with ID " + studentId + " not found.");
         return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
     }

     if (course == null) {
         System.out.println("Course with ID " + courseId + " not found.");
         return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
     }

     // Create and save mapping
     StudentCourseMapping mapping = new StudentCourseMapping();
     mapping.setStudent(student);
     mapping.setCourse(course);

     try {
         StudentCourseMapping savedMapping = SCMM.addMapping(mapping);
         return ResponseEntity.ok(savedMapping);
     } catch (Exception e) {
         System.out.println("Error in adding mapping: " + e.getMessage());
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
     }
 }

}
