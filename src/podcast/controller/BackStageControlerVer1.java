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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import antlr.collections.List;
import podcast.model.dao.BackStageDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;

@Controller
public class BackStageControlerVer1 {
	
	
	
	//YYYYBack 2 Select==========================================================================================
	@RequestMapping(path= {"/BackToSelect.controller"},method=RequestMethod.GET)
	public String BackToSelect() {
		return "/BackStage/BackStageSelect";
		
	}
	
	//Member Function==========================================================================================
	
	@RequestMapping(path= {"/BackStageSelectMember.controller"},method=RequestMethod.GET)
	public String selectMember(HttpServletRequest request,@RequestParam(name="selectmemberId")int memberId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao= (BackStageDAO) context.getBean("BackStageDAO");
		MemberBean mBean=bDao.selectMember(memberId);
		java.util.List<MemberBean> mList=new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList",mList);
		
		return "/BackStage/BackStageMemberResult";
	}
	
	@RequestMapping(path= {"/BackStageSelectMemberByAccount.controller"},method=RequestMethod.GET)
	public String selectMemberByAccount(HttpServletRequest request,@RequestParam(name="account")String account,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao= (BackStageDAO) context.getBean("BackStageDAO");
		MemberBean mBean=bDao.selectMemberByAccount(account);
		java.util.List<MemberBean> mList=new ArrayList<MemberBean>();
		mList.add(mBean);
		m.addAttribute("mList",mList);
		
		return "/BackStage/BackStageMemberResult";
	}
	
	@RequestMapping(path= {"/BackStageDeleteMember.controller"},method=RequestMethod.GET)
	public String DeleteMember(HttpServletRequest request,@RequestParam(name="deletememberId")int memberId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao= (BackStageDAO) context.getBean("BackStageDAO");
		bDao.deleteMember(memberId);
		m.addAttribute("msg","Member Deleted!");
		return "/BackStage/BackStageSelect";
		
	}
	
	//OrderTicketFunction=================================================================================
	
	@RequestMapping(path= {"/BackStageSelectOrderById.controller"},method=RequestMethod.GET)
	public String selectOrderById(HttpServletRequest request,@RequestParam(name="orderId")int orderId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		OrderTicketBean oBean=bDao.selectOrderById(orderId);
		java.util.List<OrderTicketBean> oList=new ArrayList<OrderTicketBean>();
		oList.add(oBean);
		m.addAttribute("oList",oList);

		return "/BackStage/BackStageOrderTicketResult";
	}
	
	@RequestMapping(path= {"/BackStageSelectOrderByMember.controller"},method=RequestMethod.GET)
	public String selectOrderByMember(HttpServletRequest request,@RequestParam(name="memberId")int memberId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByMember(memberId);
		m.addAttribute("oList",oList);

		return "/BackStage/BackStageOrderTicketResult";
	}
	
	@RequestMapping(path= {"/BackStageSelectOrderByActivity.controller"},method=RequestMethod.GET)
	public String selectOrderByActivity(HttpServletRequest request,@RequestParam(name="activityId")int activityId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<OrderTicketBean> oList = bDao.selectOrderByActivity(activityId);
		m.addAttribute("oList",oList);

		return "/BackStage/BackStageOrderTicketResult";
	}
	
	//programComment Function=============================================================================
	
	@RequestMapping(path= {"/BackStageSelectCommentById.controller"},method=RequestMethod.GET)
	public String SelectCommentByID(HttpServletRequest request,@RequestParam(name="commentId")int commentId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		ProgramCommentBean pBean=bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList=new ArrayList<ProgramCommentBean>();
		pList.add(pBean);
		m.addAttribute("pList",pList);
		
		return "/BackStage/BackStageCommentResult";
	}
	
	@RequestMapping(path= {"/BackStageSelectCommentByMember.controller"},method=RequestMethod.GET)
	public String SelectCommentByMember(HttpServletRequest request,@RequestParam(name="commentmemberId")int commentmemberId,
			@RequestParam(name="commentpodcasterId")int commentpodcasterId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList=bDao.selectCommentByMember(commentmemberId,commentpodcasterId);
		m.addAttribute("pList",pList);
		
		
		return"/BackStage/BackStageCommentResult";
	}
	
	@RequestMapping(path= {"/BackStageSelectCommentByPodcaster.controller"},method=RequestMethod.GET)
	public String SelectCommentByPodcaster(HttpServletRequest request,@RequestParam(name="commentpodcasterId")int commentpodcasterId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao=(BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList=bDao.selectCommentByPodcaster(commentpodcasterId);
		m.addAttribute("pList",pList);
		
		
		return "/BackStage/BackStageCommentResult";
	}
	
	@RequestMapping(path= {"/BackStageDeleteCommentById.controller"},method=RequestMethod.GET)
	public String DeleteCommentById(HttpServletRequest request,@RequestParam(name="commentId")int commentId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao= (BackStageDAO) context.getBean("BackStageDAO");
		ProgramCommentBean pBean=bDao.selectCommentById(commentId);
		ArrayList<ProgramCommentBean> pList=new ArrayList<ProgramCommentBean>();
		pList.add(pBean);
		m.addAttribute("pList",pList);
		m.addAttribute("deletedCommentId", commentId);
		m.addAttribute("deleteCommentMsg","Comment Deleted!");
		
		bDao.deleteComment(commentId);
		
		return "/BackStage/BackStageCommentResult";
	}
	
	@RequestMapping(path= {"/BackStageDeleteCommentByMember.controller"},method=RequestMethod.GET)
	public String DeleteCommentByMember(HttpServletRequest request,@RequestParam(name="commentMemberId")int commentMemberId,
			@RequestParam(name="commentPodcasterId")int commentPodcasterId,Model m) {
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		BackStageDAO bDao= (BackStageDAO) context.getBean("BackStageDAO");
		java.util.List<ProgramCommentBean> pList=bDao.selectCommentByMember(commentMemberId,commentPodcasterId);
		m.addAttribute("pList",pList);
		bDao.deleteCommentByMember(commentMemberId,commentPodcasterId);
		m.addAttribute("deleteCommentByMemberMsg","Comments Deleted!");
		
		return "/BackStage/BackStageCommentResult";
	}
	
	//CategoryWRYYYYYYY=====================================================================================
	
	//測試RickyLee3
	
}
