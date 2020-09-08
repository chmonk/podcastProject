package podcast.model.idao;

import java.util.List;

import podcast.model.javabean.CategoryBean;

public interface ICategoryDAO {
//	CRUD
	
	public CategoryBean insert(CategoryBean cbean) throws Exception;
	public CategoryBean select(int categoryId) throws Exception;
	public List<CategoryBean> selectAll() throws Exception;
	public CategoryBean update(int categoryId,CategoryBean cbean) throws Exception;
	public boolean delete(int categoryId) throws Exception;
	
}
