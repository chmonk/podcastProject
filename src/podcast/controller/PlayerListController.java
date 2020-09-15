package podcast.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class PlayerListController {

	@Autowired
	private UploadPodcastDAO uDao;

	@GetMapping(path = "/jsonTest") 
	public @ResponseBody List<Object> Allplaylist() throws Exception {

		List<uploadPodcastBean> allsongs = uDao.selectAll();

		List<Object> playlist = new LinkedList<>();

		for (uploadPodcastBean i : allsongs) {
			Map<String, String> playeritem = new HashMap<>();

			playeritem.put("author", i.getMemberId().toString());
			playeritem.put("authorUrl", "");
			playeritem.put("fileName", i.getTitle());
			playeritem.put("fileUrl", i.getAudioPath());
			playeritem.put("thumb", i.getAudioimg());

			//單首歌曲加入播放清單
			playlist.add(playeritem);
		}

	
		//System.out.println(allsongs);
		System.out.println("-----------------------------");

		return playlist;

	}

}
