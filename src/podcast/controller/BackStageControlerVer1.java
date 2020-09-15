package podcast.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import antlr.collections.List;
import podcast.model.dao.BackStageDAO;
import podcast.model.dao.CategoryDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;

@Controller
public class BackStageControlerVer1 {

	//BackStage Login=======================================================================================================
	
	@PostMapping(path= {"/BackStageLogin.controller"})
	public String BackStageLogin(
			@RequestParam(name="userName")String userName,
			@RequestParam(name="password")String password,
			Model m) {
		if(userName.equals("test123")&&password.equals("pass123")) {
			return "/BackStage/BackStageSelect";
		}
		
		m.addAttribute("LoginErrorMsg","請輸入正確帳號密碼!");
		return "/BackStage/BackStageLogin";
	}
	
	
	// Back 2 Select==========================================================================================
	@GetMapping(path = { "/BackToSelect.controller" })
	public String BackToSelect() {
		return "/BackStage/BackStageSelect";

	}

	// Member
	// Function==========================================================================================

	@PostMapping(path = { "/BackStageSelectMember.controller" })
	public String selectMember(HttpServletRequest request, @RequestParam(name = "selectmemberId") int memberId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		MemberBean mBean = bDao.selectMember(memberId);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);

		return "/BackStage/BackStageMemberResult";
	}

	@PostMapping(path = { "/BackStageSelectMemberByAccount.controller" })
	public String selectMemberByAccount(HttpServletRequest request, @RequestParam(name = "account") String account,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		MemberBean mBean = bDao.selectMemberByAccount(account);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);

		return "/BackStage/BackStageMemberResult";
	}

	@PostMapping(path = { "/BackStageDeleteMember.controller" })
	public String DeleteMember(HttpServletRequest request, @RequestParam(name = "deletememberId") int memberId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		MemberBean mBean = bDao.selectMember(memberId);
		java.util.List<MemberBean> mList = new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList", mList);
		
		bDao.deleteMember(memberId);
		m.addAttribute("memberDeleteMsg", "Select Member Deleted!");
		return "/BackStage/BackStageMemberResult";

	}

	// OrderTicketFunction=================================================================================

	@PostMapping(path = { "/BackStageSelectOrderById.controller" })
	public String selectOrderById(HttpServletRequest request, @RequestParam(name = "orderId") int orderId, Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		OrderTicketBean oBean = bDao.selectOrderById(orderId);
		java.util.List<OrderTicketBean> oList = new ArrayList<OrderTicketBean>();
		oList.add(oBean);
		m.addAttribute("oList", oList);

		return "/BackStage/BackStageOrderTicketResult";
	}

	@PostMapping(path = { "/BackStageSelectOrderByMember.controller" })
	public String selectOrderByMember(HttpServletRequest request, @RequestParam(name = "memberId") int memberId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByMember(memberId);
		m.addAttribute("oList", oList);

		return "/BackStage/BackStageOrderTicketResult";
	}

	@PostMapping(path = { "/BackStageSelectOrderByActivity.controller" })
	public String selectOrderByActivity(HttpServletRequest request, @RequestParam(name = "activityId") int activityId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByActivity(activityId);
		m.addAttribute("oList", oList);

		return "/BackStage/BackStageOrderTicketResult";
	}

	// programComment
	// Function=============================================================================

	@PostMapping(path = { "/BackStageSelectCommentById.controller" })
	public String SelectCommentByID(HttpServletRequest request, @RequestParam(name = "commentId") int commentId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		ProgramCommentBean pBean = bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList = new ArrayList<ProgramCommentBean>();
		pList.add(pBean);
		m.addAttribute("pList", pList);

		return "/BackStage/BackStageCommentResult";
	}

	@PostMapping(path = { "/BackStageSelectCommentByMember.controller" })
	public String SelectCommentByMember(HttpServletRequest request,
			@RequestParam(name = "commentmemberId") int commentmemberId,
			@RequestParam(name = "commentpodcasterId") int commentpodcasterId, Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByMember(commentmemberId, commentpodcasterId);
		m.addAttribute("pList", pList);

		return "/BackStage/BackStageCommentResult";
	}

	@PostMapping(path = { "/BackStageSelectCommentByPodcaster.controller" })
	public String SelectCommentByPodcaster(HttpServletRequest request,
			@RequestParam(name = "commentpodcasterId") int commentpodcasterId, Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByPodcaster(commentpodcasterId);
		m.addAttribute("pList", pList);

		return "/BackStage/BackStageCommentResult";
	}

	@PostMapping(path = { "/BackStageDeleteCommentById.controller" })
	public String DeleteCommentById(HttpServletRequest request, @RequestParam(name = "commentId") int commentId,
			Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		ProgramCommentBean pBean = bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList = new ArrayList<ProgramCommentBean>();
		pList.add(pBean);
		m.addAttribute("pList", pList);
		m.addAttribute("deletedCommentId", commentId);
		m.addAttribute("deleteCommentMsg", "Comment Deleted!");

		bDao.deleteComment(commentId);

		return "/BackStage/BackStageCommentResult";
	}

	@PostMapping(path = { "/BackStageDeleteCommentByMember.controller" })
	public String DeleteCommentByMember(HttpServletRequest request,
			@RequestParam(name = "commentMemberId") int commentMemberId,
			@RequestParam(name = "commentPodcasterId") int commentPodcasterId, Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList = bDao.selectCommentByMember(commentMemberId, commentPodcasterId);
		m.addAttribute("pList", pList);
		bDao.deleteCommentByMember(commentMemberId, commentPodcasterId);
		m.addAttribute("deleteCommentByMemberMsg", "Comments Deleted!");

		return "/BackStage/BackStageCommentResult";
	}

	// Category=====================================================================================

	@PostMapping(path = { "/BackStageSetNewCategory.controller" })
	public String SetNewCategory(HttpServletRequest request,
			@RequestParam(name = "categoryName") String categoryName,
			Model m) throws Exception {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		boolean testify = bDao.setNewCategory(categoryName);
		if (testify == false) {
			m.addAttribute("SetnewCatError", "Category already exist!");
			
			return "/BackStage/BackStageSelect";
		}
		CategoryDAO cDao=(CategoryDAO) context.getBean("CategoryDAO");
		java.util.List<CategoryBean> cList = cDao.selectAll();
		m.addAttribute("cList",cList);
		m.addAttribute("SetNewCatSuccessMsg","New Category At bottom");
		return "/BackStage/BackStageCategoryResult";
	}

	@PostMapping(path = { "/BackStageUpdateCategoryById.controller" })
	public String UpdateCayegory(HttpServletRequest request, 
			@RequestParam(name = "categoryNewName") String categoryNewName,
			@RequestParam(name="categoryId")int categoryId,
			Model m) throws Exception {

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		// cBean=(CategoryBean) context.getBean("CategoryBean");
		CategoryBean cBean = new CategoryBean();
		CategoryDAO cDao=(CategoryDAO) context.getBean("CategoryDAO");
		
		java.util.List<CategoryBean> cList=new ArrayList<CategoryBean>();
		CategoryBean beforeUpdate=cDao.select(categoryId);
		
		cList.add(beforeUpdate);
		cBean.setCategoryId(categoryId);
		cBean.setCategoryName(categoryNewName);
		cList.add(cBean);
		boolean updateStatus=bDao.updateCategory(categoryId, cBean);
		
		if(updateStatus==false) {
			m.addAttribute("updateCategoryError","Category intended to upgrade doesn't exist!");
			return "/BackStage/BackStageSelect";
		}
		m.addAttribute("cList",cList);
		m.addAttribute("UpdateSuccessMsg","Update Result Old To New");
		return "/BackStage/BackStageCategoryResult";
	}
	
	//Subscription=====================================================================================
	
	@PostMapping(path = { "/SelectSubscriptionByMember.controller" })
	public String SelectSubscriptionByMember(HttpServletRequest request,
			@RequestParam(name = "memberId") int memberId,
			Model m) throws Exception {
		

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		java.util.List<SubscriptionBean> sList = bDao.selectSubscriptionByMember(memberId);
		m.addAttribute("sList",sList);
		m.addAttribute("SubResult","Subscription Select Result");
		
		return "/BackStage/BackStageSubscriptionResult";
	}
	
	@PostMapping(path = { "/SelectSubscriptionByPodcaster.controller" })
	public String SelectSubscriptionByPodcaster(HttpServletRequest request,
			@RequestParam(name = "podcasterId") int podcasterId,
			Model m) throws Exception {
		

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		java.util.List<SubscriptionBean> sList = bDao.selectSubscriptionByPodcaster(podcasterId);
		m.addAttribute("sList",sList);
		m.addAttribute("SubResult","Subscription Select Result");
		
		return "/BackStage/BackStageSubscriptionResult";
	}
	
	//Activity==========================================================================================

	@PostMapping(path = { "/SelectActivityById.controller" })
	public String SelectActivityById(HttpServletRequest request,
			@RequestParam(name = "activityId") int activityId,
			Model m) throws Exception {
			
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		ActivityBean aBean=bDao.selectActivity(activityId);
		java.util.List<ActivityBean> aList = new ArrayList<ActivityBean>();
		aList.add(aBean);
		m.addAttribute("aList",aList);
		m.addAttribute("ActResult","Activity Select Result");
		
		return "/BackStage/BackStageActivityResult";
		
	}
	
	@PostMapping(path = { "/SelectActivityByPodcaster.controller" })
	public String SelectActivityByPodcaster(HttpServletRequest request,
			@RequestParam(name = "podcasterId") int podcasterId,
			Model m) throws Exception {
			
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		java.util.List<ActivityBean> aList=bDao.selectActivityByPodcaster(podcasterId);
		m.addAttribute("aList",aList);
		m.addAttribute("ActResult","Activity Select Result");
		
		return "/BackStage/BackStageActivityResult";
		
	}
	
	@PostMapping(path = { "/SelectActivityByDate.controller" })
	public String SelectActivityByDate(HttpServletRequest request,
			@RequestParam(name = "activityDate") String activityDate,
			Model m) throws Exception {
			
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		Date date;
		java.util.List<ActivityBean> aList=new ArrayList<ActivityBean>();
		try {
			date=Date.valueOf(activityDate);
			aList=bDao.selectActivitybyDate(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
			
			m.addAttribute("aList",aList);
			m.addAttribute("ActResult","Activity Select Result");
			
			return "/BackStage/BackStageActivityResult";
	}
	
	@PostMapping(path = { "/DeleteActivityByID.controller" })
	public String DeleteActivityById(HttpServletRequest request,
			@RequestParam(name = "activityId") int activityId,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		ActivityBean aBean=bDao.selectActivity(activityId);
		java.util.List<ActivityBean> aList = new ArrayList<ActivityBean>();
		aList.add(aBean);
		m.addAttribute("aList",aList);
		m.addAttribute("ActResult","Select Activity Deleted!");
		bDao.deleteActivity(activityId);
		
		return "/BackStage/BackStageActivityResult";
	}
	
	//BrowsingHistory====================================================================================
	
	@PostMapping(path = { "/SelectHistoryById.controller" })
	public String SelectHistoryById(HttpServletRequest request,
			@RequestParam(name = "historyId") int historyId,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		HistoryBean hBean=bDao.selectHistoryById(historyId);
		java.util.List<HistoryBean> hList = new ArrayList<HistoryBean>();
		hList.add(hBean);
		m.addAttribute("hList",hList);
		m.addAttribute("HistoryResult","History Select Result");
		
		return "/BackStage/BackStageHistoryResult";
	}
	
	@PostMapping(path = { "/SelectHistoryByMember.controller" })
	public String SelectHistoryByMember(HttpServletRequest request,
			@RequestParam(name = "memberId") int memberId,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		java.util.List<HistoryBean> hList = bDao.selectHistoryByMember(memberId);
		m.addAttribute("hList",hList);
		m.addAttribute("HistoryResult","History Select By Member Result");
		
		return "/BackStage/BackStageHistoryResult";
	}

	@PostMapping(path = { "/SelectHistoryByPodcaster.controller" })
	public String SelectHistoryByPodcaster(HttpServletRequest request,
			@RequestParam(name = "podcasterId") int podcasterId,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		
		java.util.List<HistoryBean> hList = bDao.selectHistoryByPodcaster(podcasterId);
		m.addAttribute("hList",hList);
		m.addAttribute("HistoryResult","History Select By Podcaster Result");
		
		return "/BackStage/BackStageHistoryResult";
	}
	

	@PostMapping(path = { "/SelectHistoryByLastListen.controller" })
	public String SelectHistoryByLastListen(HttpServletRequest request,
			@RequestParam(name = "historyLastListen") String lastListen,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		Date date;
		java.util.List<HistoryBean> hList=new ArrayList<HistoryBean>();
		
		try {
			date=Date.valueOf(lastListen);
			hList = bDao.selectHistoryByLastListen(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
		
		m.addAttribute("hList",hList);
		m.addAttribute("HistoryResult","History Select By LastListen Result");
		
		return "/BackStage/BackStageHistoryResult";
	}
	
	@PostMapping(path = { "/DeleteHistoryByDate.controller" })
	public String DeleteHistoryByDate(HttpServletRequest request,
			@RequestParam(name = "historyDeleteDate") String deleteDate,
			Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		Date date;
		
		try {
			date=Date.valueOf(deleteDate);
			bDao.deleteHistoryByDate(date);
		}catch(IllegalArgumentException e){
			//do nothing
		}
		
		m.addAttribute("HistoryResult","History Before "+deleteDate+" Has Been Deleted!");
		
		return "/BackStage/BackStageHistoryResult";
	}
	
	//Money Calculating====================================================================================
	
	@PostMapping(path = { "/SubscriptionIncome.controller" })
	public  String SubscriptionIncome(HttpServletRequest request,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate,
			Model m) {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		Date startdate;
		Date enddate;
		Integer subIncome=null;
		
		try {
			startdate=Date.valueOf(startDate);
			enddate=Date.valueOf(endDate);
			subIncome=bDao.SubscriptionIncome(startdate, enddate);
		}catch(IllegalArgumentException e) {
			//do nothing
		}
		
		m.addAttribute("startDate",startDate);
		m.addAttribute("endDate",endDate);
		m.addAttribute("income", subIncome);
		m.addAttribute("incomeMsg","Subscription Income");
		
		return "/BackStage/BackStageIncomeResult";
	}
	

	@PostMapping(path = { "/TicketIncome.controller" })
	public  String TicketIncome(HttpServletRequest request,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate,
			Model m) {
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		BackStageDAO bDao = (BackStageDAO) context.getBean("BackStageDAO");
		Date startdate; 
		Date enddate;
		Integer subIncome=null;
		
		try {
			startdate=Date.valueOf(startDate);
			enddate=Date.valueOf(endDate);
			subIncome=bDao.TicketIncome(startdate, enddate);
		}catch(IllegalArgumentException e){
			//do nothing
		}
		
		m.addAttribute("startDate",startDate);
		m.addAttribute("endDate",endDate);
		m.addAttribute("income", subIncome);
		m.addAttribute("incomeMsg","Ticket Income");
		
		return "/BackStage/BackStageIncomeResult";
	}
	
}
