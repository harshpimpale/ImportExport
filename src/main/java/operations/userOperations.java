package operations;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import db.getConnect;
import implementer.userImplementer;
import model.Pojo_user;

public class userOperations implements userImplementer{

	public Boolean registerUser(Pojo_user p) {
		// TODO Auto-generated method stub
		CallableStatement cs = null;
		boolean rs = false;
		try {
			System.out.println("Register Start");
			cs = getConnect.getConn().prepareCall("{call register_user(?,?,?,?,?)}");
			cs.setString(1, p.getPort_id());
			cs.setString(2, p.getPass());
			cs.setString(3, p.getPass());
			cs.setString(4, p.getLocation());
			cs.setString(5, p.getRole());
	        // Register output parameter (customer name)
	    
			ResultSet res = cs.executeQuery();
			System.out.println("Register End");

			while (res.next()) {
			    String message = res.getString(1);  // Assuming the first column is the returned message

			    if ("password did not match".equals(message)) {
			        rs = false;  // Passwords did not match
			    } else {
			        rs = true;   // Registration was successful
			        System.out.println(message);  // You can print the success message
			    }
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public boolean loginUser(Pojo_user p) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		CallableStatement cs = null;
		boolean rs = false;
		try {
			cs = getConnect.getConn().prepareCall("{? = call login_user(?, ?, ?)}");

			// Set input parameters
			cs.setString(2, p.getPort_id());  // Set port_id
			cs.setString(3, p.getPass());      // Set password
			cs.setString(4, p.getRole());      // Set role

			// Register output parameter (boolean result)
			cs.registerOutParameter(1, Types.BOOLEAN);

			// Execute the stored function
			cs.execute();

			// Retrieve the output parameter (boolean result)
			rs = cs.getBoolean(1);

			// Print the result (true if login is successful, false otherwise)
			System.out.println(rs ? "Login successful!" : "Login failed.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public Pojo_user getUserData(Pojo_user u) {
		String portId = u.getPort_id();
		String role = u.getRole();
		ResultSet rs = null;
		
		try {
			if(role.equals("consumer")) {
				PreparedStatement ps = getConnect.getConn().prepareStatement("select * from consumer_port where port_id = ?");
				ps.setString(1, portId);
				rs = ps.executeQuery();
			}
			else {
				PreparedStatement ps = getConnect.getConn().prepareStatement("select * from seller_port where port_id = ?");
				ps.setString(1, portId);
				rs = ps.executeQuery();
			}
			
			while(rs.next()) {
				u.setPort_id(rs.getString("port_id"));
				u.setLocation(rs.getString("location"));
				u.setRole(rs.getString("role"));
			}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}
	
	public void setUserData(String sql) {
		
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("User Updated!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
