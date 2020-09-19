package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IHistoryDao;
import podcast.model.javabean.HistoryBean;

//註冊dAO名稱  session.getbean時用
@Repository("HistoryDao")
public class HistoryDao implements IHistoryDao {

	// @Autowired 自動找尋適合的註冊實體
	// @Qualifier("sessionFactory") 強制找尋註冊為sessionFactory 塞到sessionFactory變數中
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public HistoryDao() {
	}

	public HistoryDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public HistoryBean insert(HistoryBean hBean) {
		Session session = sessionFactory.getCurrentSession();

		session.save(hBean);
		return hBean;

	}

	@Override
	public HistoryBean select(Integer historyId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(HistoryBean.class, historyId);
	}

	@Override
	public boolean delete(Integer historyId) {
		Session session = sessionFactory.getCurrentSession();
		HistoryBean hBean = session.get(HistoryBean.class, historyId);
		if (hBean != null) {
			session.delete(hBean);
			return true;
		} else {
			return false;
		}
	}
	
	
	
	public boolean deteleByPodcastId(Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();
		
		String nativesqlstr="delete from browsingHistory where podcastId=?";
		
		session.createNativeQuery(nativesqlstr).setParameter(1, podcastId).executeUpdate();
		
		//檢查是否刪除
		String nativesqlstr1="select * from browsingHistory where podcastId=?";
		
		NativeQuery<HistoryBean> query = session.createNativeQuery(nativesqlstr1,HistoryBean.class).setParameter(1, podcastId);
		
		List<HistoryBean> result = query.getResultList();
		
		
		if(result.isEmpty()) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	// sql: "select from HistoryBean where memberId=:memberId"
	// hql: "from (這邊是對應bean的class名稱,不是tablename絕對要注意!!!!!!!!!!!!!!!!)HistoryBean
	// where memberId=:memberId"
	public List<HistoryBean> selectByMember(Integer memberId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from HistoryBean where memberId=:memberId";
		Query<HistoryBean> query = session.createQuery(hqlstr, HistoryBean.class);
		query.setParameter("memberId", memberId);

		return query.list();
	}

	@Override
	public List<HistoryBean> selectByPodcast(Integer podcastId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = " from HistoryBean where podcastId=:podcastId";
		Query<HistoryBean> query = session.createQuery(hqlstr, HistoryBean.class);
		query.setParameter("podcastId", podcastId);

		return query.list();
	}

	@Override
	public List<HistoryBean> selectByPublisher(Integer publisherId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = " from HistoryBean where publisherId=:publisherId";
		Query<HistoryBean> query = session.createQuery(hqlstr, HistoryBean.class);
		query.setParameter("publisherId", publisherId);

		return query.list();
	}

	// test native sql : 用瀏覽紀錄id找紀錄
	public List<HistoryBean> selectHistoryByBrowingId(Integer browsingId) {

		Session session = sessionFactory.getCurrentSession();

		String nativesqlstr = "select * from browsingHistory where historyId=?";

		NativeQuery<HistoryBean> query = session.createNativeQuery(nativesqlstr, HistoryBean.class);
		
		query.setParameter(1, browsingId);

		List<HistoryBean> list = query.getResultList();

		for (HistoryBean h : list) {
			System.out.println(h.getPodcastName());
		}

		return list;
	}

	// test native sql : 找出使用者看過節目的最新一筆瀏覽紀錄
	public List<HistoryBean> selectHistoryByMemberId(Integer memberId) {

		Session session = sessionFactory.getCurrentSession();

		
		String nativesqlstr =
				//從虛擬資料表r 依序取原本bean要的值
				"select r.historyId,r.podcastId,r.podcastName,r.publisherId,r.memberId,r.lastListen from   "
				//虛擬表格生成方式   所有項目 * 加上排序項目sn(相同節目編號進行分組)用時間反序排列(大到小)
				+ "(select * , ROW_NUMBER() over (partition by podcastId order by lastlisten desc) as sn "
				+ "from browsingHistory where memberId= ? ) as r"
				//取得第一組分組(最新時間排列)
				+ " where r.sn=1 order by lastListen desc ";

		NativeQuery<HistoryBean> query = session.createNativeQuery(nativesqlstr, HistoryBean.class);
		
		query.setParameter(1, memberId);

		List<HistoryBean> list = query.getResultList();

		for (HistoryBean h : list) {
			System.out.println(h.getPodcastName());
		}

		return list;
	}

}