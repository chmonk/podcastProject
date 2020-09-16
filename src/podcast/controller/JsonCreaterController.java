package podcast.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HouseBean;



@Controller
public class JsonCreaterController {
    @RequestMapping(path = "/houseBeanJson", method = RequestMethod.GET)
	public void processAction(Model m) {
       HouseBean hBean = new HouseBean();
       CategoryBean cbean = new CategoryBean();
       
       hBean.setHouseid(12345);
       hBean.setHousename("Crazy House");
       cbean.setCategoryId(11);
       cbean.setCategoryName("happy");
       m.addAttribute("houseBean", hBean);
       m.addAttribute("categoryBean", cbean);
	}
    
    @PostMapping(value="/postjson")
    public @ResponseBody Map<String, String> json(Model m) {
    	HouseBean hBean = new HouseBean();
    	CategoryBean cbean = new CategoryBean();
    	
    	Map<String, String> json= new HashMap<String, String>();
    	
//    	author: "米津玄師",
//		authorUrl: "",
//		fileName: "lemon",
//		fileUrl:
//			"./test/lemon.mp3",
//		thumb:
//			"./test/lemon.jpg"
    	
    	json.put("author", "米津玄師");
    	json.put("authorUrl", "");
    	json.put("fileName", "lemon");
    	json.put("fileUrl", "./test/lemon.mp3");
    	json.put("thumb", "./test/lemon.jpg");
    	
		return json;
    }
}
