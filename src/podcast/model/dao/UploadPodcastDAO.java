package podcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IUploadPodcastDAO;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.uploadPodcastBean;

@Repository("UploadPodcastDAO")
public class UploadPodcastDAO implements IUploadPodcastDAO {
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
	public List<String> fuzzySelectPodcastAllName() {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean";
		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);

		List<String> podcastAllDataName = new ArrayList<String>();
		for (uploadPodcastBean i : query.list()) {
			podcastAllDataName.add(i.getTitle());
		}
		return podcastAllDataName;

	}

	@Override
	public List<uploadPodcastBean> selectAllFromMember(Integer memberId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean where memberId=:memberId and openpayment=0";

		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);
		query.setParameter("memberId", memberId);

		List<uploadPodcastBean> upList = query.list();

		return upList;
	}
	

	
	public List<uploadPodcastBean> selectAllFromMemberAll(Integer memberId) throws Exception {

		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean where memberId=:memberId";

		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);
		query.setParameter("memberId", memberId);

		List<uploadPodcastBean> upList = query.list();

		return upList;
	}
	
	
	public List<uploadPodcastBean> selectLatestPodcasts() throws Exception {

		Session session = sessionFactory.getCurrentSession();
		String hbl = "from uploadPodcastBean order by uploadTime DESC";

		Query<uploadPodcastBean> query = session.createQuery(hbl, uploadPodcastBean.class);

		query.setFirstResult(0);
		query.setMaxResults(8);

		List<uploadPodcastBean> upList = query.list();
		System.out.println("抓到了："+upList);
		return upList;
	}

	@Override
	public uploadPodcastBean update(Integer podcastId, uploadPodcastBean ubean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		uploadPodcastBean oldbean = session.get(uploadPodcastBean.class, podcastId);

		if (oldbean != null) {
			oldbean.setOpenComment(ubean.getOpenComment());
			oldbean.setOpenPayment(ubean.getOpenPayment());
			oldbean.setTitle(ubean.getTitle());
			oldbean.setPodcastInfo(ubean.getPodcastInfo());
			oldbean.setAudioimg(ubean.getAudioimg());
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

	public List<uploadPodcastBean> queryProgramByMemberID(Integer memberId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from uploadPodcastBean up where up.memberId= :mid";

		List<uploadPodcastBean> resultlist = (List<uploadPodcastBean>) session.createQuery(hql, uploadPodcastBean.class)
				.setParameter("mid", memberId).getResultList();
		return resultlist;

	}

	// 點擊時點級數加一
	public uploadPodcastBean addClickCount(Integer podcastID) {

		uploadPodcastBean ubean = sessionFactory.getCurrentSession().get(uploadPodcastBean.class, podcastID);

		ubean.setClickAmount(ubean.getClickAmount() + 1);

		return ubean;
	}

	// 點擊愛心時like數加一
	public uploadPodcastBean addLikeCount(Integer podcastID) {

		uploadPodcastBean ubean = sessionFactory.getCurrentSession().get(uploadPodcastBean.class, podcastID);

		ubean.setLikesCount(ubean.getLikesCount() + 1);

		return ubean;
	}

	// 點擊愛心時like數減一
	public uploadPodcastBean decrLikeCount(Integer podcastID) {

		uploadPodcastBean ubean = sessionFactory.getCurrentSession().get(uploadPodcastBean.class, podcastID);
		
		if(ubean.getLikesCount()>0) {
			ubean.setLikesCount(ubean.getLikesCount() - 1);
		}
		
		return ubean;
	}

	// 依據傳入的list(PodcastId 們取資料)
	public ArrayList<uploadPodcastBean> selectListOfPodcast(List<HistoryBean> browsingHisList) {

		// 準備純數字的歷史podcastid序列
		List<Integer> browsingList = new ArrayList<>();

		for (HistoryBean hbean : browsingHisList) {
			browsingList.add(hbean.getPodcastId());
		}

		Session session = sessionFactory.getCurrentSession();

		// 寫sql語法準備查詢
		String nativeSql = "select * from uploadPodcast where ";

		for (Integer podcastId : browsingList) {
			nativeSql += "podcastId= " + podcastId + "  or ";
		}
		// 結尾語句用一個抓不到的
		nativeSql += "podcastId=0";

		// 取出資料未照順序 要排列
		ArrayList<uploadPodcastBean> nonOrderList = (ArrayList<uploadPodcastBean>) session
				.createNativeQuery(nativeSql, uploadPodcastBean.class).getResultList();

		// 製作編號對應uploadbean的map供查詢
		Map<Integer, uploadPodcastBean> m = new HashMap<>();

		for (uploadPodcastBean ubean : nonOrderList) {
			m.put(ubean.getPodcastId(), ubean);
		}

		// sql取資料 從新到舊 but 因為js playlist 新到舊 =下到上 塞丟前端資料從最舊紀錄開始塞
		ArrayList<uploadPodcastBean> orderList = new ArrayList<>();

		for (Integer i = browsingList.size() - 1; i >= 0; i--) {
			orderList.add(m.get(browsingList.get(i)));
		}

		return orderList;
	}

}
