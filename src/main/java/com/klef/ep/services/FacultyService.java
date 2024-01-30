package com.klef.ep.services;

import java.util.List;

import javax.ejb.Remote;

import com.klef.ep.models.Admin;
import com.klef.ep.models.Faculty;

@Remote
public interface FacultyService {
	public String addFaculty(Faculty fty);
	public List<Faculty> viewAllFaculties();
	public Faculty facultyLogin(int uname,String pwd);
	public Faculty adminviewfac(int id);
}
