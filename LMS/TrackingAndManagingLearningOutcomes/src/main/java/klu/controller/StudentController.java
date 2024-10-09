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


import klu.model.Student;
import klu.model.StudentManager;


@RestController
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentManager SM;
	@PostMapping("/save")
	public String saveStudent(@RequestBody Student S)
	{
		return SM.studentSave(S);
	}
	
	@GetMapping("/readAll")
    public List<Student> getAllStudents() {
        return SM.getAllStudents();
    }
	@PutMapping("/update")
	public String updateStudent(@RequestBody Student S) {
	    try {
	        return SM.updateStudentData(S);
	    } catch (Exception e) {
	        return e.getMessage(); // Return the error message
	    }
	}
	@DeleteMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        return SM.StudentdeleteData(id);
    }
	 @PostMapping("/studentlogin")
	    public String studentlogin(@RequestBody Student S) {
	        return SM.loginStudent(S.getUsername(), S.getPassword()); // Pass both username and password
	    }

}
