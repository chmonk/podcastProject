package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.LikeRecordBean;

public interface ILikeRecordDAO {

	public LikeRecordBean insert(LikeRecordBean lbean) throws Exception;

	public LikeRecordBean select(Integer likeRecordId) throws Exception;

	public List<LikeRecordBean> selectAll() throws Exception;

	public LikeRecordBean update(Integer likeRecordId, LikeRecordBean lbean) throws Exception;

	public boolean delete(Integer likeRecordId) throws Exception;

}
