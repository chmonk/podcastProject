package podcast.model.idao;

import java.util.Date;
import java.util.List;

import podcast.model.javabean.ProgramCommentBean;

public interface IProgramCommentDAO {
	public ProgramCommentBean insert(ProgramCommentBean pBean);

	public ProgramCommentBean select(Integer commentId);

	public List<ProgramCommentBean> selectAll();

	public ProgramCommentBean update(Integer commentId, String commentMsg, Integer memberId, Integer podcasterId, Integer msgStatus,
			Date msgDate);

	public boolean delete(Integer commentId);
	
	public List<ProgramCommentBean> selectAllPodcasterId(Integer podcasterId) throws Exception;

	public ProgramCommentBean reply(Integer commentId, String replyMsg, Date replyDate);


}
