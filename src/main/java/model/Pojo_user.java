package model;

import java.util.UUID;

import operations.userOperations;

public class Pojo_user {
	
	private String port_id;
	private String pass;
	private String location;
	private String role;
	
	public static String generateUUID() {
	    return UUID.randomUUID().toString().replace("-", ""); // Remove hyphens if needed
	}
	public String getPort_id() {
		return port_id;
	}
	public void setPort_id(String port) {
		this.port_id = port;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public boolean checkLogin(Pojo_user u) {
		boolean chk = false;
		userOperations up = new userOperations();
		chk = up.loginUser(u);
		return chk;
	}
	
	public boolean checkRegister(Pojo_user u) {
		boolean chk = false;
		userOperations up = new userOperations();
		chk = up.registerUser(u);
		return chk;
	}
	public Pojo_user getUser(Pojo_user u) {
		userOperations up = new userOperations();
		u = up.getUserData(u);
		return u;
	}
	public void updateData(Pojo_user u) {
		String id = u.getPort_id();
		String pass = u.getPass();
		String location = u.getLocation();
		String role = u.getRole();
		boolean need = false;
		String res = "update "+role+"_port set ";
		if(pass != null && !pass.isBlank()) {
			res += "password = '" + pass + "'";
			need = true;
		}
		if(location != null && !location.isBlank()) {
			if(need == true) {
				res += ", ";
			}
			
			res += "location = '" + location + "' ";
			need = true;
		}
		res += "where port_id = '"+id+"'";
		
		System.out.println(res);
		userOperations up = new userOperations();
//		
		up.setUserData(res);
	}
}
