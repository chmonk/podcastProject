package podcast.controller;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderBean;
import podcast.model.javabean.OrderItemBean;
import podcast.model.dao.ShoppingCart;
import podcast.model.idao.OrderService;
// OrderConfirm.jsp 呼叫本程式。

@Controller
@RequestMapping("_04_ShoppingCart")
@SessionAttributes({ "LoginOK", "ShoppingCart", "OrderErrorMessage"})
public class ProcessOrderController {
	@Autowired
	ServletContext context;
	
	@Autowired
	OrderService orderService;
	
	@PostMapping("ProcessOrder")
	protected String processOrder(Model model, 
			@RequestParam("ShippingAddress") String shippingAddress,
			@RequestParam("BNO") String bNO,
			@RequestParam("InvoiceTitle") String invoiceTitle, 
			WebRequest webRequest, SessionStatus status
			) {
		
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			//return "redirect:/_02_login/login";
		}
		
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "redirect:/login";
			//return "redirect:/_02_login/login";
		}
		// 如果使用者取消訂單
		System.out.println("測試零");
		Integer memberId = memberBean.getMemberId();  
		double totalAmount = sc.getSubtotal(); // 取出會員代號
		//double totalAmount = Math.round(sc.getSubtotal() * 1.05);  	// 計算訂單總金額 
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		OrderBean ob = new OrderBean(null, memberId, totalAmount, shippingAddress, 
				bNO, invoiceTitle, today, null, null);
		
		System.out.println("測試一:"+ob);
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		
		Map<Integer, OrderItemBean> content = sc.getContent();
		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet(); //map轉set
		for(Integer i : set) {
			OrderItemBean oib = content.get(i); //map.get = oib
			oib.setOrderBean(ob); //每一個oib物件加入OrderItemBean的OrderBean屬性
			items.add(oib);//最後讓LinkedHashSet加入這些oib物件
		}
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setItems(items);  
		System.out.println("測試二:"+ob);
		try {
			orderService.persistOrder(ob);
			status.setComplete();
			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
			System.out.println("Order Process OK");
			return "Orders/OrderList";
			//return "forward:" + "removeShoppingCart";
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			String shortMsg = "" ;   
			System.out.println("message=" + message);
			shortMsg =  message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			model.addAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
			return "Activity/ShowCartContent";
			//return "redirect:/_04_ShoppingCart/ShowCartContent";
		}
	}
}