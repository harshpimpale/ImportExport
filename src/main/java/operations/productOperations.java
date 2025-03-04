package operations;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.getConnect;
import implementer.productImplementer;
import model.Pojo_products;

public class productOperations implements productImplementer{

	public List<Pojo_products> showAllProducts() {
		// TODO Auto-generated method stub
		List<Pojo_products> prods = new ArrayList<Pojo_products>();
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement("select * from products");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Pojo_products p = new Pojo_products();
				p.setProdId(rs.getInt("product_id"));
				p.setProdName(rs.getString("product_name"));
				p.setSellerId(rs.getString("seller_id"));
				p.setQuant(rs.getInt("quantity"));
				p.setPrice(rs.getDouble("price"));
				
				prods.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return prods;
	}
	
	public List<Pojo_products> showAllProductsofSeller(String sellerId) {
		// TODO Auto-generated method stub
		List<Pojo_products> prods = new ArrayList<Pojo_products>();
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement("select * from products where seller_id = ?");
			ps.setString(1, sellerId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Pojo_products p = new Pojo_products();
				p.setProdId(rs.getInt("product_id"));
				p.setProdName(rs.getString("product_name"));
				p.setSellerId(rs.getString("seller_id"));
				p.setQuant(rs.getInt("quantity"));
				p.setPrice(rs.getDouble("price"));
				prods.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return prods;
	}

	public Pojo_products getProduct(int prodId2) {
		// TODO Auto-generated method stub
		Pojo_products p = new Pojo_products();
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement("select * from products where product_id = ?");
			ps.setInt(1, prodId2);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p.setProdId(rs.getInt("product_id"));
				p.setProdName(rs.getString("product_name"));
				p.setSellerId(rs.getString("seller_id"));
				p.setQuant(rs.getInt("quantity"));
				p.setPrice(rs.getDouble("price"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}

	public void addProducts(Pojo_products p) {
		// TODO Auto-generated method stub
		String sql = "insert into products (seller_id, product_name, quantity, price) values (?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = getConnect.getConn().prepareStatement(sql);
			ps.setString(1, p.getSellerId());
			ps.setString(2, p.getProdName());
			ps.setInt(3, p.getQuant());
			ps.setDouble(4, p.getPrice());
			ps.execute();
			System.out.println("Product  "+p.getProdName()+" is added !");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateProduct(Pojo_products p) {
		// TODO Auto-generated method stub
		String sql = "update products set product_name = ?, quantity = ?, price = ? where product_id = ?";
		try {
			PreparedStatement ps = getConnect.getConn().prepareStatement(sql);
			ps.setString(1, p.getProdName());
			ps.setInt(2,p.getQuant());
			ps.setDouble(3, p.getPrice());
			ps.setInt(4, p.getProdId());
			ps.execute();
			System.out.println("Product Id "+p.getProdId()+" is updated !");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteProduct(Pojo_products p) {
		try {
			CallableStatement cs = getConnect.getConn().prepareCall("{call deleteProductswithReportsOrders(?)}");
			cs.setInt(1, p.getProdId());
			cs.execute();
			System.out.println("Product Id "+p.getProdId()+" is deleted !");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
