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

import podcast.model.dao.MemberDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HouseBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class JsonCreaterController {

	@Autowired
	UploadPodcastDAO updao;
	
	@Autowired
	MemberDAO mdao;

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

		return "playerBar/playerbar_test";
	}

	//
	@GetMapping(value = "/gettheplayersong")
	public ResponseEntity<List<uploadPodcastBean>> sssString(Model m,
			@RequestParam(value = "name", required = false) Integer mid) {
		// gettheplayersong?name=17
		System.out.println(mid);

		List<uploadPodcastBean> mlist = updao.queryProgramByMemberID(mid);

		ResponseEntity<List<uploadPodcastBean>> result = new ResponseEntity<List<uploadPodcastBean>>(mlist,
				HttpStatus.OK);

		return result;
	}

	
	
	// 取得單首音樂資訊   準備加入播放清單
	@GetMapping(value = "/postjson")
	public @ResponseBody Map<String, String> getsinglesong(Model m, @RequestParam("id") Integer podcastid) throws Exception {

		uploadPodcastBean ubean = updao.select(podcastid);

		Map<String, String> songinfo = new HashMap<String, String>();
		
		//取得播客member id代號
		Integer publisherId= ubean.getMemberId();
		
		//取得播客暱稱
		String publishername= mdao.selectPodcaster(publisherId).getNickname();
		
//		author: "Freedom1111 Trail Studio",
//		authorUrl: "https://www.youtube.com/channel/UCx6kpgiQkDkN1UnK5GaATGw",
//		fileName: "Swing Theory",
//		fileUrl: "https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/Swing_Theory.mp3",
//		thumb:"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/15367448967_0551dce9c1_q.jpg"
		
		System.out.println("i am in json");
		songinfo.put("author", publishername);
		songinfo.put("authorUrl", "value");
		songinfo.put("fileName", ubean.getTitle());
		songinfo.put("fileUrl", ubean.getAudioPath());
		songinfo.put("thumb", ubean.getAudioimg());

		return songinfo;
	}
	
	
	//test fuzzyselecttest
	@GetMapping("fuzzy")
	public String leadToFuzzy() {
		return "fuzzySelectTest";
	}
	

}
