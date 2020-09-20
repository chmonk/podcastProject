package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IMyFavProgramDAO;
import podcast.model.javabean.LikeRecordBean;
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
			session.save(fBean);
			return fBean;
	
	}

	@Override
	public MyFavProgramBean select(Integer favId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MyFavProgramBean.class, favId);
	}

	@Override
	public boolean delete(Integer favId) {
		Session session = sessionFactory.getCurrentSession();
		MyFavProgramBean fBean = session.get(MyFavProgramBean.class, favId);
		if (fBean != null) {
			session.delete(fBean);
			return true;
		}
		return false;
	}

	@Override
	public List<MyFavProgramBean> selectByMember(Integer memberId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from MyFavProgramBean where memberId=:memberId";
		Query<MyFavProgramBean> query = session.createQuery(hqlstr, MyFavProgramBean.class);
		query.setParameter("memberId", memberId);

		return query.list();
	}

	@Override
	public List<MyFavProgramBean> selectByPodcast(Integer podcastId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from MyFavProgramBean where podcastId=:podcastId";
		Query<MyFavProgramBean> query = session.createQuery(hqlstr, MyFavProgramBean.class);
		query.setParameter("podcastId", podcastId);

		return query.list();
	}
	
	public boolean deteleByPodcastId(Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();
		
		String nativesqlstr="delete from myFavProgram where podcastId=?";
		
		session.createNativeQuery(nativesqlstr).setParameter(1, podcastId).executeUpdate();
		
		//檢查是否刪除
		String nativesqlstr1="select * from myFavProgram where podcastId=?";
		
		NativeQuery<MyFavProgramBean> query = session.createNativeQuery(nativesqlstr1,MyFavProgramBean.class).setParameter(1, podcastId);
		
		List<MyFavProgramBean> result = query.getResultList();
		
		if(result.isEmpty()) {
			//刪除乾淨
			return true;
		}else{
			return false;
		}
	}
	
	//確認有加入播放清單
	public boolean checkByMemberidAndPodcastID(Integer memberId, Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();

		String sqlstr = "select * from myFavProgram where memberId=? and podcastId=?";

		NativeQuery query = session.createNativeQuery(sqlstr).setParameter(1, memberId).setParameter(2, podcastId);

		List rs = query.getResultList();

		// 如果為空 表示沒訂閱
		if (rs.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

}