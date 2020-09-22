package podcast.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

@Controller
@SessionAttributes({ "ShoppingCart" })
public class RemoveShoppingCartController {

	
	@GetMapping("removeShoppingCart")
	public String removeCart(Model model, SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	//按下取消購物
	@GetMapping("abort")
	protected String abort(HttpSession session, Model model, WebRequest webRequest, SessionStatus status)  {
		status.setComplete();
		return  "redirect:/";
	}
	
	//按下取消訂單
	@GetMapping("cancelOrder")
	protected String cancelOrder(Model model, WebRequest webRequest, SessionStatus status) {
		status.setComplete();
		return  "redirect:/";
	}
}
