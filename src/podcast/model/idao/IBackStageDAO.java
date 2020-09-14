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

public interface IBackStageDAO {
	public MemberBean selectMember(int memberId);
	public MemberBean selectMemberByAccount(String account);
	public boolean deleteMember(int memberId);
	public OrderTicketBean selectOrderById(int orderId);
	public List<OrderTicketBean> selectOrderByMember(int memberId);
	public List<OrderTicketBean> selectOrderByActivity(int activityId);
	public ProgramCommentBean selectCommentById(int commentId);
	public List<ProgramCommentBean> selectCommentByMember(int memberId,int podcasterId);
	public List<ProgramCommentBean> selectCommentByPodcaster(int podcasterId);
	public boolean deleteComment(int commentId);
	public void deleteCommentByMember(int memberId,int podcasterId);
	public boolean setNewCategory(String categoryName) throws Exception;
	public boolean updateCategory(int categoryId,CategoryBean cBean) throws Exception;
	public List<SubscriptionBean> selectSubscriptionByMember(int memberId);
	public List<SubscriptionBean> selectSubscriptionByPodcaster(int podcasterId);
//	public boolean addNewActivity(ActivityBean aBean) throws Exception;
	public ActivityBean selectActivity(int activityId) throws Exception;
	public List<ActivityBean> selectActivityByPodcaster(int podcasterId);
	public List<ActivityBean> selectActivitybyDate(Date activityDate);
	public boolean deleteActivity(int activityId) throws Exception;
	public HistoryBean selectHistoryById(int historyId);
	public List<HistoryBean> selectHistoryByMember(int memberId);
	public List<HistoryBean> selectHistoryByPodcaster(int podcasterId);
	public List<HistoryBean> selectHistoryByLastListen(Date setPoint);
	public boolean deleteHistoryByDate(Date setPoint);
	public int SubscriptionIncome(Date startDate,Date endDate);
	public int TicketIncome(Date startDate,Date endDate);
	
}
