package podcast.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.uploadPodcastBean;



@Controller
@SessionAttributes({ "LoginOK"})
public class PodcastController {
	//管理頻道
	@RequestMapping(path = "/managePodcast", method = RequestMethod.GET)
	public String showManagePodcast(HttpServletRequest request,Model m) throws Exception {
		
		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		Integer memberId = memberBean.getMemberId();
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	//Integer memberId=(Integer) request.getAttribute("memberId");
//    	Integer memberId=20;
    	List<uploadPodcastBean> upList=upDao.selectAllFromMember(memberId);
    	m.addAttribute("upList",upList);
    	request.setAttribute("upList", upList);
		
		return "/PodcastManage/PodcastManage";
	}
	
	//新增頻道
	@RequestMapping(path = "/addPodcast", method = RequestMethod.GET)
	public String showAddForm(Model m) {
		uploadPodcastBean apodcast = new uploadPodcastBean();
		m.addAttribute("uploadPodcastBean", apodcast);
		return "/PodcastManage/AddPodcast";
	}

	//修改頻道
	@RequestMapping(path = "/modifyPodcast", method = RequestMethod.GET)
	public String showmodifyForm(Model m,
				@RequestParam("thisPodcastId")Integer podcastId,
				HttpServletRequest request) throws Exception {
//		uploadPodcastBean mpodcast = new uploadPodcastBean();
		
		
		//透過抓到的PodcastId先透過DAO方法取得該podcast，預先在欄位內填入資訊---
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	uploadPodcastBean mpodcast = upDao.select(podcastId);
    	//把取得的bean以及id再送到jsp頁面
    	//m.addAttribute("mPodcastBean", mpodcast);
    	m.addAttribute("uploadPodcastBean", mpodcast);
		m.addAttribute("modifyPodcastId", podcastId);
		return "/PodcastManage/ModifyPodcast";
	}
	
	
	//修改單集節目內容
		@PostMapping(path= {"/PodcastModifyProcess"})
		public String podcastModifyProcess(@RequestParam("title")String title,
								 @RequestParam("podcastInfo")String podcastInfo,
								 @RequestParam("radioP")Integer openPayment,
								 @RequestParam("podcastId")Integer podcastId,
								 HttpServletRequest request,
								 Model m) throws Exception {
			
			ServletContext app = request.getServletContext();
	    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
	    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
	    	
	    	System.out.println("modifyPodcastId:"+podcastId);
	    	
	    	uploadPodcastBean ubean=new uploadPodcastBean();
	    	ubean.setTitle(title);
	    	ubean.setPodcastInfo(podcastInfo);
	    	ubean.setOpenPayment(openPayment);
	    	upDao.update(podcastId, ubean);
	    	
	    	//return 到managaPodcast頁面，需要重新抓一次List<upLoadPodcastBean>
	    	
	    	MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
			Integer memberId = memberBean.getMemberId();
			
	    	List<uploadPodcastBean> upList=upDao.selectAllFromMember(memberId);
	    	m.addAttribute("upList",upList);
	    	request.setAttribute("upList", upList);
			
			
			return "/PodcastManage/PodcastManage";
		}
	
	
	
		//接收新增頻道
		@RequestMapping(path = "/addPodcastProcess", method = RequestMethod.POST)
	    	public String processPodcast(
	    			@RequestParam("podcastpic") MultipartFile multipartFile,
	    			@RequestParam("podcastfile") MultipartFile multipartFile2,
	    			@RequestParam("category") Integer categoryId,
	    			@RequestParam("openPayment") Integer openPayment,
	    			HttpServletRequest request,
	    			@ModelAttribute("uploadPodcastBean") uploadPodcastBean upload,
	    			BindingResult result, Model m) throws Exception {
	    		if(result.hasErrors()) {
	    			return "/PodcastManage/AddPodcast";
	    		}
	    	
//	    	m.addAttribute("podcastId", upload.getPodcastId());
//	    	m.addAttribute("podcastTitle", upload.getTitle());
//	    	m.addAttribute("podcastInfo", upload.getPodcastInfo());
//	    	m.addAttribute("podcastPaymentSetting", upload.getOpenPayment());
//	    	m.addAttribute("podcastCommentSetting", upload.getOpenComment());

//	    	String filename= upload.getTitle();
//	    	String saveaudioPath="C:\\SpringSource\\springworkspace\\PodcastProject2\\WebContent\\audio\\"+filename+".mp3";
//	    	String savePicPath = "C:\\SpringSource\\springworkspace\\PodcastProject2\\WebContent\\audio\\" + filename+".jpg";
//	    	String saveaudioPath = request.getSession().getServletContext().getRealPath("/") + "audio\\" + filename+".mp3";
//	    	String savePicPath = request.getSession().getServletContext().getRealPath("/") + "audiopic\\" + filename+".jpg";
	    	
//	    	File saveAudioFile = new File(saveaudioPath);
//	    	multipartFile2.transferTo(saveAudioFile);
//	    	File savePicFile = new File(savePicPath);
//	    	multipartFile.transferTo(savePicFile);
	    	
	    	MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
			Integer memberId = memberBean.getMemberId();
	    	
	    	Timestamp time= new Timestamp(System.currentTimeMillis());
	    	
	    	String savePicPath = processIMGFile(memberId,multipartFile,request);
	    	String saveaudioPath = processAUDFile(memberId,multipartFile2,request);
	    	
	    	upload.setAudioimg(savePicPath);
	    	upload.setAudioPath(saveaudioPath);
	    	upload.setOpenPayment(openPayment);
	    	upload.setCategoryId(categoryId);
	    	upload.setClickAmount(0);
	    	upload.setLikesCount(0);
	    	upload.setOpenComment(1);
	    	upload.setUploadTime(time);
	    	upload.setMemberId(memberId);	    	
	    	
	    	
	    	ServletContext app = request.getServletContext();
	    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
	    	
	    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");

	    	upDao.insert(upload);
	    	
	    	//return 到managaPodcast頁面，需要重新抓一次List<upLoadPodcastBean>
	    	
	    	
			
	    	List<uploadPodcastBean> upList=upDao.selectAllFromMember(memberId);
	    	m.addAttribute("upList",upList);
	    	request.setAttribute("upList", upList);
			
			
			return "/PodcastManage/PodcastManage";
	    }
		
		
		
