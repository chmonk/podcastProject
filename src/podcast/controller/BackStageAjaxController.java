package podcast.controller;

import java.sql.Date;
import java.util.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import antlr.collections.List;
import podcast.model.dao.BackStageDAO;
import podcast.model.dao.CategoryDAO;
import podcast.model.dao.MemberDAO;
import podcast.model.dao.OrderTicketDAO;
import podcast.model.dao.UploadPodcastDAO;
import podcast.model.javabean.ActivityBean;
import podcast.model.javabean.CategoryBean;
import podcast.model.javabean.HistoryBean;
import podcast.model.javabean.MemberBean;
import podcast.model.javabean.OrderTicketBean;
import podcast.model.javabean.ProgramCommentBean;
import podcast.model.javabean.SubscriptionBean;
import podcast.model.javabean.uploadPodcastBean;

@Controller
public class BackStageAjaxController {

	@Autowired
	private MemberDAO mDao;
	@Autowired
	private OrderTicketDAO oDao;
	
	@GetMapping(path= {"showAllMember"})
	public @ResponseBody java.util.List<MemberBean> showAllMember(Model m) {
		java.util.List<MemberBean> allMemberList=mDao.selectAll();
		m.addAttribute("allMemberList",allMemberList);
		
		
		return allMemberList;
	}
	
	@GetMapping(path= {"showAllTicketOrder"})
	public @ResponseBody java.util.List<OrderTicketBean> showAllOrder() {
		java.util.List<OrderTicketBean> allOrderList=oDao.selectAll();
		
		return allOrderList;
	}
	
}
