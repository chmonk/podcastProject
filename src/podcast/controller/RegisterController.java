package podcast.controller;

import java.io.File;
import java.sql.Date;
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

import podcast.model.dao.MemberDAO;
import podcast.model.javabean.MemberBean;

@Controller
public class RegisterController {

	// 導向新增會員頁面
	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showForm(Model m) {
		MemberBean activity = new MemberBean();
		m.addAttribute("MemberBean", activity);
		return "Member/registerForm";
	}

	// 接收新增會員表單
	@RequestMapping(path = "/addMemberProcess", method = RequestMethod.POST)
	public String processAction(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request,
			@ModelAttribute("MemberBean") MemberBean members, BindingResult result, Model m) throws Exception {
		// 檢查所有欄位,有空白則導回表單
		if (result.hasErrors()) {
			return "Member/registerForm";
		}

		// model傳送資料
		m.addAttribute("account", members.getAccount());
		m.addAttribute("password", members.getPassword());
		m.addAttribute("name", members.getName());
		m.addAttribute("nickname", members.getNickname());
		m.addAttribute("birthday", members.getBirthday());
		m.addAttribute("registerDate", members.getRegisterDate());
		m.addAttribute("info", members.getInfo());
		m.addAttribute("email", members.getEmail());
		m.addAttribute("cellphone", members.getCellphone());
		m.addAttribute("address", members.getAddress());
		m.addAttribute("sex", members.getSex());
		m.addAttribute("image", members.getImage());
		m.addAttribute("role", members.getRole());
		m.addAttribute("creditCardNumber", members.getCreditCardNumber());
		m.addAttribute("bankAccount", members.getBankAccount());
		m.addAttribute("monthlyPayment", members.getMonthlyPayment());

		// 設定圖片檔名為活動日期
		Date registerDate = members.getRegisterDate();
		System.out.println("memberId:" + registerDate);
		String fileName = registerDate.toString();
		System.out.println("fileName:" + fileName);

		// 設定圖片存檔路徑
		String savePath = "C:\\temp\\" + fileName + ".jpg";

		// 存圖片到指定路徑
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);

		// 取得資料庫連線
		ServletContext app = request.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);

		// 連線到會員資料表
		MemberDAO mDao = (MemberDAO) context.getBean("MemberDAO");

		// 輸入表單資料至會員資料表
		mDao.insert(members);
		return "Member/registerFormResult";
	}

}