		public String processIMGFile(Integer id,MultipartFile multipartFile,HttpServletRequest request) throws Exception, IOException {
			// 取得原檔案名字
			String filename = multipartFile.getOriginalFilename();
			System.out.println(filename);

			// 取得主檔名
			String maintitile = filename.substring(0, filename.lastIndexOf("."));
			System.out.println(maintitile);

			// 處理副檔名
			String subtitle = filename.substring(filename.lastIndexOf("."));
			// path 取得workspace 在本機的workspace路徑 + 後續奇怪path
			String path = request.getSession().getServletContext().getRealPath("/");
			// 專案資料夾名稱
			String caseFolder = path.split("\\\\")[path.split("\\\\").length - 1];
			// 取得到含workspace前的絕對路徑
			String workspace = request.getSession().getServletContext().getRealPath("/").substring(0,
					path.indexOf("\\.metadata"));

			// 制式資料夾
			// 節目圖片 programimg
			// 節目音檔 programmedia
			// 會員照片 memberpic
			// 活動圖片 activitypic

			// 資料夾名稱
			String savefolder = "programimg";

			// 制式檔案名稱
			String savefilename = id + maintitile + subtitle;

			// 檔案制式存檔名稱 待設定

			String savepath = workspace + "\\" + caseFolder + "\\WebContent\\" + savefolder + "\\" + savefilename;

			// 準備儲存檔案
			File f = new File(savepath);

			// 不存在就建立路徑
			if (!f.exists()) {
				f.mkdirs();
			}
			// 檔案寫入路徑(存檔)
			multipartFile.transferTo(f);

			// 存入資料庫預設路徑 
			return "./"+savefolder+"/"+savefilename;
		
		}
		
		public String processAUDFile(Integer id,MultipartFile multipartFile,HttpServletRequest request) throws Exception, IOException {
			// 取得原檔案名字
			String filename = multipartFile.getOriginalFilename();
			System.out.println(filename);

			// 取得主檔名
			String maintitile = filename.substring(0, filename.lastIndexOf("."));
			System.out.println(maintitile);

			// 處理副檔名
			String subtitle = filename.substring(filename.lastIndexOf("."));
			// path 取得workspace 在本機的workspace路徑 + 後續奇怪path
			String path = request.getSession().getServletContext().getRealPath("/");
			// 專案資料夾名稱
			String caseFolder = path.split("\\\\")[path.split("\\\\").length - 1];
			// 取得到含workspace前的絕對路徑
			String workspace = request.getSession().getServletContext().getRealPath("/").substring(0,
					path.indexOf("\\.metadata"));

			// 制式資料夾
			// 節目圖片 programimg
			// 節目音檔 programmedia
			// 會員照片 memberpic
			// 活動圖片 activitypic

			// 資料夾名稱
			String savefolder = "programmedia";

			// 制式檔案名稱
			String savefilename = id + maintitile + subtitle;

			// 檔案制式存檔名稱 待設定

			String savepath = workspace + "\\" + caseFolder + "\\WebContent\\" + savefolder + "\\" + savefilename;

			// 準備儲存檔案
			File f = new File(savepath);

			// 不存在就建立路徑
			if (!f.exists()) {
				f.mkdirs();
			}
			// 檔案寫入路徑(存檔)
			multipartFile.transferTo(f);

			// 存入資料庫預設路徑 
			return "./"+savefolder+"/"+savefilename;
		
		}
		

	
	
	
	//刪除節目===============================================================
	
	@PostMapping(path= {"/processDeletePodcast"})
	public String ProcessDeletePodcast( HttpServletRequest request,
						Model m,
						@RequestParam("delPodcastId")Integer delPodcastId) throws Exception {
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	UploadPodcastDAO upDao = (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
    	
    	upDao.delete(delPodcastId);
    	
    	//return 到managaPodcast頁面，需要重新抓一次List<upLoadPodcastBean>
    	MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		Integer memberId = memberBean.getMemberId();
//    	Integer memberId=20;
    	List<uploadPodcastBean> upList=upDao.selectAllFromMember(memberId);
    	m.addAttribute("upList",upList);
    	request.setAttribute("upList", upList);
		
		return "/PodcastManage/PodcastManage";
	}

}
