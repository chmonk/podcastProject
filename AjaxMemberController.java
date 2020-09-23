package _01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _00.model.Members;
import _00.service.MemberService;
import _00.service.MemberServiceForUpdate;

@Controller
@RequestMapping("/_01/ajax")
public class AjaxMemberController {
	@Autowired
	MemberService service;
	
	@Autowired
	MemberServiceForUpdate serviceUpdate;
	
	public AjaxMemberController() { 	}

	// 當新增會員資料時, 檢查帳號是否可用
	@PostMapping(value = "/_02/CheckMemberId", produces = { "application/json" })
	public @ResponseBody Map<String, String> checkMemberId(
			@RequestParam("id") String memberId) {
		Map<String, String> map = new HashMap<>();
		String id = service.checkMemberId(memberId);
		map.put("id", id);
		return map;
	}
	// 讀取瀏覽器送出Ajax請求， 呼叫 service.saveMember(member);
	// 進行新增會員資料
	@PostMapping(value={"/_02/members", "/_03/members"})
	public @ResponseBody Map<String, String> save(@RequestBody Members members) {
		Map<String, String> map = new HashMap<>();
		int n = 0;
		try {
			n = service.saveMember(members);
			if (n == 1) {
				map.put("success", "新增成功");
			} else if (n == -1) {
				map.put("fail", "帳號重複");
			}
		} catch(Exception e) {
			map.put("fail", e.getMessage());
		}
		return map;
	}

	// 查詢所有會員資料
	@GetMapping(value = {"/_03/members", "/members"})
	public @ResponseBody List<Members> queryAllMembersJSP(Model model) {
		List<Members> members = service.findAllMembers();
		return members;
	}
	
	
	// 修改單筆會員資料
	@PutMapping(value = "/_03/members/{key}", 
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> updateMember(
			            @RequestBody Members members, @PathVariable Integer key) {
		Members member0 = null; 
		if (key != null) {
			member0 = serviceUpdate.findByPrimaryKey(key);
			if (member0 == null) {
				throw new RuntimeException("鍵值不存在, key=" + key);
			}
			serviceUpdate.evictMember(member0);
		} else {
			throw new RuntimeException("鍵值不存在, key=" + key);
		}
		copyUnupdateField(member0, members);
		
		Map<String, String> map = new HashMap<>();
		try {
     		service.updateMember(members);
			map.put("success", "更新成功");
		} catch(Exception e) {
			e.printStackTrace();
			map.put("fail", "更新失敗");
		}
		return map;
	}
	
	private void copyUnupdateField(Members member0, Members members) {
		members.setExtra(member0.getExtra());
	}
	
	// 讀取並傳回單筆會員資料
	@GetMapping(value = "/_03/members/{key}", produces= {"application/json"})
	public @ResponseBody  Members displayMember(@PathVariable Integer key) {
		Members members = service.findByPrimaryKey(key);
		return members;
	}
	// 依照鍵值刪除單筆會員資料	
	@DeleteMapping(value = "/_03/members/{key}")
	public @ResponseBody Map<String, String>   deleteMember(@PathVariable(required = true) Integer key) {
		Map<String, String> map = new HashMap<>();
		try {
			service.deleteMemberByPrimaryKey(key);
			map.put("success", "刪除成功");
		} catch(Exception e) {
			e.printStackTrace();
			map.put("fail", "刪除失敗");
			System.out.println("刪除失敗");
		}
		return map;
	}
}
