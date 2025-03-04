package implementer;

import java.util.List;

import model.Pojo_orders;

public interface orderImplementer {
	
	List<Pojo_orders> showAllOrders(String consId);
	
	void cancelOrder(int ordId);
	
	int countDeletedOrders(String s);
	
}
