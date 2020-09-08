package podcast.model.idao;


import java.util.List;

import podcast.model.javabean.MyFavProgramBean;

public interface IMyFavProgramDAO {
	public MyFavProgramBean insert(MyFavProgramBean fBean);
	public MyFavProgramBean select(int favId);
	public boolean delete(int favId);
	public List<MyFavProgramBean> selectByMember(int memberId);
	public List<MyFavProgramBean> selectByPodcast(int podcastId);
}