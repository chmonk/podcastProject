package podcast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestIndexController {
	
	@GetMapping(path = { "/ToIndex.controller" })
	public String toIndex() {
		return"/index1";
	}
}
