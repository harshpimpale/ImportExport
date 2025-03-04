package operations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.getConnect;
import model.Pojo_products;

public class faizOperations {
    public List<Pojo_products> getAllProducts(){
        List<Pojo_products> products = new ArrayList<Pojo_products>();
        try (
        	Connection conn = getConnect.getConn();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM products")) {
            while (rs.next()) {
            	Pojo_products p = new Pojo_products();
                    p.setProdId(rs.getInt("product_id"));
                    p.setProdName(rs.getString("product_name"));
                    p.setQuant(rs.getInt("quantity"));
                    p.setSellerId(rs.getString("seller_id"));
                    p.setPrice(rs.getDouble("price"));
                    products.add(p);
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return products;
    }

    public void addProduct(Pojo_products product) throws SQLException {
        try (
        		Connection conn = getConnect.getConn();
             PreparedStatement ps = conn.prepareStatement(
                 "INSERT INTO products (product_name, quantity, price, seller_id) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, product.getProdName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getSellerId());
            ps.executeUpdate();
        }
    }

    public void updateProduct(Pojo_products product) {
        try (
        		Connection conn = getConnect.getConn();
             PreparedStatement ps = conn.prepareStatement(
                 "UPDATE products SET product_name = ?, quantity = ?, price = ?, seller_id = ? WHERE product_id = ?")) {
            ps.setString(1, product.getProdName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getSellerId());
            ps.setInt(5, product.getProdId());
            ps.executeUpdate();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    public void deleteProduct(int id) throws SQLException {
        try (
        		Connection conn = getConnect.getConn();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE product_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public Pojo_products getProductById(int id) {
        try (
        		Connection conn = getConnect.getConn();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE product_id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                	Pojo_products p = new Pojo_products();
                    p.setProdId(rs.getInt("product_id"));
                    p.setProdName(rs.getString("product_name"));
                    p.setQuant(rs.getInt("quantity"));
                    p.setSellerId(rs.getString("seller_id"));
                    p.setPrice(rs.getDouble("price"));
                	
                	return p;
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
    }
}
