package podcast.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.ISubscriptionDAO;
import podcast.model.javabean.SubscriptionBean;

@Repository("SubscriptionDAO")
public class SubscriptionDAO implements ISubscriptionDAO {

	// @Autowired 自動找尋適合的註冊實體
	// @Qualifier("sessionFactory") 強制找尋註冊為sessionFactory 塞到sessionFactory變數中
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public SubscriptionDAO() {
	}

	public SubscriptionDAO(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;
	}

//	this.subOrderId = subOrderId;
//	this.subdateStart = subdateStart;
//	this.subdateEnd = subdateEnd;
//	this.monthlyPayment = monthlyPayment;
//	this.memberId = memberId;
//	this.podcasterId = podcasterId;
//	this.creditCardNumber = creditCardNumber;
//	this.receipt = receipt;
	
	

	@Override
	public SubscriptionBean insert(SubscriptionBean sbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();

		session.save(sbean);

		return sbean;
	}

	@Override
	public SubscriptionBean select(Integer subOrderId) throws Exception {
		Session session = sessionFactory.getCurrentSession();

		return session.get(SubscriptionBean.class, subOrderId);
	}

	@Override
	public List<SubscriptionBean> selectAll() throws Exception {
		Session session = sessionFactory.getCurrentSession();

		String hbl = "from SubscriptionBean";

		Query<SubscriptionBean> query = session.createQuery(hbl, SubscriptionBean.class);

		List<SubscriptionBean> lists = query.list();

		return lists;
	}

	@Override
	public SubscriptionBean update(Integer subOrderId, SubscriptionBean sbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();

		SubscriptionBean oldbean = select(subOrderId);

		if (oldbean != null) {
			oldbean.setCreditCardNumber(sbean.getCreditCardNumber());
			oldbean.setMemberId(sbean.getMemberId());
			oldbean.setMonthlyPayment(sbean.getMonthlyPayment());
			oldbean.setPodcasterId(sbean.getPodcasterId());
			oldbean.setReceipt(sbean.getReceipt());
			oldbean.setSubdateEnd(sbean.getSubdateEnd());
			oldbean.setSubdateStart(sbean.getSubdateStart());

			System.out.println("update done");
		}

		session.save(oldbean);

		return oldbean;
	}

	@Override
	public boolean delete(Integer subOrderId) throws Exception {
		Session session = sessionFactory.getCurrentSession();

		SubscriptionBean sbean = select(subOrderId);

		if (sbean != null) {
			session.delete(sbean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}

}