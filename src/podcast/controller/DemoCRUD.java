package podcast.controller;

import java.util.ArrayList;
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

import me.xdrop.fuzzywuzzy.FuzzySearch;
import me.xdrop.fuzzywuzzy.model.ExtractedResult;
import podcast.model.dao.ActivityDAO;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.SubscriptionDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.SubscriptionBean;


//for test server 
@Controller
@SessionAttributes(names= {"msg"})
@RequestMapping(path = { "/demoCRUD.controller" })
public class DemoCRUD {
    @RequestMapping(method = RequestMethod.GET)
	public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
    	
    	//取得註冊物件的context
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	SubscriptionDAO sdao = (SubscriptionDAO)context.getBean("SubscriptionDAO");
    	SubscriptionBean hhh = new SubscriptionBean();
    	
    	hhh.setSubdateStart(null);
    	hhh.setSubdateEnd(null);
    	hhh.setMonthlyPayment(100);
    	hhh.setMemberId(1);
    	hhh.setPodcasterId(20);
    	
    	
    	sdao.insert(hhh);
    	
//    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
//    	List<MemberBean> userAllData = mdao.fuzzySelectPodcasterAll();
//    	List<MemberBean> fuzzyUserData = new ArrayList<MemberBean>();
//    	List<String> a = new ArrayList<String>();
//    	for(MemberBean i:userAllData) {
//    		a.add(i.getNickname());	
//    	}
//    	List<ExtractedResult> container = FuzzySearch.extractSorted(condition, a);
//    	List<ExtractedResult> container = FuzzySearch.extractSorted(request.getParameter("selectCondition"), a);
//    	System.out.println(userAllData);
//    	System.out.println(container);
//    	for(ExtractedResult e:container) {
//    		if(e.getScore()>0) {  
//    			fuzzyUserData.add(userAllData.get(e.getIndex()));
//    		}
//    	}
//    	System.out.println(fuzzyUserData);
    	//ActivityDAO ,以下測資
    	//insert into activity(activityName,activityDate,activityContent,activityLocation,podcasterId,activityPrice,activityMaxPeople,activityMinPeople,activityStatus) values('party',GETDATE(),'go to bookstore','bookstore',15,500,300,15,1)
//    	ActivityDAO adao = (ActivityDAO)context.getBean("ActivityDAO");
//    	List<ActivityBean> a = adao.selectAll();
//    	
//    	for(ActivityBean i:a) {
//    		System.out.println(i.getActivityDate());
//    	}
    	
    	//CategoryDAO,以下測資
    	//insert into category (categoryName) values('happyprogram')
//    	CategoryDAO cdao = (CategoryDAO)context.getBean("CategoryDAO");
//    	List<CategoryBean> c = cdao.selectAll();
//    	
//    	for(CategoryBean i:c) {
//    		System.out.println(i.getCategoryName());
//    	}
//    	
    	
		m.addAttribute("msg","You got mail!");
		return "/success";
	}
}
