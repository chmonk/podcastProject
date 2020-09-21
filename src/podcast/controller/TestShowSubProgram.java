package podcast.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.ActivityDAO;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.HistoryDao;
import podcast.model.dao.SubProgramListDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;


//for test server 
@Controller
@SessionAttributes(names={"subProgram","needSub","upLoadProgram"})
@RequestMapping(path = { "/showPaymentProgram.controller" })
public class TestShowSubProgram {
    @RequestMapping(method = RequestMethod.GET)
	public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
    	
    	//取得註冊物件的context
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	

    	

		
    	
    	//用訂單列表SUBCRIPTION取得會員帳號與訂閱的播客。判斷訂閱時間是否過期
    	int procasterNumber = 0;

    	Date date =new Date();
    	SubProgramListDAO fdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
    	
    	List<SubscriptionBean> f = fdao.selectSubcriptionByMemberID(1, 18);
    	if(f.isEmpty()) {
    		SubProgramListDAO sdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
        	List<uploadPodcastBean> needSub = sdao.selectByMemeberId(18);
        	m.addAttribute("needSub", needSub);
        	System.out.println("need="+needSub);
    		
    	}
    	
    	System.out.println("--------------------------------");
    	
    	System.out.println(f);
    	System.out.println("--------------------------------");
    	for(SubscriptionBean g:f) {
    	
    		if(g.getSubdateEnd().compareTo(date)==1) {
    			System.out.println("會員"+g.getMemberId()+"在"+g.getPodcasterId()+"的訂閱期間內");
    			procasterNumber =g.getPodcasterId();
    			
    			System.out.println(procasterNumber);
    		}else if(g.getSubdateEnd().compareTo(date)==-1) {
    			System.out.println("已過期");
    		}
    		System.out.println("會員ID: "+g.getMemberId());
    		System.out.println("節目ID: "+g.getPodcasterId());
    		System.out.println("日期比較: "+g.getSubdateEnd().compareTo(date));
    	}
    	System.out.println("-----------------------------------------------");
    	System.out.println("現在時間: "+date);
    	m.addAttribute("upLoadProgram",f);

    	
    	//並於上傳列表中找出該節目
    	
    	
    	
    	SubProgramListDAO sdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
    	List<uploadPodcastBean> s = sdao.selectByMemeberId(procasterNumber);
    	System.out.println(s);
    
//    	for(uploadPodcastBean i:s) {
//    		System.out.println("會員ID: "+i.getMemberId());
//    		System.out.println("節目ID: "+i.getPodcastId());
//    		System.out.println("點擊次數: "+i.getClickAmount());
//    		System.out.println("節目路徑: "+i.getAudioPath());
//    	}
    	
    	//request.getSession().setAttribute("subProgram",s);
    	m.addAttribute("subProgram", s);
	
    	
    	
    	
    	
//    	return null;
		return "/testSubProgram";
	}
    
    
    
}
