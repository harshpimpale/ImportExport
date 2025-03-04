package model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import operations.orderOperations;
import operations.reportedOperations;

public class Pojo_orders {
	int OrdId;
	String consID;
	int prodId;
	int quant;
	String ProdName;
	double ProdPrice;
	public String getProdName() {
		return ProdName;
	}
	public void setProdName(String prodName) {
		ProdName = prodName;
	}
	public double getProdPrice() {
		return ProdPrice;
	}
	public void setProdPrice(double prodPrice) {
		ProdPrice = prodPrice;
	}
	Date ordDate;
	boolean ordPlaced;
	boolean shipped;
	boolean outDelivery;
	boolean delivered;
	
	public int getOrdId() {
		return OrdId;
	}
	public void setOrdId(int ordId) {
		OrdId = ordId;
	}
	public String getConsID() {
		return consID;
	}
	public void setConsID(String consID) {
		this.consID = consID;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public boolean isOrdPlaced() {
		return ordPlaced;
	}
	public void setOrdPlaced(boolean ordPlaced) {
		this.ordPlaced = ordPlaced;
	}
	public boolean isShipped() {
		return shipped;
	}
	public void setShipped(boolean shipped) {
		this.shipped = shipped;
	}
	public boolean isOutDelivery() {
		return outDelivery;
	}
	public void setOutDelivery(boolean outDelivery) {
		this.outDelivery = outDelivery;
	}
	public boolean isDelivered() {
		return delivered;
	}
	public void setDelivered(boolean delivered) {
		this.delivered = delivered;
	}
	
	public List<Pojo_orders> getAllOrders(String ord){
		return new orderOperations().showAllOrders(ord);
	}
	public List<Pojo_orders> getSellerOrders(String s) {
		// TODO Auto-generated method stub
		return new orderOperations().showOrdersofSeller(s);
	}
	
	
	public List<Integer> getSellerDashData(String s) {
		// TODO Auto-generated method stub
		List<Integer> result = new ArrayList<Integer>(17);
		for (int i = 0; i < 12; i++) {
		    result.add(0);
		}
		
		
		List<Pojo_orders> orders = new orderOperations().showOrdersofSeller(s);
		int totalSales = 0; //total money 
		int totalReports = new reportedOperations().getCountofReports(s);
		int totalComplete = 0;
		int cancels = new orderOperations().countDeletedOrders(s);
		int totalOrders = orders.size() + cancels ; //total orders
		if (orders != null || !orders.isEmpty()) {
		for(Pojo_orders o: orders) {
			Date d = o.getOrdDate();
//			System.out.println(d.getMonth());
	        int sale = (int) o.getProdPrice() * o.getQuant();
			totalSales += sale;
			if(o.isDelivered()) {
				totalComplete += 1;
			}
//	        LocalDate localDate = d.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        @SuppressWarnings("deprecation")
			int month = d.getMonth(); // Get month as integer (1-12)
			result.set(month, result.get(month)+sale);
			}
		}
		result.add(totalOrders);
		result.add(totalSales);
		result.add(totalComplete);
		result.add(totalReports);		
		result.add(cancels);		
		System.out.println(result);
		
		
		// Result = [1-12], total orders, total sales, total complete order, total reports, total cancels
		// Result length = 17
		return result;
	}
	
	public void orderPlace(Map<Integer, Integer> cart, String id) {
		// TODO Auto-generated method stub
		List<Pojo_orders> ords = new ArrayList<Pojo_orders>();
        if (!cart.isEmpty()) {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            	Pojo_orders od = new Pojo_orders();
            	od.setProdId(entry.getKey());
            	od.setQuant(entry.getValue());
            	od.setConsID(id);
            	ords.add(od);
            }
        }
        new orderOperations().placeOrder(ords);
	}
	
	
	public void updateTracking(String status, String odId) {
		// TODO Auto-generated method stub
		String sql = "update orders set ";
		if(status.equals("Delivered")) {
			sql += "delivered = true ";
		}
		else if(status.equals("Out for Delivery")) {
			sql += "delivered = false ,out_for_delivery = true ";
		}
		else if(status.equals("Shipped")) {
			sql += "delivered = false ,out_for_delivery = false ,shipped = true ";
		}
		else if(status.equals("Order Placed")) {
			sql += "delivered = false ,out_for_delivery = false ,shipped = false ,order_placed = true ";
		}
		else {
			return;
		}
		sql += ("where order_id = "+odId);
		new orderOperations().updateOrderTrack(sql);
	}
	
	public void cancelOrder(int int1) {
		// TODO Auto-generated method stub
		new orderOperations().cancelOrder(int1);
	}
}
