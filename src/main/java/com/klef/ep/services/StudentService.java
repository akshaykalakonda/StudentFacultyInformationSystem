package com.klef.ep.services;

import java.util.List;

import com.klef.ep.models.Faculty;
import com.klef.ep.models.Student;

public interface StudentService {
	
	public String AddStudent(Student student);
	public List<Student> viewAllStudents();
	public Student adminviewstud(int id);
	public long getcount();
}
