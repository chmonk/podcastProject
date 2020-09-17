package podcast.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderBean;
import podcast.model.idao.OrderService;

@Controller
@RequestMapping("_05_orderProcess")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "ShoppingCart"})
public class OrderListController {

	@Autowired
	ServletContext context;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("orderList")
	protected String orderList(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			//return "redirect:/_02_login/login";
		}

		List<OrderBean> memberOrders = orderService.getMemberOrders(memberBean.getMemberId());
		model.addAttribute("memberOrders", memberOrders);
		return "Orders/OrderList";
		//return "_05_orderProcess/OrderList";
	}
	
	@GetMapping("orderDetail")
	protected String orderDetail(Model model, 
			@RequestParam("orderNo") Integer no 
			) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			//return "redirect:/_02_login/login";
		}

		OrderBean ob = orderService.getOrder(no);
		model.addAttribute("OrderBean", ob);
		return "Orders/ShowOrderDetail";
		//return "_05_orderProcess/ShowOrderDetail";
	}
}
