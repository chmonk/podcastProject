package podcast.model.idao;

import java.util.Date;
import java.util.List;

import podcast.model.javabean.MemberBean;

public interface IMemberDAO {
	public MemberBean insert(MemberBean member) throws Exception;

	public boolean checkLogin(MemberBean member);

	public MemberBean select(String acc, String pwd);

	public List<MemberBean> selectAll();

	public MemberBean update(String acc,MemberBean member );

	public List<MemberBean> fuzzySelectPodcasterAll();

	public MemberBean selectPodcaster(int id);


}
