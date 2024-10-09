package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import klu.model.StudentCourseMapping;

public interface StudentCourseMappingRepository extends JpaRepository<StudentCourseMapping, Long>{

}
