package klu.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name="Student")
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	Long id;
	@Column(name = "username")
	String username;
	
	@Column(name="fristname")
	String fristname;
	@Column(name = "Lastname")
	String Lastname;
	@Column(name="email")
    String Email;
	@Column(name = "password")
	String Password;
	@ManyToMany
    @JoinTable(
        name = "student_courses", 
        joinColumns = @JoinColumn(name = "student_id"), 
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
	    private List<Courses> courses;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFristname() {
		return fristname;
	}
	public void setFristname(String fristname) {
		this.fristname = fristname;
	}
	public String getLastname() {
		return Lastname;
	}
	public void setLastname(String lastname) {
		this.Lastname = lastname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		this.Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		this.Password = password;
	}
	
	@Override
	public String toString() {
		return "Student [username=" + username + ", fristname=" + fristname + ", Lastname=" + Lastname + ", Email="
				+ Email + ", Password=" + Password + ", id=" + id + "]";
	}
	
	
	
	
	

}
