package com.cmpe281.multitenant;

import java.text.DateFormat;
import java.util.ArrayList;
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
import com.cmpe281.multitenant.Manager.ProjectManager;
import com.cmpe281.multitenant.Manager.UserManager;
import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.Utility.Utility;

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
		getAllProjects();
		
		
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
	
	public void signIn(){

		String userName = "vishwa.desai@sjsu.edu";
		String password = "password";

		User user = new User();
		user.setEmail(userName);
		user.setPassword(Utility.getEncryptedValue(password));

		boolean signInResult;

		signInResult = UserManager.verifyLogin(user);

		if(signInResult)
			System.out.println("Login SuccessFul");
		else
			System.out.println("Login Failed");
	}

	public void saveUser(){
		String userName = "vishwa.desai@sjsu.edu";
		String password = "password";
		String fullname ="Vishwa Desai";

		if(userName == null||password == null){
			//redirect to error page
		}
		User user = new User();
		user.setEmail(userName);
		user.setPassword(Utility.getEncryptedValue(password));
		user.setFullName(fullname);

		UserManager.saveUser(user);

	}

	public void saveProject(){

		String userId = "Rutvik.dudhia2@gmail.com";
		String projectName = "My Second Scrum";
		int tenantId = 3;
		String sprintName = "Sprint 2";
		int sprintDuration = 10;
		Date startDate = new Date();


		Project project = new Project();

		project.setUserId(userId);
		project.setProjectName(projectName);
		project.setSprintDuration(sprintDuration);
		project.setTenantId(tenantId);
		project.setStartDate(startDate);
		project.setSprintName(sprintName);

		ArrayList<Data>data = new ArrayList<Data> ();
		
		project.setData(data);

		try {
			ProjectManager.saveProject(project);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getAllProjects(){
		String userId = "Rutvik.dudhia2@gmail.com";
		try {
			List<Project> projectList = ProjectManager.getAllProjects(userId);
			if(projectList.size() > 0){
				for (Project project : projectList) {
					System.out.println("Project"+project.toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String getProject(){
		String projectId = "";
		try {
			Project project = ProjectManager.getProject(projectId);
			if(project != null){
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
