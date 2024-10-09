package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Courses;

public interface CourseRepository  extends JpaRepository<Courses, Long>{
	@Query("SELECT COUNT(C) FROM Courses C WHERE C.courseid = :uname")
    public int validateUsername(@Param("uname") Long uname);

}
