package podcast.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class BrowsingHistoryController {

	// 導向瀏覽紀錄頁面 ?userid=
	@GetMapping(value = "/goToBrowsingHistory")
	public String leadToBrowsingHistory(Model m, HttpServletRequest request, @RequestParam("userid") Integer userid)
			throws Exception {

		// get the list of browsing list
		ServletContext app = request.getServletContext();

		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		HistoryDao hdao = (HistoryDao) context.getBean("HistoryDao");

		List<HistoryBean> list = hdao.selectHistoryByMemberId(userid);

		// get program info and pack into list

		UploadPodcastDAO updao = (UploadPodcastDAO) context.getBean("UploadPodcastDAO");

		MemberDAO mDao = (MemberDAO) context.getBean("MemberDAO");

		ArrayList<uploadPodcastBean> programinfo = new ArrayList<uploadPodcastBean>();

		ArrayList<String> AuthorList = new ArrayList<String>();

		for (HistoryBean prog : list) {

			uploadPodcastBean singleProgramInfo = updao.select(prog.getPodcastId());

			programinfo.add(singleProgramInfo);

			String author = mDao.selectPodcaster(prog.getPublisherId()).getNickname();

			AuthorList.add(author);
		}

		m.addAttribute("history", list);
		m.addAttribute("program", programinfo);
		m.addAttribute("author", AuthorList);

		return "browsingHistory";
	}

	// 取得
	@GetMapping(value = "/trysql")
	public void trynativesql(HttpServletRequest request) {

		ServletContext app = request.getServletContext();

		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		HistoryDao hdao = (HistoryDao) context.getBean("HistoryDao");

		hdao.selectHistoryByMemberId(1);
	}

}
