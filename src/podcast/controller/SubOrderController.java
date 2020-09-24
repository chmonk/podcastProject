package podcast.controller;

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

import podcast.model.dao.MemberDAO;
import podcast.model.dao.SubProgramListDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.SubscriptionBean;

@Controller
@RequestMapping(path = { "/SubOrderController.controller" })
@SessionAttributes(names={"subProgram","needSub","subRecordList"})
public class SubOrderController {

	@RequestMapping(method = RequestMethod.GET)
	
	public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
		
		
		//取得註冊物件的context
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
    	MemberBean loginMember =(MemberBean)request.getSession().getAttribute("LoginOK");
    	SubProgramListDAO sdao2 = (SubProgramListDAO)context.getBean("SubProgramListDAO");
    	List<SubscriptionBean> subRecordList=sdao2.selectBySubMemeberId(loginMember.getMemberId());
    	
    	//訂閱的頻道、訂閱的起訖日、費用。
    	System.out.println("---------訂閱--------------");
    	
    	System.out.println(subRecordList.get(0).getMemberId());
    	System.out.println(subRecordList.get(0).getSubdateEnd());
    	System.out.println(subRecordList.get(0).getSubdateStart());
    	System.out.println(subRecordList.get(0).getMonthlyPayment());	    	
    	System.out.println(subRecordList.get(0).getReceipt());	    	

    	System.out.println("---------訂閱--------------");
    	m.addAttribute("subRecordList", subRecordList);
		
		
		return "/subRecord";
	}
}
