package podcast.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.MemberDAO;
import podcast.model.dao.SubProgramListDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.fuzzyPodcastReturnArchitecture;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({"LoginOK","thisPodcasterId","subscriptionPermission"})
@RequestMapping(path = { "/AfterSubProgram.controller" })
public class AfterSubProgram {


	@RequestMapping(method = RequestMethod.GET)
		public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
	    	
	    	//取得註冊物件的context
	    	ServletContext app = request.getServletContext();
	    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
//	    	
//	    	 List<uploadPodcastBean> a = (List<uploadPodcastBean>)request.getSession().getAttribute("subProgram");
//	    	 List<uploadPodcastBean> needSub = (List<uploadPodcastBean>)request.getSession().getAttribute("needSub");
//	    	int subscriptionPermission = (int) request.getSession().getAttribute("subscriptionPermission");
//	    	 
	    	System.out.println("-------確認抓到的播客ID---------");
	    	//System.out.println((List<uploadPodcastBean>)request.getSession().getAttribute("subProgram"));
	    	System.out.println(m.getAttribute("thisPodcasterId"));
	    	System.out.println("-------確認抓到的播客ID---------");
	    	
	    	Date date = new Date();
	    	Calendar date2 = Calendar.getInstance(); //Calendar方法 用於計算DATE的加減
	    	date2.add(Calendar.MONTH, +1);
	    	Date date3 = date2.getTime(); //需轉換回DATE屬性 以符合setSubdateEnd的屬性    	
	    	   	
	    	SubProgramListDAO sdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
	    	MemberBean loginMember =(MemberBean)m.getAttribute("LoginOK");
	    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
	    	

	    	String ResponseCode = (String) request.getSession().getAttribute("ResponseCode");
	    	if((int) m.getAttribute("subscriptionPermission")==0) {
	    		if(ResponseCode.equals("00")) {
		    	SubscriptionBean q = new SubscriptionBean();
		    	q.setMemberId(loginMember.getMemberId()); //訂閱者ID
		    	q.setMonthlyPayment(mdao.selectPodcaster((Integer)m.getAttribute("thisPodcasterId")).getMonthlyPayment());
		    	q.setSubdateStart(date);
		    	q.setSubdateEnd(date3);
		    	q.setPodcasterId((Integer)m.getAttribute("thisPodcasterId")); //播客ID
		    	q.setReceipt(mdao.selectPodcaster((Integer)m.getAttribute("thisPodcasterId")).getNickname());
		    	q.setCreditCardNumber("4938-1701-3000-0003");    	
		    	sdao.insert(q);	
		    	int subscriptionPermission = 1;     //將訂閱權限更改為已訂閱
		    	m.addAttribute("subscriptionPermission", subscriptionPermission);
	    		}		
	    	}
	    	List<SubscriptionBean> subRecord=sdao.selectBySubMemeberId(loginMember.getMemberId());
	    	m.addAttribute("subRecord", subRecord);
	    	
	return "Comment/showPodcaster";
}
}