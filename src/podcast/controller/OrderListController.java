package podcast.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.javabean.MemberBean;
//import podcast.model.javabean.OrderBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.dao.OrderTicketDAO;
//import podcast.model.idao.OrderService;

@Controller
@SessionAttributes({ "LoginOK", "products_DPP", "ShoppingCart"})
public class OrderListController {

	@Autowired
	ServletContext context;
	
//	@Autowired
//	OrderService orderService;
	
	@GetMapping("orderList")
	protected String orderList(Model model,HttpServletRequest request) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			//return "redirect:/_02_login/login";
		}
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
		OrderTicketDAO ot = (OrderTicketDAO)context.getBean("OrderTicketDAO");

		List<OrderTicketBean> memberOrders = ot.getMemberOrders(memberBean.getMemberId());
		model.addAttribute("memberOrders", memberOrders);
		return "Orders/OrderList";
		//return "_05_orderProcess/OrderList";
	}
	
	@GetMapping("orderDetail")
	protected String orderDetail(HttpServletRequest request,Model model, 
			@RequestParam("ticketOrderId") Integer ticketOrderId 
			) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			
		}
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
		OrderTicketDAO ot = (OrderTicketDAO)context.getBean("OrderTicketDAO");
		OrderTicketBean ob = ot.getOrder(ticketOrderId);
		//單筆訂單資訊
		
		model.addAttribute("OrderBean", ob);
		return "Orders/ShowOrderDetail";
		
	}
}
