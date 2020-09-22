package podcast.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"LoginOK"})
public class LogoutController {
	@GetMapping("logout")
	public String logout(HttpSession session, Model model,SessionStatus status) {
		status.setComplete();
		session.invalidate();
		
		return "redirect:/";
		
	}

}
