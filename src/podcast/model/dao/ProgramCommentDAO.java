package podcast.model.dao;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import podcast.model.idao.IProgramCommentDAO;
import podcast.model.javabean.ProgramCommentBean;

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

	public List<ProgramCommentBean> selectByMemberId(Integer MemberId) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "from ProgramCommentBean where memberId=:memberId or podcasterId=:podcasterId";

		List<ProgramCommentBean> result = session.createQuery(hql, ProgramCommentBean.class)
				.setParameter("memberId", MemberId).setParameter("podcasterId", MemberId).getResultList();

		for (ProgramCommentBean r : result) {
			r.getCommentMsg();
		}

		return result;
	}

	@Override
	public List<ProgramCommentBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ProgramCommentBean> query = session.createQuery("from ProgramCommentBean", ProgramCommentBean.class);
		return query.list();
	}

	@Override
	public ProgramCommentBean update(Integer commentId, String commentMsg, Integer memberId, Integer podcasterId,
			Integer msgStatus, Date msgDate) {
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
	public ProgramCommentBean reply(Integer commentId, String replyMsg, Date replyDate) {
		Session session = sessionFactory.getCurrentSession();
		ProgramCommentBean pBean = session.get(ProgramCommentBean.class, commentId);

		if (pBean != null) {
			pBean.setReplyMsg(replyMsg);
			pBean.setReplyDate(replyDate);
		}

		return pBean;
	}

	@Override
	public boolean delete(Integer commentId) {
		Session session = sessionFactory.getCurrentSession();
		ProgramCommentBean pBean = session.get(ProgramCommentBean.class, commentId);

		if (pBean != null) {
			session.delete(pBean);
			return true;
		}
		return false;
	}

	
	public void deleteByMemberIdAndPublisherId(Integer MemberId) {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<ProgramCommentBean> list = selectByMemberId(MemberId);
		
		for(ProgramCommentBean l:list) {
			System.out.println(l.getCommentMsg());
			session.delete(l);
		}
	}
	
	@Override
	public List<ProgramCommentBean> selectAllPodcasterId(Integer podcasterId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String hbl = "from ProgramCommentBean where podcasterId=:podcasterId";

		Query<ProgramCommentBean> query = session.createQuery(hbl, ProgramCommentBean.class);
		query.setParameter("podcasterId", podcasterId);

		List<ProgramCommentBean> commList = query.list();
		List<ProgramCommentBean> reverseOrderCommList = new LinkedList<ProgramCommentBean>();

		for (int i = commList.size() - 1; i >= 0; i--) {
			reverseOrderCommList.add(commList.get(i));

		}

		return reverseOrderCommList;
	}

}