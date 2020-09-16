package podcast.controller;

import java.io.File;
import java.sql.Date;
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

import podcast.model.dao.ActivityDAO;
import podcast.model.javabean.ActivityBean;



@Controller
public class ActivityController {
	
	//導向管理活動頁面
	@RequestMapping(path = "/manageActivities", method = RequestMethod.GET)
	public String showManageActivities(Model m) {
		return "Activity/manageActivities";
	}
	
	//導向新增活動頁面
	@RequestMapping(path = "/addActivityForm", method = RequestMethod.GET)
	public String showForm(Model m) {
		ActivityBean activity = new ActivityBean();
		m.addAttribute("ActivityBean", activity);
		return "Activity/addActivity";
	}
	
	
	//接收新增活動表單
	@RequestMapping(path = "/addActivityProcess", method = RequestMethod.POST)
    public String processAction(@RequestParam("file") MultipartFile multipartFile,
    		@RequestParam("radio") int activityStatus,
    		HttpServletRequest request,@ModelAttribute("ActivityBean") ActivityBean activity,
    		BindingResult result, Model m) throws Exception {
    	
		//檢查所有欄位,有空白則導回表單
		if(result.hasErrors()) {
    		return "Activity/addActivity";
    	}
    	
		//model傳送資料
    	m.addAttribute("activityName", activity.getActivityName());
    	m.addAttribute("activityDate", activity.getActivityDate());
    	m.addAttribute("activityLocation", activity.getActivityLocation());
    	m.addAttribute("activityContent", activity.getActivityContent());
    	m.addAttribute("activityPrice", activity.getActivityPrice());
    	
    	//設定圖片檔名為活動日期
    	Date activityDate =activity.getActivityDate();
    	System.out.println("activityId:" + activityDate);
    	String fileName =activityDate.toString();
    	//String fileName = multipartFile.getOriginalFilename();
    	System.out.println("fileName:" + fileName);
    	     
    	//設定圖片存檔路徑
    	String savePath ="C:\\SpringSource\\springworkspace\\PodcastProject2\\WebContent\\WEB-INF\\resources\\images\\"+fileName+".jpg";
    	//String savePath ="C:\\DataSource\\workspace\\0906PodcastProject\\WebContent\\WEB-INF\\resources\\images\\"+fileName+".jpg";
    	//String savePath = request.getSession().getServletContext().getRealPath("/") 
    	// + "uploadTempDir\\" + fileName;

    	//存圖片到指定路徑
    	File saveFile = new File(savePath);
    	multipartFile.transferTo(saveFile);
    	
    	//設定圖片路徑及活動狀態(以@RequestParam取值的屬性)
    	activity.setActivityImg(savePath);
    	activity.setActivityStatus(activityStatus);
    	
    	//取得資料庫連線
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	//連線到活動資料表
    	ActivityDAO aDao = (ActivityDAO)context.getBean("ActivityDAO");
    	
    	//輸入表單資料至活動資料表
    	aDao.insert(activity);
    	
    	return "Activity/manageActivities";
    }
	
	
	//資料庫的所有活動傳送至首頁
	@RequestMapping(path = "/a", method = RequestMethod.GET)
	public String showActivities(HttpServletRequest request,Model m) throws Exception {
		
		ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	
    	ActivityDAO aDao = (ActivityDAO)context.getBean("ActivityDAO");
    	List<ActivityBean> list = new LinkedList<ActivityBean>();
    	
    	list = aDao.selectAll();

		m.addAttribute("list", list);
		//return "../../ActivitiesList";
		return "../../index";
		//return "../index";
	}
	
	
	

}
