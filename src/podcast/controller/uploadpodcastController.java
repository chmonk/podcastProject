package podcast.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;

import podcast.model.dao.HistoryDao;
import podcast.model.dao.LikeRecordDAO;
import podcast.model.dao.MyFavProgramDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.HistoryOrderProgramBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({ "id" })
public class uploadpodcastController {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	UploadPodcastDAO upDao;
	
	@Autowired
	HistoryDao hdao;
	
	@Autowired
	HttpServletRequest request;
	
	// 導向上船頁面
	@GetMapping(path = "/podcastupload")
	public String turntouploadPC(HttpServletRequest request,Model m) throws Exception {
		
			
		// System.out.println(request.getContextPath()); // /SpringWebProject
		// System.out.println(context.getRealPath("/")); //
		// C:\eclipse_202003ForSpring\SpringWorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\webapps\formal
		// pod project\
		// System.out.println(request. getServletPath()); // /podcastupload
		// System.out.println(request. getRequestURI()); //
		// /SpringWebProject/podcastupload
		// System.out.println(request. getPathTranslated()); //null
		// System.out.println(request.getSession().getServletContext().getRealPath("/"));  
		// C:\eclipse_202003ForSpring\SpringWorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\webapps\formal pod project\
		

		//path 取得workspace 在本機的workspace路徑 + 後續奇怪path
		String path=request.getSession().getServletContext().getRealPath("/");
		// 專案資料夾名稱
		String caseFolder = path.split("\\\\")[path.split("\\\\").length-1];
		//取得到含workspace前的絕對路徑
		String workspace=request.getSession().getServletContext().getRealPath("/").substring(0,path.indexOf("\\.metadata"));
		
		//制式資料夾  
		//節目圖片 program file
		//節目音檔
		//會員照片
		//活動圖片
		
		
		
		//檔案制式存檔名稱  待設定
		String  filename="";
		
		String  savepath=workspace+"\\"+caseFolder+"\\WebContent\\"+filename ; 
		System.out.println(workspace);
		System.out.println(path.split("\\\\")[path.split("\\\\").length-1]);
		System.out.println(workspace+"\\"+path.split("\\\\")[path.split("\\\\").length-1]+"\\WebContent\\"+"");
		
		File f= new File(savepath);
		
		if(!f.exists()) {
			f.mkdirs();
		}
	
		
		
		uploadPodcastBean ubean=new uploadPodcastBean();
			

		// 給入偽身分 id17 阿滴日文  //接上
		m.addAttribute("id", "18");
		//System.out.println(upDao.select(31).getUploadTime().toString());
		return "playerBar/pcupload";
		
		
	}

	
	
	
	
	
	
