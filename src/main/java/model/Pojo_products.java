package model;

import java.util.List;

import operations.productOperations;

public class Pojo_products {
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	int prodId;
	String sellerId;
	String prodName;
	int quant;
	double price;
	
	
	public List<Pojo_products> showAll() {
		// TODO Auto-generated method stub
		return new productOperations().showAllProducts();
	}
	
	public Pojo_products getProduct(int prodId2) {
		// TODO Auto-generated method stub
		return new productOperations().getProduct(prodId2);
	}
	
	public List<Pojo_products> showProductsofSeller(String SellerId) {
		return new productOperations().showAllProductsofSeller(SellerId);
	}
	
	public void addProducts(Pojo_products p) {
		// TODO Auto-generated method stub
		new productOperations().addProducts(p);
	}

	public void editProducts(Pojo_products p) {
		// TODO Auto-generated method stub
		new productOperations().updateProduct(p);
	}
	
	public void delProducts(Pojo_products p) {
		// TODO Auto-generated method stub
		new productOperations().deleteProduct(p);
	}
	public Pojo_products getProductById(int prodId) {
		// TODO Auto-generated method stub
		return new productOperations().getProduct(prodId);
	}
}
