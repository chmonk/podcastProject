package podcast.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;

import podcast.model.dao.MemberDAO;
import podcast.model.javabean.MemberBean;

@Controller
@SessionAttributes({ "LoginOK" })
public class RegisterController {

	// 導向新增會員頁面
	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showForm(Model m) {
		MemberBean mBean = new MemberBean();
		m.addAttribute("MemberBean", mBean);
		return "Member/registerForm";
	}

	// 接收新增會員表單
	@RequestMapping(path = "/addMemberProcess", method = RequestMethod.POST)
	public String processAction(
			@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request,
			@ModelAttribute("MemberBean") MemberBean members, BindingResult result, Model m) throws Exception {
		// 檢查所有欄位,有空白則導回表單
		if (result.hasErrors()) {
			return "Member/registerForm";
		}		
		//取得前端欄位資料
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String birthday=request.getParameter("birthday");
		String registerDate=request.getParameter("registerDate");
		String info=request.getParameter("info");
		String email=request.getParameter("email");
		String cellphone=request.getParameter("cellphone");
		String address=request.getParameter("address");
		String sex=request.getParameter("sex");
		String file=request.getParameter("file");
		String role=request.getParameter("role");
		String creditCardNumber=request.getParameter("creditCardNumber");
		String bankAccount=request.getParameter("bankAccount");
		String image = processFile2(multipartFile,request);		
		members.setImage(image);
		
		System.out.println("accunt:"+account);
		
		//資料格式判斷
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("err", errors);
			//帳號
		if(account.equals("曹圈圈")) {
			errors.put("account", "account is required");
			};
			
			//email
		String EMAIL_REGEX = "^[\w-_\.+]*[\w-_\.]\@([\w]+\.)+[\w]+[\w]$";
		if() {
			
		};
		if(!errors.isEmpty()) {
				return "Member/registerForm";
				};

		// model傳送資料
//		m.addAttribute("account", members.getAccount());
//		m.addAttribute("password", members.getPassword());
//		m.addAttribute("name", members.getName());
//		m.addAttribute("nickname", members.getNickname());
//		m.addAttribute("birthday", members.getBirthday());
//		m.addAttribute("registerDate", members.getRegisterDate());
//		m.addAttribute("info", members.getInfo());
//		m.addAttribute("email", members.getEmail());
//		m.addAttribute("cellphone", members.getCellphone());
//		m.addAttribute("address", members.getAddress());
//		m.addAttribute("sex", members.getSex());
//		m.addAttribute("image", members.getImage());
//		m.addAttribute("role", members.getRole());
//		m.addAttribute("creditCardNumber", members.getCreditCardNumber());
//		m.addAttribute("bankAccount", members.getBankAccount());
//		m.addAttribute("monthlyPayment", members.getMonthlyPayment());

		// 取得資料庫連線
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		// 連線到會員資料表
		MemberDAO mDao = (MemberDAO) context.getBean("MemberDAO");

		// 輸入表單資料至會員資料表
		mDao.insert(members);
		return "Member/registerFormResult";
	}
	
	public String processFile2(MultipartFile multipartFile,HttpServletRequest request) throws Exception, IOException {
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
		String savefolder = "memberpic";

		// 制式檔案名稱
		String savefilename = maintitile + subtitle;

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

}
