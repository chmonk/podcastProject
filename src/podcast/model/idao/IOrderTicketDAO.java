package podcast.model.idao;

import java.util.Date;
import java.util.List;

import podcast.model.javabean.OrderTicketBean;

public interface IOrderTicketDAO {
	public OrderTicketBean insert(OrderTicketBean oBean);

	public OrderTicketBean select(int ticketOrderId);

	public List<OrderTicketBean> selectAll();

	public OrderTicketBean update(int ticketOrderId, OrderTicketBean oBean);

	public boolean delete(int ticketOrderId);

}