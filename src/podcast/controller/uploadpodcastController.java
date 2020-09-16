package podcast.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.uploadPodcastBean;

@Controller
@SessionAttributes({ "id" })
public class uploadpodcastController {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	UploadPodcastDAO upDao;

	// 導向上船頁面
	@GetMapping(path = "/podcastupload")
	public String turntouploadPC(Model m) throws Exception {
		
		
		
		Session session= sessionFactory.getCurrentSession();
		
		uploadPodcastBean ubean= new uploadPodcastBean();
		
		//
//		private Integer podcastId;
//		private String title;
//		private Integer categoryId;
//		private Integer memberId;
//		private String podcastInfo;
//		private Integer openPayment;
//		private Integer openComment;
//		private Date uploadTime;
//		private Integer clickAmount;
//		private String audioPath;
//		private String audioimg;
//		private Integer likesCount;
		
		
		ubean.setCategoryId(1);
		ubean.setMemberId(15);
		ubean.setOpenComment(1);
		ubean.setOpenPayment(1);
		ubean.setPodcastInfo("ttttt");
		ubean.setTitle("yhcjsdkc");
		upDao.insert(ubean);
		

		// 給入偽身分 id17 阿滴日文
		m.addAttribute("id", "17");
		return "playerBar/pcupload";
	}

	// 表單上傳資料
	@PostMapping(path = "/uploadpc")
	public void uploadinfo(HttpServletRequest req, HttpServletResponse res, Model m,
			@RequestParam(value = "title") String title,
			// 種類是數字傳入
			@RequestParam(value = "class", defaultValue = "1") Integer categoryId,
			@RequestParam(value = "podcastInfo") String podcastInfo,
			@RequestParam(value = "openPayment") Integer openPayment,
			@RequestParam(value = "openComment") Integer openComment,
			@RequestParam(value = "audio") MultipartFile podcastmp3,
			@RequestParam(value = "audioImg") MultipartFile audioimg) throws IllegalStateException, IOException {

		// 從session取得身分
		String id = (String) m.getAttribute("id");

		System.out.println(title);
		// category要抓處理
		System.out.println(categoryId);
		System.out.println(podcastInfo);
		System.out.println(openPayment);
		System.out.println(openComment);

		// 儲存podcast audio
		// 取得原檔案名字
		String filename = podcastmp3.getOriginalFilename();
		System.out.println(filename);

		System.out.println(req.getSession().getServletContext().getRealPath("/"));

		// 取得主檔名
		String maintitile = filename.substring(0, filename.lastIndexOf("."));
		System.out.println(maintitile);

		// 處理副檔名
		String subtitle = filename.substring(filename.lastIndexOf("."));

		// 建立存檔路徑string d:
		String savepath = "c:programTestFile\\" + id + "\\";

		// 生成存檔路徑
		File saveFile = new File(savepath);

		// 確認存檔路徑 不存在就新建
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		System.out.println(savepath);

		// 檔案寫入路徑
		podcastmp3.transferTo(saveFile);

		// 儲存podcast img
		// 取得原檔案名字
		String imgFilename = audioimg.getOriginalFilename();
		System.out.println(imgFilename);

		// 處理附檔名
		String imgsubtitle = imgFilename.substring(imgFilename.lastIndexOf("."));
		// 建立存檔路徑string d:
		String imgsavepath = "d:\\podimg\\" + title + "01" + imgsubtitle;

		// 生成存檔路徑
		File imgsaveFile = new File(imgsavepath);

		// 確認存檔路徑 不存在就新建
		if (!imgsaveFile.exists()) {
			imgsaveFile.mkdirs();
		}
		System.out.println(imgsavepath);

		// 檔案寫入路徑
		audioimg.transferTo(imgsaveFile);

	}

}
