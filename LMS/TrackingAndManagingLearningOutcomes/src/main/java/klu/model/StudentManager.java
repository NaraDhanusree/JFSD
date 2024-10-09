package klu.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.StudentRepository;


@Service
public class StudentManager {

	@Autowired
	StudentRepository SR;
	
	
	public String studentSave(Student S)
	{
		
		try
		{
			if(SR.validateUsername(S.username)>0)
				throw new Exception("401");
				
			SR.save(S);
			return "200";
		}catch(Exception e)
		{
			return e.getMessage();
		}
	}
	public String loginStudent(String uname, String pwd) { // Take username and password
        try {
            if (SR.validateCredentials(uname, pwd) == 0)
                throw new Exception("401"); // Invalid credentials

            return "200"; // Successful login
        } catch (Exception e) {
            return e.getMessage();
        }
    }
	 public List<Student> getAllStudents() {
	        return SR.findAll();
	    }
	 public String updateStudentData(Student S) {
	        try {
	            // Check if faculty exists before updating
	            Optional<Student> existingFaculty = SR.findById(S.getId());
	            if (!existingFaculty.isPresent()) {
	                return "Student not found"; // Handle not found case
	            }

	            // Update faculty data
	            SR.save(S);
	            return "Student updated successfully"; // Success message
	        } catch (Exception e) {
	            return "Error Student: " + e.getMessage(); // Return error message
	        }

	 }
	 public String StudentdeleteData(long id) {
	        if (SR.existsById(id)) {
	            SR.deleteById(id);
	            return "Student deleted successfully";
	        } else {
	            return "Student not found";
	        }
	    }

}

