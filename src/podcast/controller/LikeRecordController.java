package podcast.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.HistoryOrderProgramBean;
import podcast.model.javabean.MemberBean;

@Controller
@SessionAttributes("LoginOK")
public class LikeRecordController {

	@Autowired
	UploadPodcastDAO updao;

	@Autowired
	HistoryDao hdao;
	
	@Autowired
	LikeRecordDAO ldao;
	
	@GetMapping(value = "/goToLikeRecord")
	public String leadToBrowsingHistory(Model m, HttpServletRequest request)

			throws Exception {

		// get the list of browsing list
		MemberBean mbean= (MemberBean)m.getAttribute("LoginOK");
		Integer userId= mbean.getMemberId();
		
		List<HistoryOrderProgramBean> rs = ldao.selectLikeList(userId);

		m.addAttribute("history", rs);

		return "likelist";
	}

}
