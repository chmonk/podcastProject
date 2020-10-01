package podcast.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

import podcast.model.dao.CategoryDAO;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.ProgramCommentDAO;
import podcast.model.dao.SubProgramListDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.fuzzyPodcastReturnArchitecture;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({ "LoginOK" , "thisPodcasterId","subscriptionPermission"})
public class MyCommentController {
	
	@Autowired 
	LikeRecordDAO ldao;

	//按下頻道圖案=送出action,連到此方法
	@RequestMapping(path = "/mypodcastPage", method = RequestMethod.GET)
	public String showPodcastPage(HttpServletRequest request,Model m) throws Exception {
		
		if(m.getAttribute("LoginOK")==null) {
			return "login";
		}
		
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		ProgramCommentDAO commDao = (ProgramCommentDAO) context.getBean("ProgramCommentDAO");
		UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
    	CategoryDAO cdao = (CategoryDAO)context.getBean("CategoryDAO");
    	//判斷podcasterId是否為播客

    	
    	
    	//取得使用者id
    	MemberBean mbean=(MemberBean)m.getAttribute("LoginOK");
    	Integer  memberId =mbean.getMemberId();
    	m.addAttribute("thisMemberId",memberId);
    	
    	

//    	boolean verificationPodcaster = mdao.verificationPodcaster(podcasterId);
//    	if(!verificationPodcaster) {
//    		return "index";
//    	}


		//取得留言資料
		List<ProgramCommentBean> commList=commDao.selectAllPodcasterId(memberId);
		List<Object> commListData = new LinkedList<>();

		for (ProgramCommentBean i : commList) {
			Map<String, Object> commListitem = new HashMap<>();

			commListitem.put("commentId", i.getCommentId());
			commListitem.put("replyDate",i.getReplyDate());
			commListitem.put("replyMsg",i.getReplyMsg());
			commListitem.put("commentMsg",i.getCommentMsg());
			commListitem.put("msgDate",i.getMsgDate());
			commListitem.put("Name", mdao.selectPodcaster(i.getMemberId()).getNickname());
			commListData.add(commListitem);
		}
		
		
		m.addAttribute("commList",commListData);
		request.setAttribute("commList", commListData);
		
		//播客資料
		MemberBean podcasterData = mdao.selectPodcaster(memberId);
		Map<String, Object> showPodcasterData = new HashMap<>();
		showPodcasterData.put("podcastImg", podcasterData.getImage());
		showPodcasterData.put("podcastName", podcasterData.getNickname());
		showPodcasterData.put("podcastInfo", podcasterData.getInfo());
		showPodcasterData.put("podcastId", podcasterData.getMemberId());
		
		m.addAttribute("podcasterData",showPodcasterData);
		request.setAttribute("podcasterData", showPodcasterData);
		
		
		//顯示所有不須訂閱單集
		List<uploadPodcastBean> upList=upDao.selectAllFromMember(memberId);
		ArrayList<fuzzyPodcastReturnArchitecture> PodcastData = new ArrayList<fuzzyPodcastReturnArchitecture>();
		for(uploadPodcastBean e:upList) {
			fuzzyPodcastReturnArchitecture data = new fuzzyPodcastReturnArchitecture();
			data.setAudioImg(e.getAudioimg());
			data.setAudioPath(e.getAudioPath());
			data.setCategoryName(cdao.select(e.getCategoryId()).getCategoryName());
			data.setClickAmount(e.getClickAmount());
			data.setLikesCount(e.getLikesCount());
			data.setOpenPayment(e.getOpenPayment());
			data.setPodcastId(e.getPodcastId());
			data.setPodcastInfo(e.getPodcastInfo());
			data.setTitle(e.getTitle());
			data.setUploadTime(e.getUploadTime());
			data.setLikesStatus(ldao.checkByMemberidAndPodcastIdReturnLikeStatus(memberId, e.getPodcastId()));
			PodcastData.add(data);		
		}
    	m.addAttribute("PodcastData",PodcastData);
    	request.setAttribute("PodcastData", PodcastData);
    	
    	//取得訂閱列表
    	//用訂單列表SUBCRIPTION取得會員帳號與訂閱的播客。判斷訂閱時間是否過期
    	int subscriptionPermission = 0;
    	Date date =new Date();
    	MemberBean loginMember =(MemberBean)request.getSession().getAttribute("LoginOK");
    	SubProgramListDAO fdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
    	  	
    	System.out.println("----------測試是否抓到登入的會員ID-------------------------");
    	System.out.println(loginMember.getMemberId());
    	System.out.println("----------測試是否抓到登入的會員ID---------------------------");
    
    	List<SubscriptionBean> f = fdao.selectSubcriptionByMemberID(loginMember.getMemberId(),memberId);//確認訂單有無訂閱關係
    	if(loginMember.getMemberId()==memberId) {  //如果進入頻道為直播主本人
    		subscriptionPermission = 2;
    	}else if(f.isEmpty()){ //無訂閱關係
    		subscriptionPermission = 0;
    	}else {
        	for(SubscriptionBean g:f) {  	
        		if(g.getSubdateEnd().compareTo(date)==1) {
        			System.out.println("會員"+g.getMemberId()+"在"+g.getPodcasterId()+"的訂閱期間內");
        			subscriptionPermission = 1;
        		}else if(g.getSubdateEnd().compareTo(date)==-1) {
        			subscriptionPermission = 0;
        			System.out.println("已過期");
        		}
        		System.out.println("會員ID: "+g.getMemberId());
        		System.out.println("節目ID: "+g.getPodcasterId());
        		System.out.println("日期比較: "+g.getSubdateEnd().compareTo(date));
        	}
    	}
    	System.out.println(subscriptionPermission);
    	//並於上傳列表中找出該節目
    
    	SubProgramListDAO sdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
    	List<uploadPodcastBean> s = sdao.selectByMemeberId(memberId);
    	ArrayList<fuzzyPodcastReturnArchitecture> subscriptionPodcastData = new ArrayList<fuzzyPodcastReturnArchitecture>();
		for(uploadPodcastBean e:s) {
			fuzzyPodcastReturnArchitecture data = new fuzzyPodcastReturnArchitecture();
			data.setAudioImg(e.getAudioimg());
			data.setAudioPath(e.getAudioPath());
			data.setCategoryName(cdao.select(e.getCategoryId()).getCategoryName());
			data.setClickAmount(e.getClickAmount());
			data.setLikesCount(e.getLikesCount());
			data.setOpenPayment(e.getOpenPayment());
			data.setPodcastId(e.getPodcastId());
			data.setPodcastInfo(e.getPodcastInfo());
			data.setTitle(e.getTitle());
			data.setUploadTime(e.getUploadTime());
			data.setLikesStatus(ldao.checkByMemberidAndPodcastIdReturnLikeStatus(memberId, e.getPodcastId()));
			
			subscriptionPodcastData.add(data);		
		}
    	
		m.addAttribute("payAmount",mdao.selectPodcaster(memberId).getMonthlyPayment());//抓取訂閱播客頻道所需費用，送至前端

    	
    	m.addAttribute("subscriptionPermission", subscriptionPermission);
    	m.addAttribute("subProgram", subscriptionPodcastData);
    	
    	//把PodcasterId送到頻道頁面
		m.addAttribute("thisPodcasterId",memberId);
		//return "Comment/PodcastPage";
		return "Comment/showPodcaster";
		}
}