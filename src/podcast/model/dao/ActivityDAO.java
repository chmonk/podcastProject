package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IActivityDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.HistoryBean;


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
	public ActivityBean select(int activityId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ActivityBean.class, activityId);
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
	public ActivityBean update(int activityId, ActivityBean abean) throws Exception {
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
			oldbean.setActivityMinPeople(abean.getActivityMinPeople());
			oldbean.setActivityStatus(abean.getActivityStatus());
			System.out.println("update done");
		}

		session.save(oldbean);

		return oldbean;
	}

	@Override
	public boolean delete(int activityId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		ActivityBean abean = select(activityId);

		if (abean != null) {
			session.delete(abean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}

}