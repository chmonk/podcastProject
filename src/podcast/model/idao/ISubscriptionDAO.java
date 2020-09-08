package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.SubscriptionBean;

public interface ISubscriptionDAO {
//	CRUD
	
	public SubscriptionBean insert(SubscriptionBean sbean) throws Exception;
	public SubscriptionBean select(int subOrderId) throws Exception;
	public List<SubscriptionBean> selectAll() throws Exception;
	public SubscriptionBean update(int subOrderId,SubscriptionBean pbean) throws Exception;
	public boolean delete(int subOrderId) throws Exception;
	

}
