package podcast.model.dao;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IBackStageDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;

@Repository("BackStageDAO")
public class BackStageDAO implements IBackStageDAO{
	
	@Autowired@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Autowired
	private MemberDAO mDao;
	@Autowired
	private OrderTicketDAO oDAo;
	@Autowired
	private ProgramCommentDAO pDao;
	@Autowired
	private CategoryDAO cDao;
	@Autowired
	private SubscriptionDAO sDao;
	@Autowired
	private ActivityDAO aDao;
	@Autowired
	private HistoryDao hDao;
	

	public BackStageDAO() {
	
	}
	
	public BackStageDAO(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

	public MemberBean selectMember(int memberId) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}
	
	public MemberBean selectMemberByAccount(String account) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from MemberBean where account=:account";
		Query<MemberBean> query=session.createQuery(hqlstr,MemberBean.class);
		query.setParameter("account", account);
		MemberBean m = query.getSingleResult();
		return m;
	}

	public boolean deleteMember(int memberId) {
		Session session=sessionFactory.getCurrentSession();
		MemberBean mBean=session.get(MemberBean.class, memberId);
		if(mBean!=null) {
			session.delete(mBean);
			return true;
		}
		return false;
	}

	public OrderTicketBean selectOrderById(int orderId) {
		Session session=sessionFactory.getCurrentSession();
		OrderTicketBean oBean=session.get(OrderTicketBean.class, orderId);
		return oBean;
	}

	public List<OrderTicketBean> selectOrderByMember(int memberId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where memberId=:memberId";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("memberId", memberId);
		return query.list();
	}

	public List<OrderTicketBean> selectOrderByActivity(int activityId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where activityId=:activityId";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("activityId", activityId);
		return query.list();
	}

	public ProgramCommentBean selectCommentById(int commentId) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(ProgramCommentBean.class, commentId);
	}

	public List<ProgramCommentBean> selectCommentByMember(int memberId,int podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ProgramCommentBean where memberId=:memberId and podcasterId=:podcasterId";
		Query<ProgramCommentBean> query=session.createQuery(hqlstr,ProgramCommentBean.class);
		query.setParameter("memberId", memberId);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	public List<ProgramCommentBean> selectCommentByPodcaster(int podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ProgramCommentBean where podcasterId=:podcasterId";
		Query<ProgramCommentBean> query=session.createQuery(hqlstr,ProgramCommentBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}// 提醒要改，現有的Bean還是以每集podcast在寫的

	public boolean deleteComment(int commentId) {
		Session session=sessionFactory.getCurrentSession();
		ProgramCommentBean pBean= session.get(ProgramCommentBean.class, commentId);
		if(pBean!=null) {
			session.delete(pBean);
			return true;
		}
		return false;
	}

	public void deleteCommentByMember(int memberId,int podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ProgramCommentBean where memberId=:memberId and podcasterId=:podcasterId";
		Query<ProgramCommentBean> query=session.createQuery(hqlstr,ProgramCommentBean.class);
		query.setParameter("memberId", memberId);
		query.setParameter("podcasterId", podcasterId);
		List<ProgramCommentBean> list=query.list();
		for(ProgramCommentBean pBean:list) {
			session.delete(pBean);
		}
	}

	public boolean setNewCategory(CategoryBean cBean) throws Exception {
		//CategoryDAO cDao=new CategoryDAO();
		CategoryBean categorybean=cDao.select(cBean.getCategoryId());
		if(categorybean==null) {
			cDao.insert(cBean);
			return true;
		}
		return false;
		
	}

	public boolean updateCategory(int categoryId,CategoryBean cBean) throws Exception {
		//CategoryDAO cDao=new CategoryDAO();
		CategoryBean categorybean=cDao.select(categoryId);
		if(categorybean!=null) {
			cDao.update(categoryId, cBean);
			return true;
		}
		return false;
	}

	public List<SubscriptionBean> selectSubscriptionByMember(int memberId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from SubscriptBean where memberId=:memberId";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("memberId", memberId);
		return query.list();
	}	

	public List<SubscriptionBean> selectSubscriptionByPodcaster(int podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from SubscriptBean where podcasterId=:podcasterId";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	public boolean addNewActivity(ActivityBean aBean) throws Exception {
		//ActivityDAO aDao=new ActivityDAO();
		ActivityBean activityBean = aDao.select(aBean.getActivityId());
		if(activityBean==null) {
			aDao.insert(aBean);
			return true;
		}
		return false;
	}

	public ActivityBean selectActivity(int activityId) throws Exception {
		//ActivityDAO aDao=new ActivityDAO();
		return aDao.select(activityId);
	}

	public List<ActivityBean> selectActivityByPodcaster(int podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ActivityBean where podcasterId=:podcasterId";
		Query<ActivityBean> query=session.createQuery(hqlstr,ActivityBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	public List<ActivityBean> selectActivitybyDate(Date activityDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ActivityBean where activityDate=:activityDate";
		Query<ActivityBean> query=session.createQuery(hqlstr,ActivityBean.class);
		query.setParameter("activityDate", activityDate);
		return query.list();
	}

	public boolean deleteActivity(int activityId) throws Exception {
		//ActivityDAO aDao=new ActivityDAO();
		return aDao.delete(activityId);
	}

	
	public HistoryBean selectHistoryById(int historyId) {
		return hDao.select(historyId);
	}

	public List<HistoryBean> selectHistoryByMember(int memberId) {
		return hDao.selectByMember(memberId);
	}

	public List<HistoryBean> selectHistoryByPodcaster(int podcasterId) {
		return hDao.selectByPodcast(podcasterId);
	}
	
	public List<HistoryBean> selectHistoryByLastListen(Date setPoint){
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from HistoryBean where lastListen>:setPoint";
		Query<HistoryBean> query=session.createQuery(hqlstr,HistoryBean.class);
		query.setParameter("setPoint", setPoint);
		return query.list();
	}
	
	public boolean deleteHistoryByDate(Date setPoint){
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from HistoryBean where lastListen <:setPoint";
		Query<HistoryBean> query=session.createQuery(hqlstr,HistoryBean.class);
		query.setParameter("setPoint", setPoint);
		List<HistoryBean> list=query.list();
		for(HistoryBean hBean:list) {
			session.delete(hBean);
		}
		return true;
	}

	@Override
	public int SubscriptionIncome(Date startDate,Date endDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from Subscription where subdateStart between :startDate and :endDate";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<SubscriptionBean> list=query.list();
		
		int income=0;
		for(SubscriptionBean sBean:list ) {
			income+=sBean.getMonthlyPayment();
		}
		return income;
	}

	@Override
	public int TicketIncome(Date startDate,Date endDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where orderDate between :startDate and :endDate";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<OrderTicketBean> list=query.list();
		
		int income=0;
		for(OrderTicketBean oBean:list ) {
			income+=oBean.getOrderPrice();
		}
		System.out.println("income:"+income);
		return income;
	}
} 
