package podcast.model.idao;

import java.util.Date;
import java.util.List;

import podcast.model.javabean.OrderTicketBean;

public interface IOrderTicketDAO {
	public OrderTicketBean insert(OrderTicketBean oBean);

	public OrderTicketBean select(Integer ticketOrderId);

	public List<OrderTicketBean> selectAll();

	public OrderTicketBean update(Integer ticketOrderId, OrderTicketBean oBean);

	public boolean delete(Integer ticketOrderId);
	
	public List<OrderTicketBean> getMemberOrders(Integer memberId);

}