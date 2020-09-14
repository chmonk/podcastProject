package podcast.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.ICategoryDAO;
import podcast.model.javabean.CategoryBean;


@Repository("CategoryDAO")
public class CategoryDAO implements ICategoryDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	public CategoryDAO() {
	}

	public CategoryDAO(SessionFactory sessionFactory) {
		this.sessionFactory =sessionFactory;
	}

	@Override
	public CategoryBean insert(CategoryBean cbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(cbean);
		return cbean;
	}

	@Override
	public CategoryBean select(Integer categoryId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		return session.get(CategoryBean.class, categoryId);
	}

	@Override
	public List<CategoryBean> selectAll() throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from CategoryBean";

		Query<CategoryBean> query = session.createQuery(hbl, CategoryBean.class);

		List<CategoryBean> lists = query.list();

		return lists;
	}

	@Override
	public CategoryBean update(Integer categoryId, CategoryBean cbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		CategoryBean oldbean = select(categoryId);

		if (oldbean != null) {
			oldbean.setCategoryName(cbean.getCategoryName());

			System.out.println("update done");
		}

		session.save(oldbean);

		return oldbean;
	}

	@Override
	public boolean delete(Integer categoryId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		CategoryBean cbean = select(categoryId);

		if (cbean != null) {
			session.delete(cbean);
			System.out.println("delete done");
			return true;
		}

		return false;
	}

}