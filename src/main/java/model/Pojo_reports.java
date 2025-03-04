package model;

import java.sql.Date;
import java.util.List;

import operations.reportedOperations;

public class Pojo_reports {
	int repId;
	int ordId;
	String consId;
	int prodId;
	String issueType;
	String solution;
	Date reportTime;
	String token;
	String solutionStatus;
	
	public int getRepId() {
		return repId;
	}
	public void setRepId(int repId) {
		this.repId = repId;
	}
	
	public int getordId() {
		return ordId;
	}
	public void setordId(int ordId) {
		this.ordId = ordId;
	}
	
	public String getConsId() {
		return consId;
	}
	public void setConsId(String consId) {
		this.consId = consId;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public String getSolution() {
		return solution;
	}
	public void setSolution(String solution) {
		this.solution = solution;
	}
	public Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getSolutionStatus() {
		return solutionStatus;
	}
	public void setSolutionStatus(String solutionStatus) {
		this.solutionStatus = solutionStatus;
	}
	
	public void addReport(Pojo_reports p) {
		new reportedOperations().addReport(p);
	}
	
	public List<Pojo_reports> getAllReports(String custId){
		return new reportedOperations().getAll(custId);
	}
	public List<Pojo_reports> getAllReportsforSeller(String sellId) {
		// TODO Auto-generated method stub
		return new reportedOperations().getAllbySeller(sellId);
	}
	public void deleteReport(Pojo_reports r) {
		// TODO Auto-generated method stub
		new reportedOperations().cancelReport(r);
	}
}