	// 表單上傳資料
	@PostMapping(path = "/uploadpc")
	public void uploadinfo(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(value = "title") String title,
			// 種類是數字傳入
			@RequestParam(value = "class", defaultValue = "1") Integer categoryId,
			@RequestParam(value = "podcastInfo") String podcastInfo,
			@RequestParam(value = "openPayment") Integer openPayment,
			@RequestParam(value = "openComment") Integer openComment,
			@RequestParam(value = "audio") MultipartFile podcastmp3,
			@RequestParam(value = "audioImg") MultipartFile audioimg) throws Exception {

		// 從session取得身分 轉成數字
		Integer id = Integer.parseInt((String) m.getAttribute("id"));
		
				
				uploadPodcastBean ubean= new uploadPodcastBean();	
				
				//抓亂數給予音檔節目有異樣的特別值
				Integer spec= (int)Math.ceil((Math.random()*1000));
				
				
				ubean.setCategoryId(categoryId);;
				ubean.setMemberId(id);
				ubean.setOpenComment(openComment);
				ubean.setOpenPayment(openPayment);
				ubean.setPodcastInfo(podcastInfo);
				ubean.setTitle(title);
				ubean.setAudioPath(uploadFilepath(podcastmp3,id,spec));
				ubean.setAudioimg(uploadFilepath(audioimg,id,spec));
				ubean.setClickAmount(0);
				ubean.setUploadTime(new Date());
				ubean.setLikesCount(0);
				upDao.insert(ubean);
	
				//存入資料庫預設路徑    "./"+savefolder+"/"+savefilename  setAudioPath
	}
	
	
	//判別節目得圖片  音檔分別儲存與上傳
	public String uploadFilepath(MultipartFile uploadfile,Integer id,Integer spec) throws Exception, IOException {
		// 取得原檔案名字
				String filename = uploadfile.getOriginalFilename();
				System.out.println(filename);

					// 取得主檔名
					String maintitile = filename.substring(0, filename.lastIndexOf("."));
					System.out.println(maintitile);
			
					// 處理副檔名
					String subtitle = filename.substring(filename.lastIndexOf("."));
					System.out.println(subtitle);
						// System.out.println(request.getContextPath()); // /SpringWebProject
						// System.out.println(context.getRealPath("/")); //
						// C:\eclipse_202003ForSpring\SpringWorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\webapps\formal
						// pod project\
						// System.out.println(request. getServletPath()); // /podcastupload
						// System.out.println(request. getRequestURI()); //
						// /SpringWebProject/podcastupload
						// System.out.println(request. getPathTranslated()); //null
						// System.out.println(request.getSession().getServletContext().getRealPath("/"));  
						// C:\eclipse_202003ForSpring\SpringWorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\webapps\formal pod project\
						

						//path 取得workspace 在本機的workspace路徑 + 後續奇怪path
						String path=request.getSession().getServletContext().getRealPath("/");
						// 專案資料夾名稱
						String caseFolder = path.split("\\\\")[path.split("\\\\").length-1];
						//取得到含workspace前的絕對路徑
						String workspace=request.getSession().getServletContext().getRealPath("/").substring(0,path.indexOf("\\.metadata"));
						
						
						
						//制式資料夾  
						//節目圖片 programimg
						//節目音檔 programmedia
						//會員照片 memberpic
						//活動圖片 activitypic
						
						String savefolder="";
						String savefilename="";
						
						
						
						//處理音訊
						if(subtitle.equals(".mp3")||subtitle.equals(".MP3")) {
							//資料夾名稱 
							System.out.println("song");
							 savefolder= "programaudio";
							
							//制式檔案名稱
							//String savefilename=id+"這邊修改成要存的名稱"+subtitle;
							 savefilename=id+"_"+spec+"_audio"+subtitle;
							
						}else if(subtitle.equals(".png")|| subtitle.equals(".jpg") || subtitle.equals(".jpeg")) {
							//資料夾名稱 
							System.out.println("img");

							 savefolder= "programimg";
							
							//制式檔案名稱
							//String savefilename=id+"這邊修改成要存的名稱"+subtitle;
							 savefilename=id+"_"+spec+"_img"+subtitle;
						}
						
							String  savepath=workspace+"\\"+caseFolder+"\\WebContent\\"+savefolder+"\\"+savefilename; 
							//System.out.println(workspace);
							//System.out.println(path.split("\\\\")[path.split("\\\\").length-1]);
							//System.out.println(workspace+"\\"+path.split("\\\\")[path.split("\\\\").length-1]+"\\WebContent\\"+"");
							System.out.println(savepath);
							//準備儲存檔案
							File f= new File(savepath);
							
							
							//不存在就建立路徑
							if(!f.exists()) {
								f.mkdirs();
							}
							// 檔案寫入路徑(存檔)
							uploadfile.transferTo(f);
							
							return "./"+savefolder+"/"+savefilename;				
	}
	
	
		//當刪除節目時   刪除對應節目瀏覽紀錄  點讚紀錄  我的最愛紀錄
	     @GetMapping(value = "/deleteProgram/{podcastId}")
	     public void deleteProgramRelatedDate(HttpServletRequest request,
	    		 Model m,
	    		 @PathVariable Integer podcastId
	    		 ) throws Exception {
	    	 
	    	 	ServletContext app = request.getServletContext();
	    	 	
	    	 	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
	    	 	
	    	 	UploadPodcastDAO updao= (UploadPodcastDAO)context.getBean("UploadPodcastDAO");
	    	 	
	    	 	updao.delete(podcastId);
	    	 	
	    	 	HistoryDao hdao= (HistoryDao)context.getBean("HistoryDao");
	    	 	
	    	 	hdao.deleteByPodcastId(podcastId);
	    	 	
	    	 	LikeRecordDAO ldao=(LikeRecordDAO)context.getBean("LikeRecordDAO");
	    	 	
	    	 	ldao.detelePodcastId(podcastId);
	    	 	
//	    	 	MyFavProgramDAO myfavDao = (MyFavProgramDAO)context.getBean("MyFavProgramDAO");
//	    	 
//	    	 	myfavDao.deteleByPodcastId(podcastId);
	    	 	//test 
	    	 	System.out.println("delete podcastid "+ podcastId +" and related browsing history, likerecord");
	     }
	
	     
	     //吃表單內容   修改節目bean  回到原設定頁面
	     
	     public String updateProgram(Integer podcastId) throws Exception {
	    	 
	    	 uploadPodcastBean ubean = upDao.select(podcastId);
	    	 
	    	 
	    	 
	    	 return "";
	     }
	     
	     @GetMapping("/testsql")
	     public void testsql() {
	        System.out.println("run native");
	        
	     
	    	 List<HistoryOrderProgramBean> hopbeanList = hdao.selectHistoryByMemberId2(1);
	    	 
	    	 
	    	 for(HistoryOrderProgramBean hpbean:hopbeanList) {
	    		 System.out.println(hpbean.getPodcastId()+" "+hpbean.getUploadTime());
	    	 }
	     }

}
