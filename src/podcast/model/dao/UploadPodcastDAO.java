package podcast.model.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IUploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;



@Repository("UploadPodcastDAO")
public class UploadPodcastDAO implements IUploadPodcastDAO  {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;


	public UploadPodcastDAO() {
	}

	public UploadPodcastDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Override
	public uploadPodcastBean insert(uploadPodcastBean ubean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		
			session.save(ubean);
			return ubean;

	}

	@Override
	public uploadPodcastBean select(Integer podcastId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		return session.get(uploadPodcastBean.class, podcastId);
	}

	@Override
	public List<uploadPodcastBean> selectAll() throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean";

		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);

		List<uploadPodcastBean> lists = query.list();

		return lists;
	}
	
	@Override
	public List<uploadPodcastBean> selectAllFromMember(Integer memberId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean where memberId=:memberId";

		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);
		query.setParameter("memberId", memberId);

		List<uploadPodcastBean> upList = query.list();

		return upList;
	}

	@Override
	public uploadPodcastBean update(Integer podcastId, uploadPodcastBean ubean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		uploadPodcastBean oldbean = session.get(uploadPodcastBean.class, podcastId);

//		if (oldbean != null) {
//			oldbean.setPodcastId(ubean.getPodcastId());
//
//			System.out.println("update done");
//		}
//
//		session.save(oldbean);
		
		if(oldbean != null) {
			oldbean.setOpenComment(ubean.getOpenComment());
			oldbean.setOpenPayment(ubean.getOpenPayment());
			oldbean.setTitle(ubean.getTitle());
			oldbean.setPodcastInfo(ubean.getPodcastInfo());
		}

		return oldbean;
	}

	@Override
	public boolean delete(Integer podcastId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		uploadPodcastBean ubean = select(podcastId);

		if (ubean != null) {
			session.delete(ubean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}

}
