package podcast.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class AddListController {
	@Autowired
	private UploadPodcastDAO udao;// 需要宣告實例化並用autowire注入
	
	
	@GetMapping(value="/addListController", produces= {"application/json"})
	public @ResponseBody Map<String, String> AddListController(Map<String, String> m ,int id) throws Exception {

		//@ResponseBody表示被此標註的類別方法的回傳值會直接以JSON格式顯示在HTML上
		System.out.println(id);

		uploadPodcastBean songlist = udao.select(id);
		m.put("author", songlist.getMemberId().toString());
		m.put("authorurl", songlist.getMemberId().toString());
		m.put("fileName", songlist.getTitle());
		m.put("fileUrl", songlist.getAudioPath());
		m.put("thumb", songlist.getAudioimg());

		return m;

	}
}
