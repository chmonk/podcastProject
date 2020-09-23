package podcast.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

//import _00_init.util.GlobalService;
import podcast.model.javabean.MemberBean;
import podcast.model.dao.ActivityDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.javabean.LoginBean;



@Controller
@SessionAttributes({"LoginOK"})
public class LoginController {
	
	String loginForm = "login";

	@GetMapping("login")
    public String loginForm() throws Exception {
		return "login";
	}
	
	@PostMapping("/login")   // = login.jsp的login.do路徑
	public String checkAccount(
			@ModelAttribute("loginBean") LoginBean bean,
			BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Entering login process");
		
		
		String password =bean.getPassword();
		String account =bean.getUserId();

		
		System.out.println("account & password= "+account+" "+password);
		MemberBean memberbean = new MemberBean();
		
		
    	ServletContext app = request.getServletContext();
    	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(app);
    	

    	MemberDAO mdao = (MemberDAO)context.getBean("MemberDAO");
		

		try {
			memberbean = mdao.checkIdPassword(account,password);
			if (memberbean != null) {
				// 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				model.addAttribute("LoginOK", memberbean);
			} else {
				// 登入失敗, 放相關的錯誤訊息到 errorMsgMap 之內
				result.rejectValue("invalidCredentials", "", "該帳號不存在或密碼錯誤");
				return loginForm;
			}
		} catch (RuntimeException ex) {
			result.rejectValue("invalidCredentials", "", ex.getMessage());
			ex.printStackTrace();
			return loginForm;
		}
		processCookies(bean, request, response);
		
		//管理員身分導至後台頁面
		if(memberbean.getRole()==0) {
			return "/BackStage/BackStageSelectStyle";
		}
		return "redirect:/";
		
	}
	
	
	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String account = bean.getUserId();
		String password = bean.getPassword();
		Boolean rm = bean.isRememberMe();
		
		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (rm) {
			cookieUser = new Cookie("user", account);
			cookieUser.setMaxAge(7 * 24 * 60 * 60);       // Cookie的存活期: 七天
			cookieUser.setPath(request.getContextPath());

			//String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUser = new Cookie("user", account);
			cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());

			//String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		
	}
}
