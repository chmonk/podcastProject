package podcast.model.dao;

import java.text.SimpleDateFormat;    
import java.util.Date;  


import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IHistoryDao;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.HistoryOrderProgramBean;

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
	public List<HistoryBean> selectAll(){
		Session session=sessionFactory.getCurrentSession();
		String hqlstr="from HistoryBean";
		Query<HistoryBean> query=session.createQuery(hqlstr,HistoryBean.class);
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
	
	//取得對應使用者觀看節目紀錄  使用native sql 取得節目id 名字 上船者id 上傳者nickname 節目上傳時間(播放節目列表用)
	public List<HistoryOrderProgramBean> selectHistoryByMemberId2(Integer memberId) {

		Session session = sessionFactory.getCurrentSession();

		
		String nativesqlstr =
				//從虛擬資料表r 依序取原本bean要的值
				"select * from (select *, " + 
				//"--用節目id分組 依照觀看時間反序排(新的數字小)
				"ROW_NUMBER() over (partition by podcastId order by lastlisten desc) as sn " + 
				//取得節目id 名稱 上傳者暱稱 觀看時間 上傳時間  使用者id 節目典籍次數 節目案讚數  所以join 所需的三table 命名為new
				"from (select h.podcastId,h.podcastName,h.publisherId,h.lastListen,h.memberId ,m.nickname,u.uploadTime, u.likesCount,u.clickAmount,u.audioImg, u.audioPath,u.podcastInfo "+ 
				"from browsingHistory as h "+
				"left join uploadPodcast as u on  h.podcastId = u.podcastId " + 
				"left join  members as m on m.memberId= u.memberId) " + 
				"as new " + 
				//選擇使用者id
				"where memberId= ? ) " + 
				//為了取得個節目最新觀看並排序觀看時間 
				"as r where sn=1 order by lastListen desc";

		
		
		NativeQuery query = session.createNativeQuery(nativesqlstr);
		
		query.setParameter(1, memberId);

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
			
			orderList.add(hpbean);
		}

		return orderList;
	}
	
	
	//取得對應使用者觀看節目紀錄  使用native sql 取得節目id 名字 上船者id 上傳者nickname 節目上傳時間(網頁瀏覽紀錄用)
		public List<HistoryOrderProgramBean> selectHistoryByMemberId3(Integer memberId) {

			Session session = sessionFactory.getCurrentSession();

			
			String nativesqlstr =
					//從虛擬資料表r 依序取原本bean要的值
					"select * from (select *, " + 
					//"--用節目id分組 依照觀看時間反序排(新的數字小)
					"ROW_NUMBER() over (partition by podcastId order by lastlisten desc) as sn " + 
					//取得節目id 名稱 上傳者暱稱 觀看時間 上傳時間  使用者id 節目典籍次數 節目案讚數  所以join 所需的三table 命名為new
					"from (select h.podcastId,h.podcastName,h.publisherId,h.lastListen,h.memberId ,m.nickname,u.uploadTime, u.likesCount,u.clickAmount,u.audioImg, u.audioPath,u.podcastInfo, c.categoryName "+ 
					"from browsingHistory as h "+
					"left join uploadPodcast as u on  h.podcastId = u.podcastId " + 
					"left join  members as m on m.memberId= u.memberId " + 
					" left join category as c on c.categoryId=u.categoryId)"+
					"as new " + 
					//選擇使用者id
					"where memberId= ? ) " + 
					//為了取得個節目最新觀看並排序觀看時間 
					"as r where sn=1 order by lastListen";

			
			
			NativeQuery query = session.createNativeQuery(nativesqlstr);
			
			query.setParameter(1, memberId);

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
				
				orderList.add(hpbean);
			}

			return orderList;
		}

   
		//取得對應使用者觀看節目紀錄加上愛心紀錄  使用native sql 取得節目id 名字 上船者id 上傳者nickname 節目上傳時間 愛心與否(網頁瀏覽紀錄用) 
		public List<HistoryOrderProgramBean> selectHistoryByMemberId4(Integer memberId) {
			
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
					+ "where h.memberId=1  "
					//the lastest record
					+ "and h.sn=1  order by lastListen" ;			
			
			
			NativeQuery query = session.createNativeQuery(nativesqlstr);
			
			query.setParameter(1, memberId);
			
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
		
		
		//取得對應使用者觀看節目紀錄加上愛心紀錄  使用native sql 取得節目id 名字 上船者id 上傳者nickname 節目上傳時間 愛心與否(加入播放列表用) 
				public List<HistoryOrderProgramBean> selectHistoryByMemberId5(Integer memberId) {
					
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
							+ "where h.memberId=1  "
							//the lastest record
							+ "and h.sn=1  order by lastListen" ;			
					
					
					NativeQuery query = session.createNativeQuery(nativesqlstr);
					
					query.setParameter(1, memberId);
					
					List<Object[]> resultSet = query.list();
					
					List<HistoryOrderProgramBean> orderList= new ArrayList<HistoryOrderProgramBean>();
					
					//sql取資料 從新到舊   but 因為js playlist 新到舊 =下到上   塞丟前端資料從最舊紀錄開始塞
					//for (int i=0;i<=resultSet.size()-1;i++) {
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