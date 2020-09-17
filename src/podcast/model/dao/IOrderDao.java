package podcast.model.dao;

import java.sql.Connection;
import java.util.List;

import podcast.model.javabean.OrderBean;

public interface IOrderDao {

	void insertOrder(OrderBean ob);

	void setConnection(Connection con);

	OrderBean getOrder(int orderNo);

	List<OrderBean> getAllOrders();

	List<OrderBean> getMemberOrders(Integer memberId);

}