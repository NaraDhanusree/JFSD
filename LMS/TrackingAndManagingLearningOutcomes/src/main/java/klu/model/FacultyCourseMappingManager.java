package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import klu.repository.FacultyCourseMappingRepository;

@Service
public class FacultyCourseMappingManager {

    @Autowired
    private FacultyCourseMappingRepository FCMR;

    public FacultyCourseMapping addMapping(FacultyCourseMapping mapping) {
        System.out.println("Service method invoked to save faculty-course mapping");

        if (mapping.getFaculty() == null || mapping.getCourse() == null) {
            System.out.println("Mapping data is incomplete: Faculty or Course is null");
            throw new IllegalArgumentException("Faculty or Course cannot be null");
        }

        try {
            System.out.println("Saving mapping: " + mapping);
            FacultyCourseMapping savedMapping = FCMR.save(mapping);
            System.out.println("Mapping saved successfully: " + savedMapping);
            return savedMapping;
        } catch (Exception e) {
            System.out.println("Error saving mapping: " + e.getMessage());
            throw e;
        }
    }
}
