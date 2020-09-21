package podcast.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.MyFavProgramDAO;
import podcast.model.dao.SubscriptionDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.HouseBean;
import podcast.model.javabean.LikeRecordBean;
import podcast.model.javabean.MyFavProgramBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({ "userid" })
public class JsonCreaterController {

	@Autowired
	UploadPodcastDAO updao;

	@Autowired
	MemberDAO mdao;

	@Autowired
	MyFavProgramDAO myfdao;

	@Autowired
	SubscriptionDAO sdao;

	@Autowired
	LikeRecordDAO ldao;

	// test json用
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

	// 傳入節目for js mediadata模板
	@GetMapping(path = "/song")
	public @ResponseBody Map<String, String> json(Model m) {

		System.out.println("aaa");
		Map<String, String> json = new HashMap<String, String>();

		json.put("author", "米津玄師1111");
		json.put("authorUrl", "");
		json.put("fileName", "lemon");
		json.put("fileUrl", "./programaudio/17_972_audio.mp3");
		json.put("thumb", "./programimg/17_972_img.jpg");

		return json;
	}

	// 導向player測試業面 並傳回測試用按鈕生成資料
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
		m.addAttribute("userid", 2);

		return "playerBar/playerbar_test";
	}

	// ajax request 送來member id , 傳回member id 所上船節目list 同時增加瀏覽紀錄
	@GetMapping(value = "/gettheplayersong")
	public ResponseEntity<List<uploadPodcastBean>> sssString(Model m, HttpServletRequest request,
			@RequestParam(value = "name", required = false) Integer mid) {

		// 測試取得使用者id
		System.out.println(mid);

		// 準備ajax檔案
		List<uploadPodcastBean> mlist = updao.queryProgramByMemberID(mid);
		ResponseEntity<List<uploadPodcastBean>> result = new ResponseEntity<List<uploadPodcastBean>>(mlist,
				HttpStatus.OK);

		return result;
	}

	// 取得單首音樂資訊 準備加入播放清單 瀏覽列表 新增典籍次數
	@GetMapping(value = "/postjson/{userid}/")
	public @ResponseBody Map<String, String> getsinglesong(Model m, HttpServletRequest request,
			@RequestParam("id") Integer podcastId, @PathVariable("userid") Integer userid) throws Exception {

		System.out.println("stage1");
		uploadPodcastBean ubean = updao.select(podcastId);

		Map<String, String> songinfo = new HashMap<String, String>();

		// 取得播客member id代號
		Integer publisherId = ubean.getMemberId();

		// 取得播客暱稱
		String publishername = mdao.selectPodcaster(publisherId).getNickname();

		// 單首節目map資訊
		songinfo.put("podcastId", ubean.getPodcastId().toString());
		songinfo.put("author", publishername);
		songinfo.put("authorUrl", "value");
		songinfo.put("fileName", ubean.getTitle());
		songinfo.put("fileUrl", ubean.getAudioPath());
		songinfo.put("thumb", ubean.getAudioimg());
		System.out.println("stage2");

		// 新增瀏覽紀錄
		// 取得註冊列表
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		HistoryDao hdao = (HistoryDao) context.getBean("HistoryDao");

		HistoryBean hbean = new HistoryBean();

		hbean.setLastListen(new Date());
		hbean.setMemberId(userid);
		hbean.setPodcastId(podcastId);
		hbean.setPodcastName(ubean.getTitle());
		hbean.setPublisherId(publisherId);

		hdao.insert(hbean);

		// 新增點擊數
		updao.addClickCount(podcastId);
		System.out.println("stage3");

		// 如果likelist未有紀錄就新增 單純新增like record

		LikeRecordBean likeresult = ldao.checkByMemberidAndPodcastID(userid, podcastId);
		if (likeresult==null) {
			LikeRecordBean lbean = new LikeRecordBean();
			lbean.setMemberId(userid);
			lbean.setPodcastId(podcastId);
			lbean.setLikeStatus(0);
			lbean.setShowInListOrNot(1); // 預計顯示在清單中

			ldao.insert(lbean);
		}else {
			likeresult.setShowInListOrNot(1); //重點變為可加入list
		}

		return songinfo;
	}

	// 導向模糊測試頁面
	@GetMapping("fuzzy")
	public String leadToFuzzy() {
		return "fuzzySelectTest";
	}

}
