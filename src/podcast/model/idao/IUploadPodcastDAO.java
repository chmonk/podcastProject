package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.uploadPodcastBean;

public interface IUploadPodcastDAO {
	public uploadPodcastBean insert(uploadPodcastBean ubean) throws Exception;
	public uploadPodcastBean select(Integer podcastId) throws Exception;
	public List<uploadPodcastBean> selectAll() throws Exception;
	public List<uploadPodcastBean> selectAllFromMember(Integer memberId) throws Exception;
	public uploadPodcastBean update(Integer podcastId,uploadPodcastBean ubean) throws Exception;
	public boolean delete(Integer podcastId) throws Exception;
<<<<<<< HEAD
	public List<String> fuzzySelectPodcastAllName();
	}
=======
	
}
>>>>>>> 003e67674cad20d2b3abea83e5faf602d049f516
