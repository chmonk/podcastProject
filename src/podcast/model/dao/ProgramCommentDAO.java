package podcast.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IProgramCommentDAO;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.uploadPodcastBean;

@Repository("ProgramCommentDAO")
public class ProgramCommentDAO implements IProgramCommentDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public ProgramCommentDAO() {
	}

	public ProgramCommentDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ProgramCommentBean insert(ProgramCommentBean pBean) {
		Session session = sessionFactory.getCurrentSession();

	
			session.save(pBean);
			return pBean;
	}

	@Override
	public ProgramCommentBean select(Integer commentId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ProgramCommentBean.class, commentId);
	}

	@Override
	public List<ProgramCommentBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ProgramCommentBean> query = session.createQuery("from ProgramCommentBean", ProgramCommentBean.class);
		return query.list();
	}
	
	@Override
	public List<ProgramCommentBean> selectAllPodcasterId(Integer podcasterId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from ProgramCommentBean where podcasterId=:podcasterId";

		Query<ProgramCommentBean> query = session.createQuery(hbl, ProgramCommentBean.class);
		query.setParameter("podcasterId", podcasterId);

		List<ProgramCommentBean> commList = query.list();

		return commList;
	}

	@Override
	public ProgramCommentBean update(Integer commentId, String commentMsg, Integer memberId, Integer podcasterId, Integer msgStatus,
			Date msgDate) {
		Session session = sessionFactory.getCurrentSession();
		ProgramCommentBean pBean = session.get(ProgramCommentBean.class, commentId);

		if (pBean != null) {
			pBean.setCommentMsg(commentMsg);
			pBean.setMemberId(memberId);
			pBean.setPodcasterId(podcasterId);
			pBean.setMsgStatus(msgStatus);
			pBean.setMsgDate(msgDate);
		}

		return pBean;
	}

	@Override
	public boolean delete(Integer commentId) {
		Session session = sessionFactory.getCurrentSession();
		ProgramCommentBean pBean = select(commentId);

		if (pBean != null) {
			session.delete(pBean);
			return true;
		}

		return false;
	}
	
	

}