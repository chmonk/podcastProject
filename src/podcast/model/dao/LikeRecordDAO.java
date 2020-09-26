package podcast.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import podcast.model.javabean.HistoryOrderProgramBean;
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

	// 節目刪除時使用
	public boolean detelePodcastId(Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();

		String nativesqlstr = "delete from likeRecord where podcastId= ? ";

		session.createNativeQuery(nativesqlstr).setParameter(1, podcastId).executeUpdate();

		// 檢查是否刪除
		String nativesqlstr1 = "select * from likeRecord  where  podcastId= ? ";

		NativeQuery<LikeRecordBean> query = session.createNativeQuery(nativesqlstr1, LikeRecordBean.class)
				.setParameter(1, podcastId);

		List<LikeRecordBean> result = query.getResultList();

		if (result.isEmpty()) {
			// 刪除乾淨
			return true;
		} else {
			return false;
		}
	}

	// 個人取消愛心時刪除
	public boolean deteleByMemberidAndPodcastId(Integer memberId, Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();

		String nativesqlstr = "delete from likeRecord where  memberId= ? and podcastId= ? ";

		session.createNativeQuery(nativesqlstr).setParameter(1, memberId).setParameter(2, podcastId).executeUpdate();

		// 檢查是否刪除
		String nativesqlstr1 = "select * from likeRecord  where  memberId= ? and podcastId= ? ";

		NativeQuery<LikeRecordBean> query = session.createNativeQuery(nativesqlstr1, LikeRecordBean.class)
				.setParameter(1, memberId).setParameter(2, podcastId);

		List<LikeRecordBean> result = query.getResultList();

		if (result.isEmpty()) {
			// 刪除乾淨
			return true;
		} else {
			return false;
		}
	}

	// 確認節目 使用者是否有 like紀錄
	public LikeRecordBean checkByMemberidAndPodcastID(Integer memberId, Integer podcastId) {

		Session session = sessionFactory.getCurrentSession();

		String sqlstr = " from LikeRecordBean where memberId=?1 and podcastId=?2";

	Query<LikeRecordBean> query = session.createQuery(sqlstr, LikeRecordBean.class)
				.setParameter(1, memberId).setParameter(2, podcastId);

		// 如果為空 表示未按過節目
		try {
			List<LikeRecordBean> rs = query.getResultList();
			if (rs.isEmpty()) {
				return null;
			} else {
				return rs.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	
	// 確認節目 使用者是否有 like紀錄  回傳likestatus 
		public Integer checkByMemberidAndPodcastIdReturnLikeStatus(Integer memberId, Integer podcastId) {

			Session session = sessionFactory.getCurrentSession();

			String sqlstr = " from LikeRecordBean where memberId=?1 and podcastId=?2";

		Query<LikeRecordBean> query = session.createQuery(sqlstr, LikeRecordBean.class)
					.setParameter(1, memberId).setParameter(2, podcastId);

			// 如果為空 表示未按過節目
			try {
				List<LikeRecordBean> rs = query.getResultList();
				if (rs.isEmpty()) {
					return 0;
				} else {
					return rs.get(0).getLikeStatus();
				}
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

		}
	
	
	//取的最愛節目清單
			public List<HistoryOrderProgramBean> selectLikeList(Integer memberId) {
				
				Session session = sessionFactory.getCurrentSession();
				
				
				String nativesqlstr =
						"select "
						//表格組成
						+ "h.podcastId,h.podcastName,h.publisherId,h.lastListen,h.memberId ,m.nickname,u.uploadTime, u.likesCount,u.clickAmount,u.audioImg, u.audioPath,u.podcastInfo, c.categoryName,l.likeStatus,l.showInListOrNot "
						//get the lastest record for each program from same memberid  1.?
						+ "from (select *, ROW_NUMBER() over(partition by podcastid order by lastlisten desc  ) as sn "
						+ "from browsingHistory where memberid= ? ) as h "
						//join likerecord
						+ "left join likeRecord as l on  l.podcastId=h.podcastId and  l.memberId=h.memberId "
						//join uploadpodcast
						+ "left join uploadPodcast as u on h.podcastId=u.podcastId "
						//join category
						+ "left join category as c on u.categoryId=c.categoryId "
						//join members
						+ "left join members as m on m.memberId=h.publisherId "
						// for specific memberid 2.?
						+ "where h.memberId=? "
						//the lastest record
						+ "and h.sn=1 and l.likeStatus=1 order by lastListen" ;			
				
				
				NativeQuery query = session.createNativeQuery(nativesqlstr);
				
				query.setParameter(1, memberId);
				query.setParameter(2, memberId);
				
				List<Object[]> resultSet = query.list();
				
				List<HistoryOrderProgramBean> orderList= new ArrayList<HistoryOrderProgramBean>();
				
				//sql取資料 從新到舊   but 因為js playlist 新到舊 =下到上   塞丟前端資料從最舊紀錄開始塞
				for (int i=resultSet.size()-1;i>=0;i--) {
					
					HistoryOrderProgramBean hpbean= new HistoryOrderProgramBean();
					
					System.out.println(resultSet.get(i)[3].toString());
					
					
					
					
					SimpleDateFormat sdf1 = new SimpleDateFormat(resultSet.get(i)[3].toString());
					
					String lastListen = resultSet.get(i)[3].toString();
					String uploadTime = resultSet.get(i)[6].toString();
					
					hpbean.setPodcastId(Integer.parseInt(resultSet.get(i)[0].toString()));
					hpbean.setPodcastName(resultSet.get(i)[1].toString());
					hpbean.setPublisherId(Integer.parseInt(resultSet.get(i)[2].toString()));
					hpbean.setLastListen(lastListen.substring(0, lastListen.indexOf(".")));
					hpbean.setMemberId(Integer.parseInt(resultSet.get(i)[4].toString()));
					hpbean.setNickname(resultSet.get(i)[5].toString());
					hpbean.setUploadTime(uploadTime.substring(0, uploadTime.indexOf(".")));
					hpbean.setLikesCount(Integer.parseInt(resultSet.get(i)[7].toString()));
					hpbean.setClickAmount(Integer.parseInt(resultSet.get(i)[8].toString()));
					hpbean.setAudioImg(resultSet.get(i)[9].toString());
					hpbean.setAudioPath(resultSet.get(i)[10].toString());
					hpbean.setPodcastInfo(resultSet.get(i)[11].toString());
					hpbean.setCategoryName(resultSet.get(i)[12].toString());
					hpbean.setLikestatus(Integer.parseInt(resultSet.get(i)[13].toString()));
					hpbean.setShowInListOrNot(Integer.parseInt(resultSet.get(i)[14].toString()));
					
					orderList.add(hpbean);
				}
				
				return orderList;
			}

}
