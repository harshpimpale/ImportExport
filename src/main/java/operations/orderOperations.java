package operations;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.CallableStatement;

import db.getConnect;
import implementer.orderImplementer;
import model.Pojo_orders;

public class orderOperations implements orderImplementer{

	public List<Pojo_orders> showAllOrders(String consId) {
		// TODO Auto-generated method stub
		List<Pojo_orders> ords = new ArrayList<Pojo_orders>();
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call getOrdersforConsumerById(?)}");
			cs.setString(1, consId);
			ResultSet rs = cs.executeQuery();
			while(rs.next()) {
				Pojo_orders o = new Pojo_orders();
				o.setOrdId(rs.getInt("order_id"));
				o.setConsID(rs.getString("consumer_port_id"));
				o.setProdId(rs.getInt("product_id"));
				o.setQuant(rs.getInt("product_quantity"));
				o.setOrdDate(rs.getDate("order_date"));
				o.setOrdPlaced(rs.getBoolean("order_placed"));
				o.setShipped(rs.getBoolean("shipped"));
				o.setOutDelivery(rs.getBoolean("out_for_delivery"));
				o.setDelivered(rs.getBoolean("delivered"));
				o.setProdName(rs.getString("product_name"));
				
				ords.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ords;
	}
	

	public void cancelOrder(int ordId) {
		// TODO Auto-generated method stub
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call delete_order_with_reports(?)}");
			cs.setInt(1, ordId);
			cs.execute();
			System.out.println("Runnn");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public List<Pojo_orders> showOrdersofSeller(String sellerId) {
		// TODO Auto-generated method stub
		List<Pojo_orders> listers = new ArrayList<Pojo_orders>();
//		CallableStatement cs = null;
		System.out.println("OpGEtSett");
		
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call get_seller_orders(?)}");
			cs.setString(1, sellerId);
			ResultSet rs = cs.executeQuery();
			System.out.println("Runnn");
			
			while(rs.next()) {
				Pojo_orders o = new Pojo_orders();
				o.setOrdId(rs.getInt("order_id"));
				o.setConsID(rs.getString("consumer_port_id"));
				o.setProdId(rs.getInt("product_id"));
				o.setQuant(rs.getInt("product_quantity"));
				o.setOrdDate(rs.getDate("order_date"));
				o.setOrdPlaced(rs.getBoolean("order_placed"));
				o.setShipped(rs.getBoolean("shipped"));
				o.setOutDelivery(rs.getBoolean("out_for_delivery"));
				o.setDelivered(rs.getBoolean("delivered"));
				o.setProdName(rs.getString("product_name"));
				o.setProdPrice(rs.getDouble("product_price"));
				
				
				listers.add(o);
				System.out.println(rs.getInt(1));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return listers;
	}


	public int countDeletedOrders(String sellerId) {
		// TODO Auto-generated method stub
		int count = 0;
		
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call GetDeletedOrdersCount(?)}");
			cs.setString(1, sellerId);
			ResultSet rs = cs.executeQuery();
//			System.out.println(rs);
			while(rs.next()) {
				count = rs.getInt("deleted_orders_count");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Deleted orders count : "+count);
		
		return count;
	}


	public void placeOrder(List<Pojo_orders> ords) {
		// TODO Auto-generated method stub
		
		try {
            if (ords != null && !ords.isEmpty()) {
                for (Pojo_orders order : ords) {
                	CallableStatement cs = getConnect.getConn().prepareCall("{call PlaceOrder(?,?,?)}");
                	cs.setInt(1, order.getProdId());
                	cs.setString(2, order.getConsID());
                	cs.setInt(3, order.getQuant());
                	cs.execute();
					System.out.println("ProdId "+ order.getProdId()+", and quantity is"+order.getQuant()+" ,this order is placed!!");
                }
            }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}


	public void updateOrderTrack(String sql) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement(sql);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
