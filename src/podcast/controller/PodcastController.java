package podcast.controller;

import java.io.File;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;


import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;



@Controller
public class PodcastController {
	//管理頻道
	@RequestMapping(path = "/managePodcast", method = RequestMethod.GET)
	public String showManagePodcast(Model m) {
		return "PodcastManage/PodcastManage";
	}
	
	//新增頻道
	@RequestMapping(path = "/addPodcast", method = RequestMethod.GET)
	public String showAddForm(Model m) {
		uploadPodcastBean apodcast = new uploadPodcastBean();
		m.addAttribute("uploadPodcastBean", apodcast);
		return "PodcastManage/AddPodcast";
	}

	//修改頻道
	@RequestMapping(path = "/modifyPodcast", method = RequestMethod.GET)
	public String showmodifyForm(Model m) {
		uploadPodcastBean mpodcast = new uploadPodcastBean();
		m.addAttribute("uploadPodcastBean", mpodcast);
		return "PodcastManage/ModifyPodcast";
	}
	//接收新增頻道
	@RequestMapping(path = "/addPodcastProcess", method = RequestMethod.POST)
//    public String processPodcast(@RequestParam("podcastfile") MultipartFile multipartFile2,
//    		@RequestParam("category") Integer categoryId,@RequestParam("openComment") int openComment,@RequestParam("openPayment") int openPayment,
//    		HttpServletRequest request,@ModelAttribute("uploadPodcastBean") uploadPodcastBean upload,
//    		BindingResult result, Model m) throws Exception {
//    	if(result.hasErrors()) {
//    		return "PodcastManage/AddPodcast";
//    	}
//    	@RequestMapping(path = "/addPodcastProcess", method = RequestMethod.POST)
    	public String processPodcast(@RequestParam("podcastpic") MultipartFile multipartFile,@RequestParam("podcastfile") MultipartFile multipartFile2,
    			@RequestParam("category") Integer categoryId,@RequestParam("openComment") Integer openComment,@RequestParam("openPayment") Integer openPayment,
    			HttpServletRequest request,@ModelAttribute("uploadPodcastBean") uploadPodcastBean upload,
    			BindingResult result, Model m) throws Exception {
    		if(result.hasErrors()) {
    			return "PodcastManage/AddPodcast";
    		}
    	
    	m.addAttribute("podcastId", upload.getPodcastId());
    	m.addAttribute("podcastTitle", upload.getTitle());
    	m.addAttribute("podcastInfo", upload.getPodcastInfo());
    	m.addAttribute("podcastPaymentSetting", upload.getOpenPayment());
    	m.addAttribute("podcastCommentSetting", upload.getOpenComment());

    	String filename= upload.getTitle();
    	String saveaudioPath="C:\\SpringSource\\springworkspace\\PodcastProject2\\WebContent\\audio\\"+filename+".mp3";
//    	String saveaudioPath = request.getSession().getServletContext().getRealPath("/") + "audio\\" + filename+".mp3";
//    	String savePicPath = request.getSession().getServletContext().getRealPath("/") + "audiopic\\" + filename+".jpg";
    	String savePicPath = "C:\\SpringSource\\springworkspace\\PodcastProject2\\WebContent\\audio\\" + filename+".jpg";
    	File saveAudioFile = new File(saveaudioPath);
    	multipartFile2.transferTo(saveAudioFile);
    	File savePicFile = new File(savePicPath);
    	multipartFile.transferTo(savePicFile);
    	
    	System.out.println("test0");
    	upload.setAudioimg(savePicPath);
    	System.out.println("test1");
    	upload.setAudioPath(saveaudioPath);
    	System.out.println("test2");
    	upload.setOpenComment(openComment);
    	System.out.println("test3");
    	upload.setOpenPayment(openPayment);
    	System.out.println("test4");
    	upload.setCategoryId(categoryId);
    	System.out.println("test5");
    	
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	
    	System.out.println(upload.getAudioimg());
    	System.out.println(upload.getAudioPath());
    	System.out.println(upload.getPodcastInfo());
    	System.out.println(upload.getTitle());
    	System.out.println(upload.getOpenComment());
    	System.out.println(upload.getOpenPayment());
    	
    	
    	upDao.insert(upload);
    	System.out.println("test6");
    	return "PodcastManage/PodcastManage";
    }
	
	@RequestMapping(path = "/allPodcast", method = RequestMethod.GET)
	public String showActivities(HttpServletRequest request,Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	List<uploadPodcastBean> list = new LinkedList<uploadPodcastBean>();
    	
    	list = upDao.selectAll();

		m.addAttribute("list", list);
		return "../../index";
		
	}

}
