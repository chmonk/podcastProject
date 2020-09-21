package podcast.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.ProgramCommentDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({ "LoginOK"})
public class CommentController {

	//按下頻道圖案=送出action,連到此方法
	@RequestMapping(path = "/podcastPage", method = RequestMethod.GET)
	public String showPodcastPage(HttpServletRequest request,Model m) throws Exception {
		
		//連接帳號
//		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
//		Integer memberId = memberBean.getMemberId();

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
		
		Integer podcasterId=5;//暫定
		List<ProgramCommentBean> commList=commDao.selectAllPodcasterId(podcasterId);
		m.addAttribute("commList",commList);
		request.setAttribute("commList", commList);
		
		return "Comment/PodcastPage";
		}
	
		
	@PostMapping("/podcastPage.do")
	public @ResponseBody ProgramCommentBean processComment(@RequestParam("content") String commentMsg,
		 HttpServletRequest request, Model m) throws Exception {
		
		//連接帳號
		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		Integer memberId = memberBean.getMemberId();
//		System.out.println("content:"+commentMsg);

	
		ProgramCommentBean pBean =new ProgramCommentBean();

    	Timestamp time= new Timestamp(System.currentTimeMillis());

		
    	pBean.setMemberId(memberId);
		pBean.setCommentMsg(commentMsg);
		pBean.setMsgDate(time);
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
		commDao.insert(pBean);

		
//		Integer podcasterId=5;//暫定
		List<ProgramCommentBean> commList=commDao.selectAllPodcasterId(memberId);
		m.addAttribute("commList",commList);
		request.setAttribute("commList", commList);
		
		
		//return "Comment/PodcastPage";
		return pBean;
	}
	
	
//	//刪除
//	@PostMapping(path= "processDeleteComment")
//	public String ProcessDeleteComment( HttpServletRequest request,
//						Model m,@RequestParam("delCommId")Integer delCommId) throws Exception {
//		
//		//連接帳號
////		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
////		Integer memberId = memberBean.getMemberId();
//		
//		ServletContext app = request.getServletContext();
//    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
//    	ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
//    	
//    	
//    	
//    	commDao.delete(delCommId);
//    	
//    	Integer podcasterId=5;//暫定
//	List<ProgramCommentBean> commList=commDao.selectAllPodcasterId(podcasterId);
//	m.addAttribute("commList",commList);
//	request.setAttribute("commList", commList);
//    	
//		
//		return "Comment/PodcastPage";
//	}
}
