package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import klu.model.Courses;
import klu.model.CoursesManager;


@RestController
@RequestMapping("/courses")
public class CoursesController {

    @Autowired
    CoursesManager CM;

    @PostMapping("/save")
    public String coursesSave(@RequestBody Courses C) {
        return CM.SaveCourses(C);
    }

    @GetMapping("/readAllCourses")
    public List<Courses> getAllCourses() {
        return CM.ReadData();  // Correctly return the list of courses
    }

    @PutMapping("/update")
    public String updateCourse(@RequestBody Courses C) {
        return CM.updateCourse(C);  // Call the service method to update the course
    }

    // Delete a course by ID
    @DeleteMapping("/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        return CM.deleteCourse(id);  // Call the service method to delete the course
    }
}
