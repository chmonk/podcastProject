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

@Repository("pragramCommentDAO")
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
		ProgramCommentBean ProgramCommentBean = session.get(ProgramCommentBean.class, pBean.getCommentId());

		if (ProgramCommentBean == null) {
			session.save(pBean);
			return pBean;
		}

		return null;
	}

	@Override
	public ProgramCommentBean select(int commentId) {
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
	public ProgramCommentBean update(int commentId, String commentMsg, int memberId, int podcasterId, int msgStatus,
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
	public boolean delete(int commentId) {
		Session session = sessionFactory.getCurrentSession();
		ProgramCommentBean pBean = session.get(ProgramCommentBean.class, commentId);

		if (pBean != null) {
			session.delete(pBean);
			return true;
		}

		return false;
	}

}