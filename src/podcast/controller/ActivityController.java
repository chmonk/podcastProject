package podcast.controller;
    
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import podcast.model.dao.ActivityDAO;
import podcast.model.dao.OrderTicketDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;

@Controller
@SessionAttributes({ "LoginOK", "products_DPP", "ShoppingCart","ActivityList" })
public class ActivityController {

	// 管理活動頁面
	@GetMapping("/manageActivities")
	public String showManageActivities(HttpServletRequest request,Model m, RedirectAttributes redirectAttrs) throws Exception {

		// 先確認有無登入(取得LoginOK即有)
		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
    	ActivityDAO aDao = (ActivityDAO) context.getBean("ActivityDAO");
    	List<ActivityBean> list = new LinkedList<ActivityBean>();
    	
		 if (memberBean == null) {
			 redirectAttrs.addAttribute("errorMsg", "請登入播客會員");
				return "redirect:/login";
		}	
		Integer role = memberBean.getRole();

		if (role == 2) { //0=管理員 1=一般會員 2=播客
			m.addAttribute("LoginOK", memberBean);
	 
	    	list = aDao.selectByPodcasterId(memberBean.getMemberId());				
	    	m.addAttribute("ActivityList",list);
			return "Activity/manageActivities";
		
		} else if(role == 0) {
			//m.addAttribute("LoginOK", memberBean);			
			list =aDao.selectAll();
			m.addAttribute("ActivityList",list);
			return "Activity/manageActivities";
		}
		else {
			redirectAttrs.addFlashAttribute("errorMsg", "一般會員無此權限");
			return "redirect:/login";
		}
		
		
		


	}

	// 新增活動頁面
	@RequestMapping(path = "/addActivityForm", method = RequestMethod.GET)
	public String showForm(Model m) {
		ActivityBean activity = new ActivityBean();
		m.addAttribute("ActivityBean", activity);
		return "Activity/addActivity";
	}

	// 處理活動表單
	@RequestMapping(path = "/addActivityProcess", method = RequestMethod.POST)
	public String processAction(@RequestParam("file") MultipartFile multipartFile,
			@RequestParam("radio") Integer activityStatus, HttpServletRequest request,
			@ModelAttribute("ActivityBean") ActivityBean activity, BindingResult result, Model m) throws Exception {

		// 檢查所有欄位,有空白則導回表單
		if (result.hasErrors()) {
			return "Activity/addActivity";
		}
		
		System.out.println("DATE="+activity.getActivityDate());
		

		MemberBean memberBean = (MemberBean) m.getAttribute("LoginOK");
		Integer Id = memberBean.getMemberId();
		
		String ActivityImg = processFile(Id,multipartFile,request);
		
		activity.setPodcasterId(Id);
		activity.setActivityImg(ActivityImg);
		activity.setActivityStatus(activityStatus);
		

		// 取得資料庫連線
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
		
		// 連線到活動資料表
		ActivityDAO aDao = (ActivityDAO) context.getBean("ActivityDAO");

		// 輸入表單資料至活動資料表
		aDao.insert(activity);

		//return "Activity/manageActivities";
		return "redirect:/manageActivities";

		//return "redirect:/Activity/manageActivities";
	}
	

	//測試用
	@RequestMapping(path = "/p", method = RequestMethod.GET)
	public String showActivitiess(HttpServletRequest request,Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	ActivityDAO aDao = (ActivityDAO)context.getBean("ActivityDAO");
    	List<ActivityBean> list = new LinkedList<ActivityBean>();
    	
    	list = aDao.selectAll();

		m.addAttribute("list", list);
		//return "../../ActivitiesList";
		return "/header_banner";
		//return "/index";	
	}


	public String processFile(Integer id,MultipartFile multipartFile,HttpServletRequest request) throws Exception, IOException {
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
		String savefolder = "activitypic";

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

	// 資料庫的所有活動傳送至首頁
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String showActivities(HttpServletRequest request, Model m) throws Exception {

		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		ActivityDAO aDao = (ActivityDAO) context.getBean("ActivityDAO");

		List<ActivityBean> list = new LinkedList<ActivityBean>();
		list = aDao.selectAll();
		m.addAttribute("list", list);

		//購物車商品
		Map<Integer, ActivityBean> aMap = aDao.getActivityMap();
		m.addAttribute("products_DPP", aMap);

		return "index";

	}
	
	
	@PostMapping("DeleteActivity")
	public String deleteActivity(HttpServletRequest request,
			@RequestParam("cmd")   String cmd,
			@RequestParam(value = "activityId", required = false) Integer  activityId) throws Exception {
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
    	ActivityDAO aDao = (ActivityDAO) context.getBean("ActivityDAO");
    	
    	if (cmd.equalsIgnoreCase("DEL")) {
    	boolean b = aDao.delete(activityId);
    	return "Activity/manageActivities";}
    	else {
    		return "Activity/manageActivities";	
    	}
	}
	
	@GetMapping("ActivityDetail")
	protected String ActivitrDetail(HttpServletRequest request,Model model, 
			@RequestParam("activityId") Integer activityId 
			) throws Exception {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/login";
			
		}
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);			
    	ActivityDAO aDao = (ActivityDAO) context.getBean("ActivityDAO");
		ActivityBean aBean = aDao.select(activityId);
		model.addAttribute("aBean", aBean);
		return "Activity/showSingleActivity";
		
	}

}
