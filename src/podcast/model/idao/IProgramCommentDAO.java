package podcast.model.idao;

import java.util.Date;
import java.util.List;

import podcast.model.javabean.ProgramCommentBean;

public interface IProgramCommentDAO {
	public ProgramCommentBean insert(ProgramCommentBean pBean);

	public ProgramCommentBean select(int commentId);

	public List<ProgramCommentBean> selectAll();

	public ProgramCommentBean update(int commentId, String commentMsg, int memberId, int podcasterId, int msgStatus,
			Date msgDate);

	public boolean delete(int commentId);

}
