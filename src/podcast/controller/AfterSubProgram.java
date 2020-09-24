package podcast.controller;

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
@RequestMapping(path = { "/AfterSubProgram.controller" })
@SessionAttributes(names={"subProgram","needSub","upLoadProgram"})
public class AfterSubProgram {
	  private SubscriptionBean sbean;


	@RequestMapping(method = RequestMethod.GET)
		public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
	    	
	    	//取得註冊物件的context
	    	ServletContext app = request.getServletContext();
	    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
	    	
	    	 List<uploadPodcastBean> a = (List<uploadPodcastBean>)request.getSession().getAttribute("subProgram");
	    	 List<uploadPodcastBean> needSub = (List<uploadPodcastBean>)request.getSession().getAttribute("needSub");


	    	System.out.println("-------確認抓到的播客ID---------");
	    	System.out.println((List<uploadPodcastBean>)request.getSession().getAttribute("subProgram"));
	    	System.out.println(needSub.get(0).getMemberId());
	    	System.out.println("-------確認抓到的播客ID---------");
	    	
	    

	    	
	    	Date date = new Date();
	    	Calendar date2 = Calendar.getInstance(); //Calendar方法 用於計算DATE的加減
	    	date2.add(Calendar.MONTH, +1);
	    	Date date3 = date2.getTime(); //需轉換回DATE屬性 以符合setSubdateEnd的屬性    	
	    	
	    	
	    	SubProgramListDAO sdao = (SubProgramListDAO)context.getBean("SubProgramListDAO");
	    	MemberBean loginMember =(MemberBean)request.getSession().getAttribute("LoginOK");
	    	MemberDAO podcaster = (MemberDAO)context.getBean("MemberDAO");
	    	MemberBean podcasterChannel = podcaster.selectPodcaster(needSub.get(0).getMemberId()); //獲取播客會員資料
	    	
	    	if(a.isEmpty()) {
	    	SubscriptionBean q = new SubscriptionBean();
	    	q.setMemberId(loginMember.getMemberId()); //訂閱者ID
	    	q.setMonthlyPayment(podcasterChannel.getMonthlyPayment());
	    	q.setSubdateStart(date);
	    	q.setSubdateEnd(date3);
	    	q.setPodcasterId(needSub.get(0).getMemberId()); //播客ID
	    	q.setReceipt(podcasterChannel.getInfo());
	    	q.setCreditCardNumber("4938-1701-3000-0003");
	    	
	    	sdao.insert(q);
	    		    		
	    	}
	    	
	    	
	    	
//	    	
//	    	else {
//	    	SubscriptionBean f = new SubscriptionBean();
//	    	f.setMemberId(a.get(0).getMemberId()); //訂閱者ID
//	    	f.setMonthlyPayment(300);
//	    	f.setSubdateStart(date);
//	    	f.setSubdateEnd(date3);
//	    	f.setPodcasterId(17); //播客ID
//	    	f.setReceipt("小黃測試");
//	    	f.setCreditCardNumber("1111-2222-3333-4444");
//	    	
//	    	sdao.insert(f);	
//	    	}
	    
	    	
	    	SubProgramListDAO sdao2 = (SubProgramListDAO)context.getBean("SubProgramListDAO");	    	
	    	List<SubscriptionBean> subRecordList=sdao2.selectBySubMemeberId(loginMember.getMemberId());	    	
	    	subRecordList.get(0).getPodcasterId();//訂閱的播客
	    
	    	
	    
	    	
	    	//訂閱的頻道、訂閱的起訖日、費用。
	    	System.out.println("---------訂閱--------------");
	    	System.out.println(subRecordList.get(0).getMemberId());
	    	System.out.println(subRecordList.get(0).getSubdateEnd());
	    	System.out.println(subRecordList.get(0).getSubdateStart());
	    	System.out.println(subRecordList.get(0).getMonthlyPayment());	    	
	    	System.out.println(subRecordList.get(0).getReceipt());	  
	    	System.out.println("---------訂閱--------------");
	    	m.addAttribute("subRecordList", subRecordList);
	    	
	return "/NcccPaymentPage";
}
}