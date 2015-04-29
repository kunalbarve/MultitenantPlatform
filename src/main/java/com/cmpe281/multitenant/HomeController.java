package com.cmpe281.multitenant;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cmpe281.multitenant.DAO.MetadataDAO;
import com.cmpe281.multitenant.Manager.UserManager;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.User;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
//		getMetaData();
		
		
		return "home";
	}
	
	public String getMetaData(){
		int tenantId = 2;
		List<MetaData> metaDataDetails = MetadataDAO.getAttributeDetails(tenantId);
		for (MetaData metaData : metaDataDetails) {
			System.out.println("Metadata:"+metaData.toString());
		}
		return "";
	}
	
	public String getUser(){
		String userName = "";
		String password = "";
		
		User user = new User();
		user.setEmail(userName);
		user.setPassword(password);
		
		UserManager.getUser(user);
		return "";
	}
	
}
