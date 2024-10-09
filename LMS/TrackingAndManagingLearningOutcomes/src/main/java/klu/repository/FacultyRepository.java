package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Faculty;

public interface FacultyRepository  extends JpaRepository<Faculty, Long>{
	@Query("SELECT COUNT(f) FROM Faculty f WHERE f.facultyid = :uname")
    public int validateUsername(@Param("uname") Long uname);
	@Query("select count(f) from Faculty f where f.facultyid=:uname and f.password=:pwd")
	public int validateCredentials(@Param("uname") long uname, @Param("pwd") String pwd);
}
