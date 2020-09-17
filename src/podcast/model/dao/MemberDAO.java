package podcast.model.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IMemberDAO;
import podcast.model.javabean.MemberBean;

@Repository("MemberDAO")
public class MemberDAO implements IMemberDAO {
	
	// @Autowired 自動找尋適合的註冊實體
	// @Qualifier("sessionFactory") 強制找尋註冊為sessionFactory 塞到sessionFactory變數中
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public MemberDAO() {

	}

	public MemberDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	@Override
	public MemberBean insert(MemberBean mbean) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(mbean);
		return mbean;
	}

	@Override
	public boolean checkLogin(MemberBean member) {
		Session session = sessionFactory.getCurrentSession();

		String hqlStr = "from MemberBean where account=:acc and password=:pwd";
		Query<MemberBean> query = session.createQuery(hqlStr, MemberBean.class);

		query.setParameter("acc", member.getAccount());
		query.setParameter("pwd", member.getPassword());

		MemberBean m = query.uniqueResult();

		if (m != null) {
			return true;
		}

		return false;
	}

	@Override
	public MemberBean select(String acc, String pwd) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from MemberBean where account=:acc and password=:pwd";
		Query<MemberBean> query = session.createQuery(hql, MemberBean.class);

		query.setParameter("acc", acc);
		query.setParameter("pwd", pwd);
		MemberBean m = query.uniqueResult();
		if (m != null) {
			return m;
		}
		return null;
	}

	@Override
	public List<MemberBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBean> query = session.createQuery("from MemberBean", MemberBean.class);
		List<MemberBean> lists = query.list();
		return lists;
	}
	
	@Override
	public MemberBean selectPodcaster(int id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from MemberBean where memberId=:id";
		Query<MemberBean> query = session.createQuery(hql, MemberBean.class);
		query.setParameter("id", id);
		
		MemberBean m = query.uniqueResult();
		if (m != null) {
			return m;
		}
		return null;
		
	}
	
	@Override
	public List<MemberBean> fuzzySelectPodcasterAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from MemberBean where role=2";
		Query<MemberBean> query = session.createQuery(hql, MemberBean.class);
		return query.list();
	}

	@Override
	public MemberBean update(String acc, MemberBean mbean) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from MemberBean where account=:acc";
		Query<MemberBean> query = session.createQuery(hql, MemberBean.class);

		query.setParameter("acc", acc);
		MemberBean m = query.uniqueResult();
		if (m != null) {
			m.setPassword(mbean.getPassword());
			m.setName(mbean.getName());
			m.setNickname(mbean.getNickname());
			m.setBirthday(mbean.getBirthday());
			m.setInfo(mbean.getInfo());
			m.setEmail(mbean.getEmail());
			m.setCellphone(mbean.getCellphone());
			m.setAddress(mbean.getAddress());
			m.setSex(mbean.getSex());
			m.setImage(mbean.getImage());
			m.setRole(mbean.getRole());
			m.setCreditCardNumber(mbean.getCreditCardNumber());
			m.setBankAccount(mbean.getBankAccount());
			m.setMonthlyPayment(mbean.getMonthlyPayment());
			System.out.println("update done");
		}
		session.save(m);
		return null;

	}
	
	public MemberBean checkIdPassword(String account, String password) {
		MemberBean mb = null;		
		String hql = "from MemberBean where account=:acc and password=:pwsd";		
		Session session = sessionFactory.getCurrentSession();
		try {
			mb = (MemberBean)session.createQuery(hql)
								.setParameter("acc", account)
								.setParameter("pwsd", password)
								.getSingleResult();
		} catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			throw new RuntimeException("帳號資料有誤");
		} 	
		return mb;
	}

}