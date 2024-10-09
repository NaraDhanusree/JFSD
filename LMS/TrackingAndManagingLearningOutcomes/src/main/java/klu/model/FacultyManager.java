package klu.model;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import klu.repository.FacultyRepository;

@Service
public class FacultyManager {
	

    @Autowired
    FacultyRepository FR;

    public String SaveFaculty(Faculty F) {
        try {
            // Check if the faculty ID is already in use
            if (FR.validateUsername(F.getFacultyid()) > 0) {
                throw new Exception("401"); // Faculty ID already exists
            }

            // Save the faculty entity
            FR.save(F);
            return "200"; // Success
        } catch (Exception e) {
            // Return or log the error message
            return e.getMessage(); // Log the error message or use a logger
        }
        
    }

    public List<Faculty> readData() {
        return FR.findAll();
    }
    public String updateFacultyData(Faculty F) {
        try {
            // Check if faculty exists before updating
            Optional<Faculty> existingFaculty = FR.findById(F.getFacultyid());
            if (!existingFaculty.isPresent()) {
                return "Faculty not found"; // Handle not found case
            }

            // Update faculty data
            FR.save(F);
            return "Faculty updated successfully"; // Success message
        } catch (Exception e) {
            return "Error updating faculty: " + e.getMessage(); // Return error message
        }
    }

    public String FacultydeleteData(long id) {
        if (FR.existsById(id)) {
            FR.deleteById(id);
            return "Faculty deleted successfully";
        } else {
            return "Faculty not found";
        }
    }
    public String FacultyAdmin(long uname , String pwd )
	  {
		  try
		  {
			  if(FR.validateCredentials(uname, pwd)==0)
					throw new Exception("401");
				
				return "200";
		  }
		  catch(Exception e)
		  {
			 return  e.getMessage();
		  }
	  }

    
}
