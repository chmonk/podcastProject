package podcast.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class AddListController {
	@Autowired
	private UploadPodcastDAO udao;// 需要宣告實例化並用autowire注入
	@GetMapping(value="/addListController", produces= {"application/json"})
	public @ResponseBody Map<String, String> AddListController(Map<String, String> m) throws Exception {
		//@ResponseBody表示被此標註的類別方法的回傳值會直接以JSON格式顯示在HTML上
		List<uploadPodcastBean> songlist = udao.selectAll();

		m.put("author", songlist.get(1).getPodcastInfo());
		m.put("authorurl", songlist.get(1).getPodcastInfo());
		m.put("fileName", songlist.get(1).getPodcastInfo());
		m.put("fileUrl", songlist.get(1).getPodcastInfo());
		m.put("thumb", songlist.get(1).getPodcastInfo());

		return m;

	}
}
