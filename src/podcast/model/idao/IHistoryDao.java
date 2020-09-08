package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.HistoryBean;

public interface IHistoryDao {
	public HistoryBean insert(HistoryBean hBean);
	public HistoryBean select(int historyId);
	public boolean delete(int historyId);
	public List<HistoryBean> selectByMember(int memberId);
	public List<HistoryBean> selectByPodcast(int podcastId);
	public List<HistoryBean> selectByPublisher(int publisherId);
}
