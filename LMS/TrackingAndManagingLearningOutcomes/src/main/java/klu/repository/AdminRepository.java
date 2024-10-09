package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Admin;

public interface AdminRepository  extends JpaRepository<Admin, Long>{
	@Query("select count(a) from Admin a where a.username=:uname and a.password=:pwd")
	public int validateCredentials(@Param("uname") long uname, @Param("pwd") String pwd);
}
