package podcast.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderItemBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.dao.OrderTicketDAO;
import podcast.model.dao.ShoppingCart;


@Controller
@SessionAttributes({ "LoginOK", "products_DPP", "ShoppingCart"})
public class OrderListController {

	@Autowired
	ServletContext context;

	
	//會員訂購紀錄
	@GetMapping("orderList")
	protected String orderList(Model model,HttpServletRequest request) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";

		}	
		
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if(sc!=null) {
		Map<Integer, OrderItemBean> cart =sc.getContent();
		cart.clear();}
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
		OrderTicketDAO ot = (OrderTicketDAO)context.getBean("OrderTicketDAO");

		List<OrderTicketBean> memberOrders = ot.getMemberOrders(memberBean.getMemberId());
		model.addAttribute("memberOrders", memberOrders);
		return "Orders/OrderList";

	}
	
	//單筆訂單資訊
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
		
		model.addAttribute("OrderBean", ob);
		return "Orders/ShowOrderDetail";
		
	}
}
