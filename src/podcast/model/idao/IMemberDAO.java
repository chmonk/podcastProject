package podcast.model.idao;

import java.sql.Date;
import java.util.List;

import podcast.model.javabean.MemberBean;

public interface IMemberDAO {
	public MemberBean insert(MemberBean mBean) throws Exception;

	public boolean checkLogin(MemberBean mBean);

	public MemberBean select(String acc, String pwd);

	public List<MemberBean> selectAll();

	public MemberBean update(String acc,MemberBean mBean );

	public List<MemberBean> fuzzySelectPodcasterAll();

	public MemberBean selectPodcaster(int id);

	public List<String> fuzzySelectPodcasterAllName();

	public boolean verificationPodcaster(int id);


}
