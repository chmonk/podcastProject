package podcast.model.dao;

import java.sql.Connection;

import podcast.model.javabean.OrderItemBean;

public interface IOrderItemDao {
	
		
	double findItemAmount(OrderItemBean oib);

	int updateProductStock(OrderItemBean ob);
	
	void setConnection(Connection conn);
}
