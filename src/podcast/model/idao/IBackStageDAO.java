package podcast.model.idao;

import java.sql.Date;
import java.util.List;

import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;

public interface IBackStageDAO {
	public MemberBean selectMember(Integer memberId);
	public MemberBean selectMemberByAccount(String account);
	public boolean deleteMember(Integer memberId);
	public OrderTicketBean selectOrderById(Integer orderId);
	public List<OrderTicketBean> selectOrderByMember(Integer memberId);
	public List<OrderTicketBean> selectOrderByActivity(Integer activityId);
	public ProgramCommentBean selectCommentById(Integer commentId);
	public List<ProgramCommentBean> selectCommentByMember(Integer memberId,Integer podcasterId);
	public List<ProgramCommentBean> selectCommentByPodcaster(Integer podcasterId);
	public boolean deleteComment(Integer commentId);
	public void deleteCommentByMember(Integer memberId,Integer podcasterId);
	public boolean setNewCategory(String categoryName) throws Exception;
	public boolean updateCategory(Integer categoryId,CategoryBean cBean) throws Exception;
	public List<SubscriptionBean> selectSubscriptionByMember(Integer memberId);
	public List<SubscriptionBean> selectSubscriptionByPodcaster(Integer podcasterId);
//	public boolean addNewActivity(ActivityBean aBean) throws Exception;
	public ActivityBean selectActivity(Integer activityId) throws Exception;
	public List<ActivityBean> selectActivityByPodcaster(Integer podcasterId);
	public List<ActivityBean> selectActivitybyDate(Date activityDate);
	public boolean deleteActivity(Integer activityId) throws Exception;
	public HistoryBean selectHistoryById(Integer historyId);
	public List<HistoryBean> selectHistoryByMember(Integer memberId);
	public List<HistoryBean> selectHistoryByPodcaster(Integer podcasterId);
	public List<HistoryBean> selectHistoryByLastListen(Date setPoInteger);
	public boolean deleteHistoryByDate(Date setPoInteger);
	public Integer SubscriptionIncome(Date startDate,Date endDate);
	public Double TicketIncome(Date startDate,Date endDate);
	
	//uploadPodcast methods=============================================
	public List<uploadPodcastBean> selectPodcastByMember(Integer memberId);
	public boolean deletePodcast(Integer podcastId) throws Exception;
	public List<uploadPodcastBean> topPodcast(Date uploadTime);
	public List<MemberBean> topTenMember(Date uploadTime);
	
}
