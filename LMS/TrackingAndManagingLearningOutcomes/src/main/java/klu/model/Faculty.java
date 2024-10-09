package klu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = " faculty")
public class Faculty {
	@Id
	@Column(name = "facultyid")
	 Long facultyid;
	
	@Column(name = "Name")
	 String name;
	 @Column(name = "password")
	 String password;
	 @Column(name = "department")
	 String department;
	 @Column(name = "email")
	 String email;
	
	 public Long getFacultyid() {
		return facultyid;
	}
	public void setFacultyid(Long facultyid) {
		this.facultyid = facultyid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Faculty [facultyid=" + facultyid + ", name=" + name + ", password=" + password + ", department="
				+ department + ", email=" + email + "]";
	}
	 
	 

}
