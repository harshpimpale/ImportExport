package operations;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.getConnect;
import implementer.reportImplementer;
import model.Pojo_reports;

public class reportedOperations implements reportImplementer{

	public void addReport(Pojo_reports p) {
		// TODO Auto-generated method stub
		CallableStatement cs = null;
		try {
			System.out.println("Add Report");
			cs = getConnect.getConn().prepareCall("{call addReportedProd(?,?,?,?)}");
			cs.setInt(1, p.getordId());
			cs.setString(2, p.getConsId());
			cs.setInt(3, p.getProdId());
			cs.setString(4, p.getIssueType());
	        // Register output parameter (customer name)
			System.out.println(p.getordId()+":"+p.getIssueType());
			cs.execute();
			System.out.println("Reports added");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Pojo_reports> getAll(String userId) {
		// TODO Auto-generated method stub
		List<Pojo_reports> ords = new ArrayList<Pojo_reports>();
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement("select * from reported_products where consumer_port_id = ?");
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Pojo_reports o = new Pojo_reports();
				o.setRepId(rs.getInt("report_id"));
				o.setordId(rs.getInt("orderid"));
				o.setConsId(rs.getString("consumer_port_id"));
				o.setProdId(rs.getInt("product_id"));
				o.setIssueType(rs.getString("issue_type"));
				o.setSolution(rs.getString("solution"));
				o.setReportTime(rs.getDate("report_date"));
				o.setToken(rs.getString("token"));
				o.setSolutionStatus(rs.getString("solution_status"));
				ords.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ords;
	}

	public List<Pojo_reports> getAllbySeller(String sellId) {
		// TODO Auto-generated method stub
		CallableStatement cs = null;
		List<Pojo_reports> reps = new ArrayList<Pojo_reports>();
		try {
			System.out.println("Register Start");
			cs = getConnect.getConn().prepareCall("{call GetReportsBySellerId(?)}");
			cs.setString(1, sellId);
	        // Register output parameter (customer name)
	    
			ResultSet rs = cs.executeQuery();
			System.out.println("Seller report End");

			while (rs.next()) {
				Pojo_reports o = new Pojo_reports();
				o.setRepId(rs.getInt(1));
				o.setordId(rs.getInt(2));
				o.setConsId(rs.getString(3));
				o.setProdId(rs.getInt(4));
				o.setIssueType(rs.getString(5));
				o.setSolution(rs.getString(6));
				o.setReportTime(rs.getDate(7));
				o.setToken(rs.getString(8));
				o.setSolutionStatus(rs.getString(9));
				reps.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reps;
	}

	public void cancelReport(Pojo_reports r) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM reported_products WHERE report_id = ?;";
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement(sql);
			ps.setInt(1, r.getRepId());
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public int getCountofReports(String sellerId) {
		// TODO Auto-generated method stub
		int count = 0;
//		System.out.println("give reported orders count");
		
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call GetReportsCount(?)}");
			cs.setString(1, sellerId);
			ResultSet rs = cs.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("report_count");
			}
			System.out.println("Reported orders count : "+count);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
	
}
