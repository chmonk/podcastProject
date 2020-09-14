package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.ActivityBean;

public interface IActivityDAO {
//	CRUD
	
	public ActivityBean insert(ActivityBean abean) throws Exception;
	public ActivityBean select(Integer ActivityId) throws Exception;
	public List<ActivityBean> selectAll() throws Exception;
	public ActivityBean update(Integer ActivityId,ActivityBean abean) throws Exception;
	public boolean delete(Integer ActivityId) throws Exception;

}
