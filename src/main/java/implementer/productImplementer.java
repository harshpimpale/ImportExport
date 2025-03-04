package implementer;

import java.util.List;

import model.Pojo_products;

public interface productImplementer {
	
	List<Pojo_products> showAllProducts();
	
	List<Pojo_products> showAllProductsofSeller(String sellerId);
	
	Pojo_products getProduct(int prodId);
	
	void addProducts(Pojo_products p);
	void updateProduct(Pojo_products p);
	void deleteProduct(Pojo_products p);
	
}
