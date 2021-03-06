package podcast.model.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
		String nativesqlstr="select * from orderticket";
		NativeQuery query = session.createNativeQuery(nativesqlstr);
		List<Object[]> List=query.list();
		List<OrderTicketBean> oList=new ArrayList<OrderTicketBean>();
		for(int k=0;k<List.size();k++) {
			OrderTicketBean oBean=new OrderTicketBean();
			oBean.setTicketOrderId((Integer) List.get(k)[0]);
			oBean.setOrderDate((Date) List.get(k)[1]);
			oBean.setMemberId((Integer)List.get(k)[2]);
			oBean.setActivityId((Integer)List.get(k)[3]);
			oBean.setOrderPrice((Integer)List.get(k)[4]);
			oBean.setShippingAddress((String) List.get(k)[5]);
			oBean.setBno((String) List.get(k)[6]);
			oBean.setInvoiceTitle((String) List.get(k)[7]);
			
			BigDecimal bd=(BigDecimal) List.get(k)[8];
			Double dd=bd.doubleValue();
			oBean.setTotalAmount(dd);
			
			oList.add(oBean);
		}
		
		
		return oList;
	}

	@Override
	public OrderTicketBean update(Integer ticketOrderId,OrderTicketBean oBean) {
		Session session = sessionFactory.getCurrentSession();
		OrderTicketBean oldBean = session.get(OrderTicketBean.class, ticketOrderId);

		
		if (oldBean != null) {
			oldBean.setTotalAmount(oBean.getTotalAmount());
			oldBean.setMemberId(oBean.getMemberId());
			oldBean.setActivityId(oBean.getActivityId());
			//!!!!新增其他屬性
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
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderTicketBean> getMemberOrders(Integer memberId) {
		List<OrderTicketBean> list = null;
		Session session = sessionFactory.getCurrentSession();
        String hql = "FROM OrderTicketBean ob WHERE ob.memberId = :mid";
        list = session.createQuery(hql)
        			  .setParameter("mid", memberId)
        			  .getResultList();
        return list;
	}
	
	
	public OrderTicketBean getOrder(Integer ticketOrderId) {
		OrderTicketBean ob = null;
		Session session = sessionFactory.getCurrentSession();
    ob = session.get(OrderTicketBean.class, ticketOrderId);
    return ob;
}
	
	
}