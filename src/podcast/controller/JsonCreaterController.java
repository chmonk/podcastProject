package podcast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
