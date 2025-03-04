package implementer;

import model.Pojo_user;

public interface userImplementer {
	public Boolean registerUser(Pojo_user p);
	public boolean loginUser(Pojo_user p);
	public Pojo_user getUserData(Pojo_user p);
}
