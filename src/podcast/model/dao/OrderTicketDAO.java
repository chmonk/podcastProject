package podcast.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IOrderTicketDAO;
import podcast.model.javabean.OrderTicketBean;

@Repository("OrderTicketDAO")
public class OrderTicketDAO implements IOrderTicketDAO {
	// @Autowired 自動找尋適合的註冊實體
	// @Qualifier("sessionFactory") 強制找尋註冊為sessionFactory 塞到sessionFactory變數中
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public OrderTicketDAO() {
	}

	public OrderTicketDAO( SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public OrderTicketBean insert(OrderTicketBean oBean) {
		Session session = sessionFactory.getCurrentSession();

			session.save(oBean);
			return oBean;

	}

	@Override
	public OrderTicketBean select(Integer ticketOrderId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(OrderTicketBean.class, ticketOrderId);
	}

	@Override
	public List<OrderTicketBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderTicketBean> query = session.createQuery("from OrderTicketBean", OrderTicketBean.class);
		return query.list();
	}

	@Override
	public OrderTicketBean update(Integer ticketOrderId,OrderTicketBean oBean) {
		Session session = sessionFactory.getCurrentSession();
		OrderTicketBean oldBean = session.get(OrderTicketBean.class, ticketOrderId);

		
		if (oldBean != null) {
			oldBean.setOrderDate(oBean.getOrderDate());
			oldBean.setOrderPrice(oBean.getOrderPrice());
			oldBean.setMemberId(oBean.getMemberId());
			oldBean.setCreditCardNumber(oBean.getCreditCardNumber());
			oldBean.setActivityId(oBean.getActivityId());
		}

		return oBean;
	}

	@Override
	public boolean delete(Integer ticketOrderId) {
		Session session = sessionFactory.getCurrentSession();
		OrderTicketBean oBean = session.get(OrderTicketBean.class, ticketOrderId);

		if (oBean != null) {
			session.delete(oBean);
			return true;
		}

		return false;
	}
}