package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.ISubProgramListDAO;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;



@Repository("SubProgramListDAO")
public class SubProgramListDAO implements ISubProgramListDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public SubProgramListDAO(){
		
		System.out.println("no para subDAO");
	}
	
	
	public SubProgramListDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		System.out.println("WITH para subDAO");
	}


	@Override
	
	public List<uploadPodcastBean> selectByMemeberId(int memberID) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from uploadPodcastBean where memberId=:memberId and openpayment=1";
		Query<uploadPodcastBean> query = session.createQuery(hqlstr, uploadPodcastBean.class);
		query.setParameter("memberId", memberID);
		return query.list();
	}
	
	//在訂閱清單尋找會員ID與播客ID
	@Override
	public List<SubscriptionBean> selectSubcriptionByMemberID(Integer memberID,Integer podcasterID) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from SubscriptionBean where memberId=:memberId and podcasterID=:podcasterID ";
		Query<SubscriptionBean> query = session.createQuery(hqlstr, SubscriptionBean.class);
		query.setParameter("podcasterID", podcasterID);
		query.setParameter("memberId", memberID);
		return query.list();
		
		
	}
	
	
	//會員尋找購買紀錄
	@Override
	public List<SubscriptionBean> selectBySubMemeberId(int memberID) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from SubscriptionBean where memberId=:memberId";
		Query<SubscriptionBean> query = session.createQuery(hqlstr, SubscriptionBean.class);
		query.setParameter("memberId", memberID);
		return query.list();
	}
	
	
	@Override
	public SubscriptionBean insert(SubscriptionBean sbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
	
		session.save(sbean);

		return sbean;
	}

	

	
}
