package podcast.controller;

import java.sql.Date;
import java.util.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import antlr.collections.List;
import podcast.model.dao.ActivityDAO;
import podcast.model.dao.BackStageDAO;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.HistoryDao;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.OrderTicketDAO;
import podcast.model.dao.ProgramCommentDAO;
import podcast.model.dao.SubscriptionDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class BackStageAjaxController {

	@Autowired
	private MemberDAO mDao;
	@Autowired
	private OrderTicketDAO oDao;
	@Autowired
	private ProgramCommentDAO pDao;
	@Autowired
	private CategoryDAO cDao;
	@Autowired
	private SubscriptionDAO sDao;
	@Autowired
	private ActivityDAO aDao;
	@Autowired
	private HistoryDao hDao;
	@Autowired
	private UploadPodcastDAO uDao;
	@Autowired
	private BackStageDAO bDao;
	
//所有的showALLFunction=======================================
	
	@GetMapping(path= {"showAllMember"})
	public @ResponseBody java.util.List<MemberBean> showAllMember(Model m) {
		java.util.List<MemberBean> allMemberList=mDao.selectAll();
		m.addAttribute("allMemberList",allMemberList);
		
		
		return allMemberList;
	}
	
	@GetMapping(path= {"showAllTicketOrder"})
	public @ResponseBody java.util.List<OrderTicketBean> showAllOrder() {
		java.util.List<OrderTicketBean> allOrderList=oDao.selectAll();
		
		return allOrderList;
	}
	
	@GetMapping(path= {"showAllComment"})
	public @ResponseBody java.util.List<ProgramCommentBean> showAllComment() {
		java.util.List<ProgramCommentBean> allCommentList=pDao.selectAll();
		
		return allCommentList;
	}
	
	@GetMapping(path= {"showAllCategory"})
	public @ResponseBody java.util.List<CategoryBean> showAllCategory() throws Exception {
		java.util.List<CategoryBean> allCategoryList=cDao.selectAll();
		
		return allCategoryList;
	}
	
	@GetMapping(path= {"showAllSub"})
	public @ResponseBody java.util.List<SubscriptionBean> showAllSub() throws Exception {
		java.util.List<SubscriptionBean> allSubList=sDao.selectAll();
		
		return allSubList;
	}
	
	@GetMapping(path= {"showAllActivity"})
	public @ResponseBody java.util.List<ActivityBean> showAllActivity() throws Exception {
		java.util.List<ActivityBean> allActivityList=aDao.selectAll();
		
		return allActivityList;
	}
	
	@GetMapping(path= {"showAllHistory"})
	public @ResponseBody java.util.List<HistoryBean> showAllHistory() throws Exception {
		java.util.List<HistoryBean> allHistoryList=hDao.selectAll();
		
		return allHistoryList;
	}
	
	@GetMapping(path= {"showAllPodcast"})
	public @ResponseBody java.util.List<uploadPodcastBean> showAllPodcast() throws Exception {
		java.util.List<uploadPodcastBean> allPodcastList=uDao.selectAll();
		
		return allPodcastList;
	}
	
//Member AJAX Function=================================================================
	
	@PostMapping(path = { "/BackStageSelectMember" })
	public @ResponseBody java.util.List<MemberBean> selectMember(HttpServletRequest request, @RequestParam(value="input") Integer memberId,
			Model m) {
		
		MemberBean mBean = bDao.selectMember(memberId);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);

		return mList;
	}
	
	@PostMapping(path = { "/BackStageSelectMemberByAccount" })
	public @ResponseBody java.util.List<MemberBean> selectMemberByAccount(HttpServletRequest request, @RequestParam(value = "input") String account,
			Model m) {
		MemberBean mBean = bDao.selectMemberByAccount(account);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);

		return mList;
	}

	@PostMapping(path = { "/BackStageDeleteMember" })
	public @ResponseBody java.util.List<MemberBean> DeleteMember(HttpServletRequest request, @RequestParam(value = "input") Integer memberId,
			Model m) {
		
		MemberBean mBean = bDao.selectMember(memberId);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);
		
		bDao.deleteMember(memberId);
		m.addAttribute("memberDeleteMsg", "Select Member Deleted!");
		return mList;

	}

//TicketOrder AJAX Function============================================
	
	@PostMapping(path = { "/BackStageSelectOrderById" })
	public @ResponseBody java.util.List<OrderTicketBean> selectOrderById(HttpServletRequest request, @RequestParam(value = "input") Integer orderId, Model m) {
		
		OrderTicketBean oBean = bDao.selectOrderById(orderId);
		java.util.List<OrderTicketBean> oList = new ArrayList<OrderTicketBean>();
		oList.add(oBean);

		return oList;
	}

	@PostMapping(path = { "/BackStageSelectOrderByMember" })
	public  @ResponseBody java.util.List<OrderTicketBean> selectOrderByMember(@RequestParam(value = "input") Integer memberId,
			Model m) {
		
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByMember(memberId);

		return oList;
	}

	@PostMapping(path = { "/BackStageSelectOrderByActivity" })
	public @ResponseBody java.util.List<OrderTicketBean> selectOrderByActivity(@RequestParam(name = "input") Integer activityId,
			Model m) {
		
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByActivity(activityId);

		return oList;
	}

	//ProgramComment AJAX Function======================================================
	
	@PostMapping(path = { "/BackStageSelectCommentById" })
	public @ResponseBody java.util.List<ProgramCommentBean> SelectCommentByID(@RequestParam(name = "inputm") Integer commentId,
			Model m) {
		
		ProgramCommentBean pBean = bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList = new ArrayList<ProgramCommentBean>();
		pList.add(pBean);

		return pList;
	}

	@PostMapping(path = { "/BackStageSelectCommentByMember" })
	public @ResponseBody java.util.List<ProgramCommentBean> SelectCommentByMember(
			@RequestParam(name = "inputm") Integer commentmemberId,
			@RequestParam(name = "inputp") Integer commentpodcasterId, Model m) {
		
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByMember(commentmemberId, commentpodcasterId);

		return pList;
	}

	@PostMapping(path = { "/BackStageSelectCommentByPodcaster" })
	public @ResponseBody java.util.List<ProgramCommentBean> SelectCommentByPodcaster(
			@RequestParam(name = "inputm") Integer commentpodcasterId, Model m) {
		
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByPodcaster(commentpodcasterId);
		m.addAttribute("pList", pList);

		return pList;
	}

	@PostMapping(path = { "/BackStageDeleteCommentById" })
	public @ResponseBody java.util.List<ProgramCommentBean> DeleteCommentById( 
			@RequestParam(name = "inputm") Integer commentId,
			Model m) {
		
		ProgramCommentBean pBean = bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList = new ArrayList<ProgramCommentBean>();
		pList.add(pBean);
		
		bDao.deleteComment(commentId);

		return pList;
	}

	@PostMapping(path = { "/BackStageDeleteCommentByMember" })
	public @ResponseBody java.util.List<ProgramCommentBean> DeleteCommentByMember(
			@RequestParam(name = "inputm") Integer commentMemberId,
			@RequestParam(name = "inputP") Integer commentPodcasterId, Model m) {
		
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByMember(commentMemberId, commentPodcasterId);

		bDao.deleteCommentByMember(commentMemberId, commentPodcasterId);


		return pList;
	}
}
