package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.ILikeRecordDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.LikeRecordBean;

@Repository("LikeRecordDAO")
public class LikeRecordDAO implements ILikeRecordDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public LikeRecordDAO() {
	}

	public LikeRecordDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public LikeRecordBean insert(LikeRecordBean lbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(lbean);
		return lbean;
	}

	@Override
	public LikeRecordBean select(Integer likeRecordId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		return session.get(LikeRecordBean.class, likeRecordId);
	}
	@Override
	public List<LikeRecordBean> selectAll() throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from LikeRecordBean";

		Query<LikeRecordBean> query = session.createQuery(hbl, LikeRecordBean.class);

		List<LikeRecordBean> lists = query.list();

		return lists;
	}

	@Override
	public LikeRecordBean update(Integer likeRecordId, LikeRecordBean lbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		LikeRecordBean oldbean = select(likeRecordId);

		if (oldbean != null) {
			oldbean.setLikeStatus(lbean.getLikeStatus());
			oldbean.setMemberId(lbean.getMemberId());
			oldbean.setPodcastId(lbean.getPodcastId());
			System.out.println("update done");
		}

		session.save(oldbean);

		return oldbean;
	}

	@Override
	public boolean delete(Integer likeRecordId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		LikeRecordBean lbean = select(likeRecordId);

		if (lbean != null) {
			session.delete(lbean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}

	
	public boolean deteleByPodcastId(Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();
		
		String nativesqlstr="delete from likeRecord where podcastId=?";
		
		session.createNativeQuery(nativesqlstr).setParameter(1, podcastId).executeUpdate();
		
		//檢查是否刪除
		String nativesqlstr1="select * from likeRecord where podcastId=?";
		
		NativeQuery<LikeRecordBean> query = session.createNativeQuery(nativesqlstr1,LikeRecordBean.class).setParameter(1, podcastId);
		
		List<LikeRecordBean> result = query.getResultList();
		
		if(result.isEmpty()) {
			//刪除乾淨
			return true;
		}else{
			return false;
		}
	}

}
