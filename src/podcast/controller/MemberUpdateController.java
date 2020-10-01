package podcast.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
public class MemberUpdateController {
	
	
	@Autowired
	MemberDAO mdao;

	// 導向修改會員頁面
	@RequestMapping(path = "/update", method = RequestMethod.GET)
	public String showForm(Model m) {
		MemberBean mBean = (MemberBean) m.getAttribute("LoginOK");
		Integer memberid = mBean.getMemberId();		
		MemberBean memberData = mdao.selectPodcaster(memberid);
		m.addAttribute("MemberBean", memberData);
		return "Member/updateMember2";
	}

	// 接收修改會員表單
	@RequestMapping(path = "/updateMemberProcess", method = RequestMethod.POST)
	public String processAction(@RequestParam(value="file",required= false) MultipartFile multipartFile, HttpServletRequest request,
			@ModelAttribute("MemberBean") MemberBean members, BindingResult result, Model m,
			@RequestParam(value="oldImage",required= false)String oldImage) throws Exception {
		// 檢查所有欄位,有空白則導回表單
		if (result.hasErrors()) {
			return "Member/updateMember2";
		}
		
		System.out.println(multipartFile);
		System.out.println(oldImage);
		
		Boolean b =multipartFile.isEmpty();
		
		
		if(!b) {
		String image = processFile2(multipartFile, request);
		members.setImage(image);
		}else {
			members.setImage(oldImage);
		}
		
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String birthday = request.getParameter("birthday");
		String registerDate = request.getParameter("registerDate");
		String info = request.getParameter("info");
		String email = request.getParameter("email");
		String cellphone = request.getParameter("cellphone");
		String address = request.getParameter("address");
		String sex = request.getParameter("sex");
		String file = request.getParameter("file");
		String role = request.getParameter("role");
		String creditCardNumber = request.getParameter("creditCardNumber");
		String bankAccount = request.getParameter("bankAccount");
		

		System.out.println("accunt:" + account);

		//===============
//		// 資料格式判斷
//		Map<String, String> errors = new HashMap<String, String>();
//		request.setAttribute("err", errors);
//		// 帳號
//		if (account == null || account.length() == 0) {
//			errors.put("account", "account is required");
//		}
//		;
//		// 密碼
//		if (password == null || password.length() == 0) {
//			errors.put("password", "password is required");
//		}
//		;
//		if (!password.matches(".*\\d+.*")) {
//			errors.put("password", "password 需含有數字");
//		}
//		;
//		if (!password.matches(".*[a-zA-Z]+.*")) {
//			errors.put("password", "password 需含有大小寫字母");
//		}
//		;
//		if (password.matches(".*[~!@#$%^&*_+|<>,.?/:;'\\[\\]{}\"]+.*")) {
//			errors.put("password", "不得含有特殊字元");
//		}
//		;
//		// name
//		if (name == null || name.length() == 0) {
//			errors.put("name", "name is required");
//		}
//		;
//		// nickname
//		if (nickname == null || nickname.length() == 0) {
//			errors.put("nickname", "nickname is required");
//		}
//		;
//		if (nickname.matches(".*[~!@#$%^&*_+|<>,.?/:;'\\[\\]{}\"]+.*")) {
//			errors.put("nickname", "不得含有特殊字元");
//		}
//		;
//		// birthday
//		if (birthday == null || birthday.length() == 0) {
//			errors.put("birthday", "birthday is required");
//		}
//		;
//	
//		String regex1 = "^((19|20)[0-9]{2})//((0?2-((0?[1-9])|([1-2][0-9])))|(0?(1|3|5|7|8|10|12)//((0?[1-9])|([1-2][0-9])|(3[0-1])))|(0?(4|6|9|11)//((0?[1-9])|([1-2][0-9])|30)))$";
//			// 開始判斷,且符合正則表達式
//			if (birthday.matches(regex1)) {
//				// 分割截取0年份1月份2日
//				String[] dateSplit = birthday.split("/");
//				// 判斷輸入的月份是否是二月，輸入的是二月的話，還需要判斷該年是否是閏年
//				if ("02".equals(dateSplit[1]) || "2".equals(dateSplit[1])) {
//					int year = Integer.parseInt(dateSplit[0]);
//					// 不是閏年,需要判斷日是否大於28
//					if (!(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
//						int day = Integer.parseInt(dateSplit[2]);
//						if (day > 28) {
//							errors.put("birthday", "格式錯誤");
//
//						}
//					}
//				}
//			}
//
//		
//		
//
////		// registerDate
////		if (registerDate == null || registerDate.length() == 0) {
////			errors.put("registerDate", "registerDate is required");
////		}
////		;
////		if (registerDate.matches(regex1)) {
////			// 分割截取0年份1月份2日
////			String[] dateSplit = registerDate.split("/");
////			// 判斷輸入的月份是否是二月，輸入的是二月的話，還需要判斷該年是否是閏年
////			if ("02".equals(dateSplit[1]) || "2".equals(dateSplit[1])) {
////				int year = Integer.parseInt(dateSplit[0]);
////				// 不是閏年,需要判斷日是否大於28
////				if (!(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
////					int day = Integer.parseInt(dateSplit[2]);
////					if (day > 28) {
////						errors.put("registerDate", "格式錯誤");
////
////					}
////				}
////			}
////		}
////		;
//		// 自我介紹
//		if (info == null || info.length() == 0) {
//			errors.put("info", "info is required");
//		}
//		;
//		if (info.matches(".*[~!@#$%^&*_+|<>,.?/:;'\\[\\]{}\"]+.*")) {
//			errors.put("info", "不得含有特殊字元");
//		}
//		;
//		// email
//		String EMAIL_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
//				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//		Pattern p = Pattern.compile(EMAIL_REGEX);
//		Matcher mr = p.matcher(email);
//
//		if (email == null || email.length() == 0) {
//			errors.put("email", "account is required");
//		}
//		;
//		if (!mr.matches()) {
//			errors.put("email", "格式錯誤");
//		}
//		;
//
//		// cellphone
//		if (cellphone == null || cellphone.length() == 0) {
//			errors.put("cellphone", "cellphone is required");
//		}
//		;
////		IF (!CELLPHONE.MATCHES("^[0-9]*$") || CELLPHONE.LENGTH() < 10) {
////			ERRORS.PUT("CELLPHONE", "格式錯誤(只能輸入數字)");
////		}
////		;
//		// file
////			if(file==null || file.length()==0) {
////				errors.put("file", "file is required");
////				};
//		// role
//		if (role == "") {
//			errors.put("role", "role is required");
//		}
//		;
////		// creditCardNumber
////		if (creditCardNumber == null || creditCardNumber.length() == 0) {
////			errors.put("creditCardNumber", "creditCardNumber is required");
////		}
////		;
////		if (!creditCardNumber.matches("^[0-9]*$") || creditCardNumber.length() < 16) {
////			errors.put("creditCardNumber", "格式錯誤(只能輸入數字)");
////		}
////		;
//		
//		////////////////////////////////////////////////////////////////////
//		if (!errors.isEmpty()) {
//			return "Member/updateMember2";
//		}
//		;
//		// model傳送資料
////		m.addAttribute("account", members.getAccount());
////		m.addAttribute("password", members.getPassword());
////		m.addAttribute("name", members.getName());
////		m.addAttribute("nickname", members.getNickname());
////		m.addAttribute("birthday", members.getBirthday());
////		m.addAttribute("registerDate", members.getRegisterDate());
////		m.addAttribute("info", members.getInfo());
////		m.addAttribute("email", members.getEmail());
////		m.addAttribute("cellphone", members.getCellphone());
////		m.addAttribute("address", members.getAddress());
////		m.addAttribute("sex", members.getSex());
////		m.addAttribute("image", members.getImage());
////		m.addAttribute("role", members.getRole());
////		m.addAttribute("creditCardNumber", members.getCreditCardNumber());
////		m.addAttribute("bankAccount", members.getBankAccount());
////		m.addAttribute("monthlyPayment", members.getMonthlyPayment());
//
//		
		//===============
		// 取得資料庫連線
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		// 連線到會員資料表
		MemberDAO mDao = (MemberDAO) context.getBean("MemberDAO");

		MemberBean mBean = (MemberBean) m.getAttribute("LoginOK");
		String acc = mBean.getAccount();

		// 更新表單資料至會員資料表
		mDao.update(acc, members);
		return "Member/registerFormResult";
	}

	public String processFile2(MultipartFile multipartFile, HttpServletRequest request) throws Exception, IOException {
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
		return "./" + savefolder + "/" + savefilename;

	}

}
