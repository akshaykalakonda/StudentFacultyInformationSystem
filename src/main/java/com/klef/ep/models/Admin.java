package com.klef.ep.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin implements Serializable
{
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id  // primary key
   @GeneratedValue(strategy = GenerationType.IDENTITY)  // auto_increment
   private int id;
   @Column(length = 30,nullable = false,unique = true)
   private String username;
   @Column(length = 30,nullable = false)
   private String password;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
}
