package podcast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


//for test server 
@Controller
@SessionAttributes(names= {"msg"})
@RequestMapping(path = { "/demo.controller" })
public class DemoController {
    @RequestMapping(method = RequestMethod.GET)
	public String processActin(Model m) {
		System.out.println("hello");
		m.addAttribute("msg","You got mail!");
		return "/success";
	}
}
