package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.uploadPodcastBean;

public interface IUploadPodcastDAO {
	public uploadPodcastBean insert(uploadPodcastBean ubean) throws Exception;
	public uploadPodcastBean select(int podcastId) throws Exception;
	public List<uploadPodcastBean> selectAll() throws Exception;
	public uploadPodcastBean update(int podcastId,uploadPodcastBean ubean) throws Exception;
	public boolean delete(int podcastId) throws Exception;
}