package com.klef.ep.models;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="student_table")
public class Student implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@Column(length = 20,nullable = false)
    private String fname;
	
	@Column(length = 20,nullable = false)
    private String lname;
	
	@Column(length = 30,nullable = false,unique = true)
    private String email;
	
	@Column(length = 30,nullable = false)
    private String password;
	
	@Column(length = 10,nullable = false)
    private String gender;
	
	@Column(length = 20,nullable = false)
    private String dob;
	
	@Column(length = 20,nullable = false)
    private String departmnt;
	
	@Column(length = 30,nullable = false,unique = true)
    private String scontactno;
	
	@Column(length = 30,nullable = false,unique = true)
    private String pcontactno;
	
	@Column(length = 30,nullable = false)
    private String address;
	
	@Lob
    @Column(nullable = false)
    private Blob imagedata;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getDepartmnt() {
		return departmnt;
	}

	public void setDepartmnt(String departmnt) {
		this.departmnt = departmnt;
	}

	public String getScontactno() {
		return scontactno;
	}

	public void setScontactno(String scontactno) {
		this.scontactno = scontactno;
	}

	public String getPcontactno() {
		return pcontactno;
	}

	public void setPcontactno(String pcontactno) {
		this.pcontactno = pcontactno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Blob getImagedata() {
		return imagedata;
	}

	public void setImagedata(Blob imagedata) {
		this.imagedata = imagedata;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}