package podcast.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.MyFavProgramDAO;
import podcast.model.dao.SubscriptionDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.LikeRecordBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({"LoginOK","mediaData"})
public class AddListController {
	
	
	@Autowired
	private UploadPodcastDAO udao;// 需要宣告實例化並用autowire注入

	@Autowired
	private MemberDAO mdao;

	@Autowired
	private LikeRecordDAO ldao;
	
	@Autowired
	private HistoryDao hdao;
	
	
	//點擊節目時  1.節目加入播放列表  2.增加瀏覽紀錄 3.節目點擊增加 4.增加like record like 0 addlist 1
	@GetMapping(value="/addListController", produces= {"application/json"})
	//id from ajax provide podcastId
	public @ResponseBody Map<String, String> AddList(
			@RequestParam("id") Integer id,
			Model model,HttpServletResponse response) throws Exception {

		
		System.out.println("id==="+id);
		
		

		
		//@ResponseBody表示被此標註的類別方法的回傳值會直接以JSON格式顯示在HTML上
		System.out.println(id);
		Integer publisherId=udao.select(id).getMemberId();

//		Integer userId=(Integer)model.getAttribute("userid");
		MemberBean mbean = (MemberBean)model.getAttribute("LoginOK");
		
		
		if(mbean==null) {
			System.out.println("loginok null");
			return null;
		}
		
		
		//check loginOK
		System.out.println("loginOK ID:"+mbean.getMemberId() );

		Integer userid=mbean.getMemberId();


		Integer podcastId=id;

		//1.pack single program for ajax
		uploadPodcastBean songlist = udao.select(id);
		
		Map<String, String> m =new HashMap<>();
		m.put("author", mdao.selectPodcaster(songlist.getMemberId()).getNickname());
		m.put("authorurl",mdao.selectPodcaster(songlist.getMemberId()).getPodcastorWebPage());
		m.put("fileName", songlist.getTitle());
		m.put("fileUrl", songlist.getAudioPath());
		m.put("thumb", songlist.getAudioimg());
		m.put("podcastId",songlist.getPodcastId().toString());

		//2. 新增瀏覽紀錄
		HistoryBean hbean = new HistoryBean();

		hbean.setLastListen(new Date());
		hbean.setMemberId(userid);
		hbean.setPodcastId(id);
		hbean.setPodcastName(songlist.getTitle());
		hbean.setPublisherId(songlist.getMemberId());

		hdao.insert(hbean);

		//3. 新增點擊數
		udao.addClickCount(id);
		System.out.println("stage3");

		//4. 如果likelist未有紀錄就新增 單純新增like record

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
		
		return m;
	}
	
	

	//點擊節目愛心時  3.節目點擊增加 4.增加like record like 1 addlist 1
	@GetMapping(value="/addListByLikeController", produces= {"application/json"})
	//id from ajax provide podcastId
	public @ResponseBody Map<String, String> AddListByLike(@RequestParam("id") Integer id,
			Model model) throws Exception {

		//@ResponseBody表示被此標註的類別方法的回傳值會直接以JSON格式顯示在HTML上
		System.out.println("id==="+id);
	
		Integer publisherId=udao.select(id).getMemberId();
//		Integer userId=(Integer)model.getAttribute("userid");
		MemberBean mbean = (MemberBean)model.getAttribute("LoginOK");
		Integer userid=mbean.getMemberId();
		Integer podcastId=id;

		//1.pack single program for ajax
		uploadPodcastBean songlist = udao.select(id);
		
		Map<String, String> m =new HashMap<>();
		m.put("author", mdao.selectPodcaster(songlist.getMemberId()).getNickname());
		m.put("authorurl",mdao.selectPodcaster(songlist.getMemberId()).getPodcastorWebPage());
		m.put("fileName", songlist.getTitle());
		m.put("fileUrl", songlist.getAudioPath());
		m.put("thumb", songlist.getAudioimg());

		//2. 新增瀏覽紀錄
				HistoryBean hbean = new HistoryBean();
		
				hbean.setLastListen(new Date());
				hbean.setMemberId(userid);
				hbean.setPodcastId(id);
				hbean.setPodcastName(songlist.getTitle());
				hbean.setPublisherId(songlist.getMemberId());
		
				hdao.insert(hbean);

				

		//4. 如果likelist未有紀錄就新增 單純新增like record
		LikeRecordBean likeresult = ldao.checkByMemberidAndPodcastID(userid, podcastId);
		if (likeresult==null) {
			LikeRecordBean lbean = new LikeRecordBean();
			lbean.setMemberId(userid);
			lbean.setPodcastId(podcastId);
			lbean.setLikeStatus(1);
			lbean.setShowInListOrNot(1); // 預計顯示在清單中
			udao.addLikeCount(id);

			ldao.insert(lbean);
			
			//3. 新增點擊數
			udao.addClickCount(id);
			
		}else if(likeresult.getLikeStatus()==0){
			//增加愛心
			udao.addLikeCount(id);
			likeresult.setLikeStatus(1);
			likeresult.setShowInListOrNot(1); //重點變為可加入list
			
			//3. 新增點擊數
			udao.addClickCount(id);
			
		}else {
			//取消愛心
			udao.decrLikeCount(id);
			likeresult.setLikeStatus(0);
			likeresult.setShowInListOrNot(1); //重點變為可加入list
		}
		
		return m;
	}
	
	//每當重新整理就要求session中programList
	@GetMapping(path="loadProgramList",produces = "application/json;charset=UTF-8;")
	public @ResponseBody  String loadProgramList(Model m){

		
		if(m.getAttribute("mediaData")==null) {
			return "[]";
		}else {
			System.out.println(m.getAttribute("mediaData").toString());
			return m.getAttribute("mediaData").toString();
		}
	}
	
	//每當加入歌曲後送資料更新programList
	@PostMapping(path="updateProgramList")
	public @ResponseBody String updateProgramList(Model m,
			@RequestParam("media") String mediaData){
		m.addAttribute("mediaData", mediaData);
		System.out.println("update mediaData"+mediaData);
		
		return m.addAttribute("mediaData", mediaData).toString();
	}
	
}
