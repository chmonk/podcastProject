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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.ProgramCommentDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.ProgramCommentBean;

@Controller
@SessionAttributes({ "LoginOK"})
public class CommentController {

	//按下頻道圖案=送出action,連到此方法
	@RequestMapping(path = "/podcastPage", method = RequestMethod.POST)
	public String showPodcastPage(HttpServletRequest request,Model m) throws Exception {
		
		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		 if (memberBean == null) {
				m.addAttribute("errorMsg", "請登入播客會員");
				return "redirect:/login";
		}	
		else {	
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
		
		Integer podcasterId=5;//暫定
		List<ProgramCommentBean> commList=commDao.selectAllPodcasterId(podcasterId);
		m.addAttribute("commList",commList);
		request.setAttribute("commList", commList);
		
		return "/PodcastPage/PodcastPage";
		}
	}
		
	@PostMapping("podcastPage.do")
	public String processComment(@RequestParam("content") String commentMsg,
		 HttpServletRequest request, Model m) throws Exception {
	

	
		ProgramCommentBean pBean =new ProgramCommentBean();

    	Timestamp time= new Timestamp(System.currentTimeMillis());

		
		pBean.setCommentMsg(commentMsg);
		pBean.setMsgDate(time);
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
		commDao.insert(pBean);
		return "/PodcastPage/PodcastPage";
	}
	
	
	//刪除
	@PostMapping(path= {"/processDeleteComment"})
	public String ProcessDeleteComment( HttpServletRequest request,
						Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
    	Integer commentId=1;
    	commDao.delete(commentId);
		
		return "/PodcastPage/PodcastPage";
	}
}
