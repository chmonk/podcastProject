package podcast.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.PostLoad;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.HistoryOrderProgramBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes("LoginOK")
public class BrowsingHistoryController {

	@Autowired
	UploadPodcastDAO updao;

	@Autowired
	HistoryDao hdao;


	@GetMapping(value = "/goToBrowsingHistory")
	public String leadToBrowsingHistory(Model m, HttpServletRequest request)

			throws Exception {
		if((MemberBean)m.getAttribute("LoginOK")==null) {
			return "login";
		}
		
		
		
		// get the list of browsing list
		MemberBean mbean= (MemberBean)m.getAttribute("LoginOK");
		Integer userId= mbean.getMemberId();
		
		List<HistoryOrderProgramBean> rs = hdao.selectHistoryByMemberId4(userId);

		m.addAttribute("history", rs);


		return "browsingHistory";
	}



	//ajax要瀏覽紀錄整理  塞到播放列表
	@PostMapping(value = "/getPlaylist")
	public @ResponseBody List<Map<String, String>> getUserPlaylist(HttpServletRequest request, Model m) {
		// test get userid
		
		MemberBean mbean = (MemberBean)m.getAttribute("LoginOK");
		Integer userId = mbean.getMemberId();
		System.out.println(userId);

		// 從舊到新 與前端順序相同
		List<HistoryOrderProgramBean> result = hdao.selectHistoryByMemberId5(userId);

		// sql取資料 從新到舊 but 因為js playlist 新到舊 =下到上 塞丟前端資料從最舊紀錄開始塞

		// 準備給前端的map包在list中
		List<Map<String, String>> list = new ArrayList<>();


		for (HistoryOrderProgramBean hpbean : result) {
			//預計要加上作者連結
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("podcastId",hpbean.getPodcastId().toString());
			map.put("author",hpbean.getNickname());
			map.put("authorUrl","");
			map.put("fileName", hpbean.getPodcastName());
			map.put("fileUrl", hpbean.getAudioPath());
			map.put("thumb",hpbean.getAudioImg());
			
			list.add(map);
		}

		return list;
	}

}
