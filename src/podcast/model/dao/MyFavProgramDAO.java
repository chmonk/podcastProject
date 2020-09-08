package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IMyFavProgramDAO;
import podcast.model.javabean.MyFavProgramBean;

@Repository("MyFavProgramDAO")
public class MyFavProgramDAO implements IMyFavProgramDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public MyFavProgramDAO() {
	}

	public MyFavProgramDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public MyFavProgramBean insert(MyFavProgramBean fBean) {
		Session session = sessionFactory.getCurrentSession();
		MyFavProgramBean myFavProgramBean = session.get(MyFavProgramBean.class, fBean.getFavId());

		if (myFavProgramBean == null) {
			session.save(fBean);
			return fBean;
		}
		return null;
	}

	@Override
	public MyFavProgramBean select(int favId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MyFavProgramBean.class, favId);
	}

	@Override
	public boolean delete(int favId) {
		Session session = sessionFactory.getCurrentSession();
		MyFavProgramBean fBean = session.get(MyFavProgramBean.class, favId);
		if (fBean != null) {
			session.delete(fBean);
			return true;
		}
		return false;
	}

	@Override
	public List<MyFavProgramBean> selectByMember(int memberId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from MyFavProgramBean where memberId=:memberId";
		Query<MyFavProgramBean> query = session.createQuery(hqlstr, MyFavProgramBean.class);
		query.setParameter("memberId", memberId);

		return query.list();
	}

	@Override
	public List<MyFavProgramBean> selectByPodcast(int podcastId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from MyFavProgramBean where podcastId=:podcastId";
		Query<MyFavProgramBean> query = session.createQuery(hqlstr, MyFavProgramBean.class);
		query.setParameter("podcastId", podcastId);

		return query.list();
	}

}