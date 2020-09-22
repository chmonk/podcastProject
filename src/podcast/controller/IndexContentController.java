package podcast.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;

import podcast.model.dao.BackStageDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class IndexContentController {
	
	@Autowired
	private BackStageDAO bDao;
	
	@Autowired
	private MemberDAO mDao;
	
	@GetMapping(path= {"/PopularPodcaster"})
	public @ResponseBody List<MemberBean> popularPodcaster(Model m, HttpServletRequest request) {
		
		LocalDate date=LocalDate.now().minusDays(30);
		Date date2=Date.valueOf(date);
		java.util.List<uploadPodcastBean> uList=bDao.topPodcast(date2);
		
		List<Integer> idList=new ArrayList<Integer>();
		for(int i=0;i<10;i++) {
			idList.add(uList.get(i).getMemberId());
		}
		
		List<MemberBean> mList = new ArrayList<MemberBean>();
		for(int j=0;j<idList.size();j++) {
				mList.add(mDao.selectPodcaster(idList.get(j)));
		}
		
		//m.addAttribute("mbean",mList);
		 
		return mList;
	}
}
