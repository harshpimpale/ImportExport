package implementer;

import java.util.List;

import model.Pojo_reports;

public interface reportImplementer {
	void addReport(Pojo_reports p);
	List<Pojo_reports> getAll(String userId);
	List<Pojo_reports> getAllbySeller(String sellId);
}
