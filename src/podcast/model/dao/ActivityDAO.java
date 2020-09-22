package podcast.model.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IActivityDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.MemberBean;



@Repository("ActivityDAO")
public class ActivityDAO implements IActivityDAO {

	// @Autowired 自動找尋適合的註冊實體
	// @Qualifier("sessionFactory") 強制找尋註冊為sessionFactory 塞到sessionFactory變數中
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public ActivityDAO() {
	}

	public ActivityDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ActivityBean insert(ActivityBean abean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(abean);
		return abean;
	}

	@Override
	public ActivityBean select(Integer activityId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ActivityBean.class, activityId);
	}
	
	@Override
	public List<ActivityBean>  selectByPodcasterId(Integer podcasterId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ActivityBean where podcasterId=:id";
		Query<ActivityBean> query = session.createQuery(hql, ActivityBean.class);
		query.setParameter("id", podcasterId);
		return query.list();

	}

	@Override
	public List<ActivityBean> selectAll() throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from ActivityBean";

		Query<ActivityBean> query = session.createQuery(hbl, ActivityBean.class);

		List<ActivityBean> lists = query.list();

		return lists;
	}

	@Override
	public ActivityBean update(Integer activityId, ActivityBean abean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		ActivityBean oldbean = select(activityId);

		if (oldbean != null) {
			oldbean.setActivityName(abean.getActivityName());
			oldbean.setActivityDate(abean.getActivityDate());
			oldbean.setActivityContent(abean.getActivityContent());
			oldbean.setActivityLocation(abean.getActivityLocation ());
			oldbean.setPodcasterId(abean.getPodcasterId());
			oldbean.setActivityPrice(abean.getActivityPrice());
			oldbean.setActivityMaxPeople(abean.getActivityMaxPeople());
			oldbean.setStock(abean.getStock());
			oldbean.setActivityStatus(abean.getActivityStatus());
			oldbean.setActivityImg(abean.getActivityImg());
			oldbean.setActivityTime(abean.getActivityTime());
			System.out.println("update done");
		}

		session.save(oldbean);

		return oldbean;
	}

	@Override
	public boolean delete(Integer activityId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		ActivityBean abean = select(activityId);

		if (abean != null) {
			session.delete(abean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}
	
	@Override
	public Map<Integer, ActivityBean> getActivityMap() {
		Map<Integer, ActivityBean> map = new LinkedHashMap<>();
		String hql = "FROM ActivityBean";
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
		List<ActivityBean> list = null;
		try {
			list = selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(ActivityBean bean: list) {
			map.put(bean.getActivityId(), bean);
			System.out.println("key="+bean.getActivityId()+" bean"+bean);
		}
		return map;
	}

}