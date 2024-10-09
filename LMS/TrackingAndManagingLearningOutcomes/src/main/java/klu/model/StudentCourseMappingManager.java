package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import klu.repository.StudentCourseMappingRepository;

@Service
public class StudentCourseMappingManager {

    @Autowired
    private StudentCourseMappingRepository SCMR;

    public StudentCourseMapping addMapping(StudentCourseMapping mapping) {
        System.out.println("Service method invoked to save mapping");

        if (mapping.getStudent() == null || mapping.getCourse() == null) {
            System.out.println("Mapping data is incomplete: Student or Course is null");
            throw new IllegalArgumentException("Student or Course cannot be null");
        }

        try {
            System.out.println("Saving mapping: " + mapping);
            StudentCourseMapping savedMapping = SCMR.save(mapping);
            System.out.println("Mapping saved successfully: " + savedMapping);
            return savedMapping;
        } catch (Exception e) {
            System.out.println("Error saving mapping: " + e.getMessage());
            throw e; // Rethrow the exception to be handled at the controller level
        }
    }
}
