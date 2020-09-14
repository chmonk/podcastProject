package podcast.model.idao;


import java.util.List;

import podcast.model.javabean.MyFavProgramBean;

public interface IMyFavProgramDAO {
	public MyFavProgramBean insert(MyFavProgramBean fBean);
	public MyFavProgramBean select(Integer favId);
	public boolean delete(Integer favId);
	public List<MyFavProgramBean> selectByMember(Integer memberId);
	public List<MyFavProgramBean> selectByPodcast(Integer podcastId);
}