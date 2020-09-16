package podcast.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class 上傳檔案到webcontent下範例 {

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
				@RequestParam(value = "audioImg") MultipartFile audioimg) throws IllegalStateException, IOException {

			// 從session取得身分
			String id = (String) m.getAttribute("id");

			// 取得原檔案名字
			String filename = podcastmp3.getOriginalFilename();
			System.out.println(filename);

				// 取得主檔名
				String maintitile = filename.substring(0, filename.lastIndexOf("."));
				System.out.println(maintitile);
		
				// 處理副檔名
				String subtitle = filename.substring(filename.lastIndexOf("."));

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
					
				    //資料夾名稱 
					String savefolder= "programimg";
					
					//制式檔案名稱
					String savefilename=id+"這邊修改成要存的名稱"+subtitle;
					
					//檔案制式存檔名稱  待設定
					
					String  savepath=workspace+"\\"+caseFolder+"\\WebContent\\"+savefolder+"\\"+savefilename; 
					//System.out.println(workspace);
					//System.out.println(path.split("\\\\")[path.split("\\\\").length-1]);
					//System.out.println(workspace+"\\"+path.split("\\\\")[path.split("\\\\").length-1]+"\\WebContent\\"+"");
					
					//準備儲存檔案
					File f= new File(savepath);
					
					
					//不存在就建立路徑
					if(!f.exists()) {
						f.mkdirs();
					}
					// 檔案寫入路徑(存檔)
					audioimg.transferTo(f);
					
					//存入資料庫預設路徑    "./"+savefolder+"/"+savefilename
		}

}
