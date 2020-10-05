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
import podcast.model.dao.LikeRecordDAO;
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
	@Autowired
	private LikeRecordDAO ldao;
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
			Model m) throws Exception {
		
		MemberBean mBean = bDao.selectMember(memberId);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);
		
		bDao.deleteMember(memberId);
		ldao.deleteByPodcasterId(memberId);
		hDao.deleteByPodcasterId(memberId);
		aDao.deleteByPodcasterId(memberId);
		uDao.deleteByPodcasterId(memberId);
		pDao.deleteByMemberIdAndPublisherId(memberId);
		
		
		m.addAttribute("memberDeleteMsg", "Select Member Deleted!");
		return mList;

	}

//TicketOrder AJAX Function============================================
	
	@PostMapping(path = { "/BackStageSelectOrderById" })
	public @ResponseBody java.util.List<OrderTicketBean> selectOrderById(HttpServletRequest request, @RequestParam(value = "input") Integer orderId, Model m) {
		
		java.util.List<OrderTicketBean> oList = bDao.selectOrderById(orderId);
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
	
	
//Category AJAX Function==========================================================
	
	@PostMapping(path = { "/BackStageSetNewCategory" })
	public @ResponseBody java.util.List<CategoryBean> SetNewCategory(@RequestParam(name = "inputo") String categoryName,
			Model m) throws Exception {
		
		boolean testify = bDao.setNewCategory(categoryName);
		if (testify == false) {
			
			java.util.List<CategoryBean> cList = new ArrayList<CategoryBean>();
			return cList;
		}
		
		java.util.List<CategoryBean> cList = cDao.selectAll();
		return cList;
	}

	@PostMapping(path = { "/BackStageUpdateCategoryById" })
	public @ResponseBody java.util.List<CategoryBean> UpdateCayegory(
			@RequestParam(name = "inputn") String categoryNewName,
			@RequestParam(name="inputo")Integer categoryId,
			Model m) throws Exception {

		CategoryBean cBean = new CategoryBean();
		cBean.setCategoryId(categoryId);
		cBean.setCategoryName(categoryNewName);
		bDao.updateCategory(categoryId, cBean);
		java.util.List<CategoryBean> cList=cDao.selectAll();
		
		return cList;
	}
	
	//Subscription Function===============================================================
	
	@PostMapping(path = { "/SelectSubscriptionByMember" })
	public @ResponseBody java.util.List<SubscriptionBean> SelectSubscriptionByMember(
			@RequestParam(name = "input") Integer memberId,
			Model m) throws Exception {
		
		
		java.util.List<SubscriptionBean> sList = bDao.selectSubscriptionByMember(memberId);
		
		return sList;
	}
	
	@PostMapping(path = { "/SelectSubscriptionByPodcaster" })
	public @ResponseBody java.util.List<SubscriptionBean> SelectSubscriptionByPodcaster(
			@RequestParam(name = "input") Integer podcasterId,
			Model m) throws Exception {
	
		java.util.List<SubscriptionBean> sList = bDao.selectSubscriptionByPodcaster(podcasterId);
		return sList;
	}
	
//Activity Function=======================================================
	
	@PostMapping(path = { "/SelectActivityById" })
	public @ResponseBody java.util.List<ActivityBean> SelectActivityById(
			@RequestParam(name = "input") Integer activityId,
			Model m) throws Exception {
			
		ActivityBean aBean=bDao.selectActivity(activityId);
		java.util.List<ActivityBean> aList = new ArrayList<ActivityBean>();
		aList.add(aBean);

		
		return aList;
		
	}
	
	@PostMapping(path = { "/SelectActivityByPodcaster" })
	public @ResponseBody java.util.List<ActivityBean> SelectActivityByPodcaster(
			@RequestParam(name = "input") Integer podcasterId,
			Model m) throws Exception {
			
		java.util.List<ActivityBean> aList=bDao.selectActivityByPodcaster(podcasterId);
		return aList;
		
	}
	
	@PostMapping(path = { "/SelectActivityByDate" })
	public @ResponseBody java.util.List<ActivityBean> SelectActivityByDate(
			@RequestParam(name = "input") String activityDate,
			Model m) throws Exception {
			
		Date date;
		java.util.List<ActivityBean> aList=new ArrayList<ActivityBean>();
		try {
			date=Date.valueOf(activityDate);
			aList=bDao.selectActivitybyDate(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
			
			return aList;
	}
	
	@PostMapping(path = { "/DeleteActivityByID" })
	public @ResponseBody java.util.List<ActivityBean> DeleteActivityById(
			@RequestParam(name = "input") Integer activityId,
			Model m) throws Exception {
		
		ActivityBean aBean=bDao.selectActivity(activityId);
		java.util.List<ActivityBean> aList = new ArrayList<ActivityBean>();
		aList.add(aBean);
		bDao.deleteActivity(activityId);
		
		return aList;
	}
	
//Browsing History======================================================================
	
	@PostMapping(path = { "/SelectHistoryById" })
	public @ResponseBody java.util.List<HistoryBean> SelectHistoryById(
			@RequestParam(name = "input") Integer historyId,
			Model m) throws Exception {
		
		HistoryBean hBean=bDao.selectHistoryById(historyId);
		java.util.List<HistoryBean> hList = new ArrayList<HistoryBean>();
		hList.add(hBean);
		return hList;
	}
	
	@PostMapping(path = { "/SelectHistoryByMember" })
	public @ResponseBody java.util.List<HistoryBean> SelectHistoryByMember(
			@RequestParam(name = "input") Integer memberId,
			Model m) throws Exception {
		
		java.util.List<HistoryBean> hList = bDao.selectHistoryByMember(memberId);
		
		return hList;
	}

	@PostMapping(path = { "/SelectHistoryByPodcaster" })
	public  @ResponseBody java.util.List<HistoryBean> SelectHistoryByPodcaster(
			@RequestParam(name = "input") Integer podcasterId,
			Model m) throws Exception {
		
		java.util.List<HistoryBean> hList = bDao.selectHistoryByPodcaster(podcasterId);

		return hList;
	}
	

	@PostMapping(path = { "/SelectHistoryByLastListen" })
	public @ResponseBody java.util.List<HistoryBean> SelectHistoryByLastListen(
			@RequestParam(name = "input") String lastListen,
			Model m) throws Exception {
		
		Date date;
		java.util.List<HistoryBean> hList=new ArrayList<HistoryBean>();
		try {
			date=Date.valueOf(lastListen);
			hList = bDao.selectHistoryByLastListen(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
		return hList;
	}
	
	@PostMapping(path = { "/DeleteHistoryByDate" })
	public @ResponseBody java.util.List<HistoryBean> DeleteHistoryByDate(
			@RequestParam(name = "input") String deleteDate,
			Model m) throws Exception {
		
		Date date;
		java.util.List<HistoryBean> hList=new ArrayList<HistoryBean>();
		try {
			date=Date.valueOf(deleteDate);
			hList=bDao.deleteHistoryByDate(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
		//已經改寫DAO，但是要看看是否有效
		return hList;
	}
	
//Podcast Function========================================================
	
	@PostMapping(path= {"/SelectPodcastByMember"})
	public @ResponseBody java.util.List<uploadPodcastBean> SelectPocastByMember(@RequestParam(name="input")Integer memberId,
										Model m) {
		java.util.List<uploadPodcastBean> uList = bDao.selectPodcastByMember(memberId);	
		return uList;
		
	}
	
	@PostMapping(path= {"/DeletePodcastbyId"})
	public @ResponseBody java.util.List<uploadPodcastBean> DeletePodcastById(@RequestParam(name="input")Integer podcastId,
									Model m) throws Exception {
		
		uploadPodcastBean uBean = uDao.select(podcastId);
		java.util.List<uploadPodcastBean> uList = new ArrayList<uploadPodcastBean>();
		uList.add(uBean);
		m.addAttribute("PodcastResult","Select Podcast Deleted!");
		bDao.deletePodcast(podcastId);
		hDao.deleteByPodcastId(podcastId);
		ldao.detelePodcastId(podcastId);
		
		return uList;
	}
	
	@PostMapping(path= {"/TopPodcst"})
	public @ResponseBody java.util.List<uploadPodcastBean> TopPodcast(@RequestParam(name="input")String uploadTime,
							 Model m) {
		
		Date date;
		java.util.List<uploadPodcastBean> uList=new ArrayList<uploadPodcastBean>();
		try {
			date=Date.valueOf(uploadTime);
			uList=bDao.topPodcast(date);
			
		}catch(IllegalArgumentException e){
			//do nothing
		}
		return uList;
	}
	
//Income Calculate=============================================================
	
	@PostMapping(path = { "/SubscriptionIncome" })
	public  @ResponseBody ArrayList<String> SubscriptionIncome(
			@RequestParam(name = "inputS") String startDate,
			@RequestParam(name = "inputE") String endDate,
			Model m) {
		
		Date startdate;
		Date enddate;
		Integer subIncome=null;
		ArrayList<String> iList=new ArrayList<String>();
		try {
			startdate=Date.valueOf(startDate);
			enddate=Date.valueOf(endDate);
			subIncome=bDao.SubscriptionIncome(startdate, enddate);
			iList.add(startDate);
			iList.add(endDate);
			iList.add(subIncome.toString());
		}catch(IllegalArgumentException e) {
			//do nothing
		}		
		return iList;
	}
	

	@PostMapping(path = { "/TicketIncome" })
	public   @ResponseBody ArrayList<String> TicketIncome(
			@RequestParam(name = "inputS") String startDate,
			@RequestParam(name = "inputE") String endDate,
			Model m) {
		Date startdate; 
		Date enddate;
		Double subIncome=0.0;
		ArrayList<String> iList=new ArrayList<String>();
		try {
			startdate=Date.valueOf(startDate);
			enddate=Date.valueOf(endDate);
			subIncome=bDao.TicketIncome(startdate, enddate);
			iList.add(startDate);
			iList.add(endDate);
			iList.add(subIncome.toString());
		}catch(IllegalArgumentException e){
			//do nothing
		}

		return iList;
	}
	
}
