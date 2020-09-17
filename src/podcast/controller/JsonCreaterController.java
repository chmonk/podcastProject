package podcast.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HouseBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class JsonCreaterController {

	@Autowired
	UploadPodcastDAO updao;

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

	@GetMapping(path = "/song")
	public @ResponseBody Map<String, String> json(Model m) {

		System.out.println("aaa");
		Map<String, String> json = new HashMap<String, String>();

//    	author: "米津玄師",
//		authorUrl: "",
//		fileName: "lemon",
//		fileUrl:
//			"./test/lemon.mp3",
//		thumb:
//			"./test/lemon.jpg"

		json.put("author", "米津玄師1111");
		json.put("authorUrl", "");
		json.put("fileName", "lemon");
		json.put("fileUrl", "./programaudio/17_972_audio.mp3");
		json.put("thumb", "./programimg/17_972_img.jpg");

		return json;
	}

	@RequestMapping(value = "/testbar1", method = RequestMethod.GET)
	public String leadToBarOnlyJSP(Model m) {

		ArrayList<Integer> a = new ArrayList<Integer>();

		System.out.println("11111111111");
		a.add(17);
		a.add(18);
		a.add(19);
		a.add(20);
		a.add(21);

		m.addAttribute("player", a);

		return "playerbar";
	}

	@GetMapping(value = "/gettheplayersong")
	public ResponseEntity<List<uploadPodcastBean>> sssString(Model m, @RequestParam("name") Integer mid) {

		System.out.println(mid + "1");
		System.out.println("aheredscsds");

		List<uploadPodcastBean> mlist = updao.queryProgramByMemberID(mid);

		ResponseEntity<List<uploadPodcastBean>> result = new ResponseEntity<List<uploadPodcastBean>>(mlist,
				HttpStatus.OK);

		return result;
	}

}
