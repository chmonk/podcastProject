package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.HistoryBean;

public interface IHistoryDao {
	public HistoryBean insert(HistoryBean hBean);
	public HistoryBean select(Integer historyId);
	public boolean delete(Integer historyId);
	public List<HistoryBean> selectByMember(Integer memberId);
	public List<HistoryBean> selectByPodcast(Integer podcastId);
	public List<HistoryBean> selectByPublisher(Integer publisherId);
}
