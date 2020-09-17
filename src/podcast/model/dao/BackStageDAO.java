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
import podcast.model.javabean.uploadPodcastBean;

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
	@Autowired
	private UploadPodcastDAO uDao;
	

	public BackStageDAO() {
	
	}
	
	public BackStageDAO(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

	//Member FUnction==============================================================================
	
	public MemberBean selectMember(Integer memberId) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}
	
	public MemberBean selectMemberByAccount(String account) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from MemberBean where account=:account";
		Query<MemberBean> query=session.createQuery(hqlstr,MemberBean.class);
		query.setParameter("account", account);
		List<MemberBean> m = query.getResultList();
		if(m.isEmpty()) {
			return null;
		}
		
		return m.get(0);
	}

	public boolean deleteMember(Integer memberId) {
		Session session=sessionFactory.getCurrentSession();
		MemberBean mBean=session.get(MemberBean.class, memberId);
		if(mBean!=null) {
			session.delete(mBean);
			return true;
		}
		return false;
	}

	//TicketOrderFunction==========================================================================
	
	public OrderTicketBean selectOrderById(Integer orderId) {
		Session session=sessionFactory.getCurrentSession();
		OrderTicketBean oBean=session.get(OrderTicketBean.class, orderId);
		return oBean;
	}

	public List<OrderTicketBean> selectOrderByMember(Integer memberId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where memberId=:memberId";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("memberId", memberId);
		return query.list();
	}

	public List<OrderTicketBean> selectOrderByActivity(Integer activityId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where activityId=:activityId";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("activityId", activityId);
		return query.list();
	}
	
	//ProgramCommentFunction======================================================================

	public ProgramCommentBean selectCommentById(Integer commentId) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(ProgramCommentBean.class, commentId);
	}

	public List<ProgramCommentBean> selectCommentByMember(Integer memberId,Integer podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ProgramCommentBean where memberId=:memberId and podcasterId=:podcasterId";
		Query<ProgramCommentBean> query=session.createQuery(hqlstr,ProgramCommentBean.class);
		query.setParameter("memberId", memberId);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	public List<ProgramCommentBean> selectCommentByPodcaster(Integer podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ProgramCommentBean where podcasterId=:podcasterId";
		Query<ProgramCommentBean> query=session.createQuery(hqlstr,ProgramCommentBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}// 提醒要改，現有的Bean還是以每集podcast在寫的

	public boolean deleteComment(Integer commentId) {
		Session session=sessionFactory.getCurrentSession();
		ProgramCommentBean pBean= session.get(ProgramCommentBean.class, commentId);
		if(pBean!=null) {
			session.delete(pBean);
			return true;
		}
		return false;
	}

	public void deleteCommentByMember(Integer memberId,Integer podcasterId) {
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
	
	//CategoryFunction============================================================

	public boolean setNewCategory(String categoryName) throws Exception {
//		CategoryDAO cDao=new CategoryDAO();
//		Session session = sessionFactory.getCurrentSession();
//		String hqlstr="from CategoryBean where categoryName=:categoryName";
//		Query<CategoryBean> query = session.createQuery(hqlstr,CategoryBean.class);
//		query.setParameter("categoryName", categoryName);
//		if(query.list().size()==0) {
			CategoryBean cBean=new CategoryBean();
			cBean.setCategoryName(categoryName);
			cDao.insert(cBean);
			return true;
//		}
//		return false;
		
	}

	public boolean updateCategory(Integer categoryId,CategoryBean cBean) throws Exception {
		//CategoryDAO cDao=new CategoryDAO();
		CategoryBean categorybean=cDao.select(categoryId);
		if(categorybean!=null) {
			cDao.update(categoryId, cBean);
			return true;
		}
		return false;
	}

	//Subscription Function==========================================================================
	
	public List<SubscriptionBean> selectSubscriptionByMember(Integer memberId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from SubscriptionBean where memberId=:memberId";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("memberId", memberId);
		return query.list();
	}	

	public List<SubscriptionBean> selectSubscriptionByPodcaster(Integer podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from SubscriptionBean where podcasterId=:podcasterId";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	//Activity Function================================================================================
	
//	public boolean addNewActivity(ActivityBean aBean) throws Exception {
//		//ActivityDAO aDao=new ActivityDAO();
//		ActivityBean activityBean = aDao.select(aBean.getActivityId());
//		if(activityBean==null) {
//			aDao.insert(aBean);
//			return true;
//		}
//		return false;
//	}

	public ActivityBean selectActivity(Integer activityId) throws Exception {
		//ActivityDAO aDao=new ActivityDAO();
		return aDao.select(activityId);
	}

	public List<ActivityBean> selectActivityByPodcaster(Integer podcasterId) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ActivityBean where podcasterId=:podcasterId";
		Query<ActivityBean> query=session.createQuery(hqlstr,ActivityBean.class);
		query.setParameter("podcasterId", podcasterId);
		return query.list();
	}

	public List<ActivityBean> selectActivitybyDate(Date activityDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from ActivityBean where activityDate>:activityDate";
		Query<ActivityBean> query=session.createQuery(hqlstr,ActivityBean.class);
		query.setParameter("activityDate", activityDate);
		return query.list();
	}

	public boolean deleteActivity(Integer activityId) throws Exception {
		//ActivityDAO aDao=new ActivityDAO();
		return aDao.delete(activityId);
	}

	//BrowsingHistory Function====================================================================
	
	public HistoryBean selectHistoryById(Integer historyId) {
		return hDao.select(historyId);
	}

	public List<HistoryBean> selectHistoryByMember(Integer memberId) {
		return hDao.selectByMember(memberId);
	}

	public List<HistoryBean> selectHistoryByPodcaster(Integer podcasterId) {
		return hDao.selectByPublisher(podcasterId);
	}
	
	public List<HistoryBean> selectHistoryByLastListen(Date setPoInteger){
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from HistoryBean where lastListen>:setPoInteger";
		Query<HistoryBean> query=session.createQuery(hqlstr,HistoryBean.class);
		query.setParameter("setPoInteger", setPoInteger);
		return query.list();
	}
	
	public boolean deleteHistoryByDate(Date setPoInteger){
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from HistoryBean where lastListen <:setPoInteger";
		Query<HistoryBean> query=session.createQuery(hqlstr,HistoryBean.class);
		query.setParameter("setPoInteger", setPoInteger);
		List<HistoryBean> list=query.list();
		for(HistoryBean hBean:list) {
			session.delete(hBean);
		}
		return true;
	}
	
	//income Function===================================================================================

	@Override
	public Integer SubscriptionIncome(Date startDate,Date endDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from SubscriptionBean where subdateStart between :startDate and :endDate";
		Query<SubscriptionBean> query=session.createQuery(hqlstr,SubscriptionBean.class);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<SubscriptionBean> list=query.list();
		
		Integer income=0;
		for(SubscriptionBean sBean:list ) {
			income+=sBean.getMonthlyPayment();
		}
		return income;
	}

	@Override
	public Integer TicketIncome(Date startDate,Date endDate) {
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from OrderTicketBean where orderDate between :startDate and :endDate";
		Query<OrderTicketBean> query=session.createQuery(hqlstr,OrderTicketBean.class);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<OrderTicketBean> list=query.list();
		
		Integer income=0;
		for(OrderTicketBean oBean:list ) {
			income+=oBean.getOrderPrice();
		}
		System.out.println("income:"+income);
		return income;
	}
	
	//UploadPodcast Function===================================================================
	
	@Override
	public List<uploadPodcastBean> selectPodcastByMember(Integer memberId){
		
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from uploadPodcastBean where memberId=:memberId";
		Query<uploadPodcastBean> query = session.createQuery(hqlstr,uploadPodcastBean.class);
		query.setParameter("memberId", memberId);
		List<uploadPodcastBean> list=query.list();
		
		return list;
		
	}
	
	@Override
	public boolean deletePodcast(Integer podcastId) throws Exception {
		
		return uDao.delete(podcastId);	
	}
	
	@Override
	public List<uploadPodcastBean> topPodcast(Date uploadTime){
		
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from uploadPodcastBean where uploadTime>:uploadTime ORDER BY clickAmount DESC ";
		Query<uploadPodcastBean> query = session.createQuery(hqlstr,uploadPodcastBean.class);
		query.setParameter("uploadTime", uploadTime);
		List<uploadPodcastBean> list=query.list();
		
		return list;
	}
} 
