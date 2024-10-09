package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import klu.model.Admin;
import klu.model.Faculty;
import klu.model.FacultyManager;



@RestController
@RequestMapping("/faculty")
public class FacultyController {

	@Autowired
	FacultyManager FM;
	
	@PostMapping("/save")
	public String FacultySave(@RequestBody Faculty F)
	{
		return FM.SaveFaculty(F);
	}
	@GetMapping("/readAll")
    public List<Faculty> getAllFaculties() {
        return FM.readData();
    }
	@PutMapping("/update")
	public String updateFaculty(@RequestBody Faculty F) {
	    try {
	        return FM.updateFacultyData(F);
	    } catch (Exception e) {
	        return e.getMessage(); // Return the error message
	    }
	}

	@DeleteMapping("/delete")
	public String delete(@RequestParam("facultyid") long facultyid) {
	    return FM.FacultydeleteData(facultyid);
	}
	@PostMapping("/facultylogin")
	public String Facultylogin(@RequestBody Admin A)
	{
		return FM.FacultyAdmin(A.getUsername(), A.getPassword());
	}



}
