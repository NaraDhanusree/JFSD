package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import klu.model.Admin;
import klu.model.AdminManager;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminManager AM;
	
	@PostMapping("/adminlogin")
	public String adminlogin(@RequestBody Admin A)
	{
		return AM.loginAdmin(A.getUsername(), A.getPassword());
	}

}
