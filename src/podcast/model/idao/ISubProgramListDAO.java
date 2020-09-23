package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;

public interface ISubProgramListDAO {
	public List<uploadPodcastBean> selectByMemeberId(int memberID) throws Exception;


	public List<SubscriptionBean> selectSubcriptionByMemberID(Integer memberID,Integer podcasterID) throws Exception;


	public SubscriptionBean insert(SubscriptionBean sbean) throws Exception;


	List<SubscriptionBean> selectBySubMemeberId(int memberID) throws Exception;



}
