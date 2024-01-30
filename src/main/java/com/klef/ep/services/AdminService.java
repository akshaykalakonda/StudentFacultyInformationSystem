package com.klef.ep.services;

import javax.ejb.Remote;

import com.klef.ep.models.Admin;

@Remote
public interface AdminService {
	public String addAdmin(Admin emp);
	public Admin adminLogin(String uname,String pwd);
}
