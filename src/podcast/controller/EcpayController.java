package podcast.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

public class EcpayController {
	public static AllInOne all;
	@RequestMapping(value = "/greenPay.controller")

	public String greenPay(

			@CookieValue(name="totalCookie") String shoppingCartTotal, 

			Model m) {

		try {

			initial();

			AioCheckOutOneTime obj = new AioCheckOutOneTime();// 產生信用卡一次付清訂單物件

			

			// String total = importedData.get(importedData.size()-1);// 抓取總金額

			String id = "temporaryID";// 取得會員 利用會員Id跟日期 創建訂單編號



			Date date = new Date();// 目前時間

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");// 設定日期格式 給訂單編號用

			String dateString = sdf.format(date);// 進行轉換

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 設定日期格式 給日期用

			String dateStringToMerchantTradeDate = sdf1.format(date);// 進行轉換

			String merchantTradeNo = id.toString() + dateString;// 合併訂單編號

			

			System.out.println("有進綠界");

			obj.setMerchantTradeNo(dateString);

			obj.setMerchantTradeDate(dateStringToMerchantTradeDate);

			obj.setTotalAmount(shoppingCartTotal);

			obj.setTradeDesc("FarmVille測試商品");

			obj.setItemName("FarmVille測試商品");

			obj.setReturnURL("http://211.23.128.214:5000");

			obj.setClientBackURL("http://localhost:8080/EEIT111FinalProject/front_intro.jsp");

			obj.setNeedExtraPaidInfo("N");

			String form = all.aioCheckOut(obj, null);

			

			m.addAttribute("form", form);




			System.out.println(form);



			return "greenTest";

			

		} catch (Exception e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

		

	

		return "greenTest";

	}
	private static void initial(){
		all = new AllInOne("");
	}


}
