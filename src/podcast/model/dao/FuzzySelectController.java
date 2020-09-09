package podcast.model.dao;

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
import podcast.model.javabean.MemberBean;
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
	    			selectData.setMemberId(userAllData.get(e.getIndex()).getMemberId());
	    			fuzzyUserData.add(selectData);
	    		}
	    	}
	    	
	    	UploadPodcastDAO updao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
	    	List<uploadPodcastBean> podcastAllData = updao.selectAll();
	    	List<String> podcastAllDataName = new ArrayList<String>();
	    	for(uploadPodcastBean i:podcastAllData) {
	    		podcastAllDataName.add(i.getTitle());	
	    	}
	    	List<ExtractedResult> podcastContainer = FuzzySearch.extractTop(request.getParameter("selectCondition"), podcastAllDataName,100);
	    	for(ExtractedResult e:podcastContainer) {
	    		if(e.getScore()>0) { 
	    			MemberBean selectData = new MemberBean();
	    			selectData.setNickname(userAllData.get(e.getIndex()).getNickname());
	    			selectData.setImage(userAllData.get(e.getIndex()).getImage());
	    			selectData.setMemberId(userAllData.get(e.getIndex()).getMemberId());
	    			fuzzyUserData.add(selectData);
	    		}
	    	}
			m.addAttribute("fuzzyUserData", fuzzyUserData);
			return "/FuzzySelect/showFuzzySelect";
		}

}
