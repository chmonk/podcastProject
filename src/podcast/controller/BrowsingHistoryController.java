package podcast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BrowsingHistoryController {
	
	
	
	//導向瀏覽紀錄頁面  ?userid=
	@GetMapping(value = "/goToBrowsingHistory")
	public String leadToBrowsingHistory(Model m,
			@RequestParam("userid") Integer userid) {
		
		
		//get the list of browsing list 
		
		
		//m.addAttribute("", attributeValue);
	
		return "browsingHistory";
	}
	
	
	

}
