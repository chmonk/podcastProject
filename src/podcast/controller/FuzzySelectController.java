package podcast.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import me.xdrop.fuzzywuzzy.FuzzySearch;
import me.xdrop.fuzzywuzzy.model.ExtractedResult;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.fuzzyPodcastReturnArchitecture;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes(names= {"msg"})
@RequestMapping(path = { "/FuzzySelect.controller" })
public class FuzzySelectController {
	 @RequestMapping(method = RequestMethod.GET)
		public String processActin(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
	    	
	    	//取得註冊物件的context
	    	ServletContext app = request.getServletContext();
	    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
	    	
	    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
	    	List<MemberBean> userAllData = mdao.fuzzySelectPodcasterAll();
	    	List<MemberBean> fuzzyUserData = new ArrayList<MemberBean>(); 	
	    	List<String> userAllDataName = new ArrayList<String>();
	    	for(MemberBean i:userAllData) {
	    		userAllDataName.add(i.getNickname());	
	    	}
	    	List<ExtractedResult> memberContainer = FuzzySearch.extractSorted(request.getParameter("selectCondition"), userAllDataName);
	    	for(ExtractedResult e:memberContainer) {
	    		if(e.getScore()>0) { 
	    			MemberBean selectData = new MemberBean();
	    			selectData.setNickname(userAllData.get(e.getIndex()).getNickname());
	    			selectData.setImage(userAllData.get(e.getIndex()).getImage());
	    			selectData.setInfo(userAllData.get(e.getIndex()).getInfo());
	    			selectData.setMemberId(userAllData.get(e.getIndex()).getMemberId());
	    			fuzzyUserData.add(selectData);
	    		}
	    	}
	    	
	    	UploadPodcastDAO updao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
	    	CategoryDAO cdao = (CategoryDAO)context.getBean("CategoryDAO");
	    	List<uploadPodcastBean> podcastAllData = updao.selectAll();
	    	ArrayList<fuzzyPodcastReturnArchitecture> fuzzyPodcastData = new ArrayList<fuzzyPodcastReturnArchitecture>();
	    	List<String> podcastAllDataName = new ArrayList<String>();
	    	for(uploadPodcastBean i:podcastAllData) {
	    		podcastAllDataName.add(i.getTitle());	
	    	}
	    	List<ExtractedResult> podcastContainer = FuzzySearch.extractTop(request.getParameter("selectCondition"), podcastAllDataName,100);
	    	for(ExtractedResult e:podcastContainer) {
	    		if(e.getScore()>0) { 
	    			fuzzyPodcastReturnArchitecture selectData = new fuzzyPodcastReturnArchitecture();
	    			selectData.setPodcastId(podcastAllData.get(e.getIndex()).getPodcastId());
	    			selectData.setTitle(podcastAllData.get(e.getIndex()).getTitle());
	    			selectData.setPodcastInfo(podcastAllData.get(e.getIndex()).getPodcastInfo());
	    			selectData.setCategoryName(cdao.select(podcastAllData.get(e.getIndex()).getCategoryId()).getCategoryName());
	    			selectData.setPodcasterName(mdao.selectPodcaster(podcastAllData.get(e.getIndex()).getMemberId()).getNickname());
	    			selectData.setOpenPayment(podcastAllData.get(e.getIndex()).getOpenPayment());
	    			selectData.setUploadTime(podcastAllData.get(e.getIndex()).getUploadTime());
	    			selectData.setClickAmount(podcastAllData.get(e.getIndex()).getClickAmount());
	    			selectData.setAudioPath(podcastAllData.get(e.getIndex()).getAudioPath());
	    			fuzzyPodcastData.add(selectData);
	    		}
	    	}
	    	
			m.addAttribute("fuzzyUserData", fuzzyUserData);
			m.addAttribute("fuzzyPodcastData", fuzzyPodcastData);
			return "/FuzzySelect/showFuzzySelect";
		}

}
