package podcast.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import me.xdrop.fuzzywuzzy.FuzzySearch;
import me.xdrop.fuzzywuzzy.model.ExtractedResult;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.SubProgramListDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.fuzzyPodcastReturnArchitecture;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({"LoginOK"})
public class FuzzySelectController {
	@Autowired
	SubProgramListDAO sdao;
	
	@Autowired
	LikeRecordDAO ldao;
	
	@GetMapping(path = { "/getFuzzySelectAllDataName.controller" })
	public @ResponseBody List<Map<String,String>> getFuzzySelectAllDataName(HttpServletRequest request,HttpServletResponse response) {
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
    	UploadPodcastDAO updao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	List<String> userAllNameData = mdao.fuzzySelectPodcasterAllName();
    	List<String> podcastAllNameData = updao.fuzzySelectPodcastAllName();
	      
    	List<Map<String,String>>FuzzySelectAllDataNameList= new ArrayList<>();
 
    	for(String NameData:userAllNameData) {
        	Map<String,String> DataNameList =new HashMap<>();
        	DataNameList.put("label", NameData);
        	DataNameList.put("category", "頻道");  	
        	FuzzySelectAllDataNameList.add(DataNameList);
    	}
    	
    	for(String NameData:podcastAllNameData) {
        	Map<String,String> DataNameList =new HashMap<>();
        	DataNameList.put("label", NameData);
        	DataNameList.put("category", "節目");  	
        	FuzzySelectAllDataNameList.add(DataNameList);
    	}
		return FuzzySelectAllDataNameList;
		
	}
	@GetMapping(path = { "/FuzzySelect.controller" })
	public String fuzzySelect(HttpServletRequest request,HttpServletResponse response,Model m) throws Exception {
    	
    	//取得註冊物件的context
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	MemberBean mbean=(MemberBean)m.getAttribute("LoginOK");
    	Integer  memberId =mbean.getMemberId();
    	
    	//搜尋播客頻道
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
    	//搜尋播客節目
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
    			selectData.setAudioImg(podcastAllData.get(e.getIndex()).getAudioimg());
    			selectData.setLikesCount(podcastAllData.get(e.getIndex()).getLikesCount());
    			selectData.setConfirmubScription(confirmSubscriptionStatus(memberId,podcastAllData.get(e.getIndex()).getMemberId()));
    			selectData.setPodcasterId(podcastAllData.get(e.getIndex()).getMemberId());
    			selectData.setLikesStatus(ldao.checkByMemberidAndPodcastIdReturnLikeStatus(memberId, selectData.getPodcastId()));
    			
    			fuzzyPodcastData.add(selectData);
    		}
    	}
    	
		m.addAttribute("fuzzyUserData", fuzzyUserData);
		m.addAttribute("fuzzyPodcastData", fuzzyPodcastData);
		return "/FuzzySelect/showFuzzySelect";
	}
	
	public Integer confirmSubscriptionStatus(Integer memberId,Integer podcasterId) throws Exception {
		Date date =new Date();
		List<SubscriptionBean> f = sdao.selectSubcriptionByMemberID(memberId,podcasterId);//確認訂單有無訂閱關係
		
    	if(memberId==podcasterId) {  //如果進入頻道為直播主本人
    		System.out.println("本人");
    		return 2;
    	}else if(f.isEmpty()){ //無訂閱關係
    		System.out.println("無訂閱關係");
    		return 0;
    	}else {
        	for(SubscriptionBean g:f) {  	
        		if(g.getSubdateEnd().compareTo(date)==1) {
        			System.out.println("會員"+g.getMemberId()+"在"+g.getPodcasterId()+"的訂閱期間內");
        			return 1;
        		}else if(g.getSubdateEnd().compareTo(date)==-1) {
        			System.out.println("已過期");
        			return 0;
        		}
        	}
    	}
		return 0;
		
		
	}

}
