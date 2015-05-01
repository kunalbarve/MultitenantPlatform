package com.cmpe281.multitenant;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cmpe281.multitenant.DAO.DataSequenceDAO;
import com.cmpe281.multitenant.DAO.MetadataDAO;
import com.cmpe281.multitenant.Manager.DataManager;
import com.cmpe281.multitenant.Manager.ProjectManager;
import com.cmpe281.multitenant.Manager.UserManager;
import com.cmpe281.multitenant.Model.Attribute;
import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.Utility.ApplicationConstants;
import com.cmpe281.multitenant.Utility.Utility;
import com.cmpe281.multitenant.VO.ProjectDetails;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		saveProject();
		
		return "index";
	}
	
	//-------------------------------------------------------------  User Mappings ------------------------------------------------------
	
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String signIn(Model model,String userName,String password){
		
	
		System.out.println("Username :"+userName);
		System.out.println("Passowrd :"+password);
		User user = new User();
		user.setEmail(userName);
		user.setPassword(Utility.getEncryptedValue(password));
		
		System.out.println("Sign In Called");

		boolean signInResult = false;

		try {
			signInResult = UserManager.verifyLogin(user);
			if(signInResult){
				viewProjectDetails(user.getEmail(), model);
				return "project_screen";
			}else
				return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
		}
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String goToSignUp(){
		return "add_project";
	}

	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public String signup(Model model, String email, String firstName, String lastName, String password){
		
		String fullname = firstName.trim()+ " "+ lastName.trim();

		User user = new User();
		user.setEmail(email);
		user.setPassword(Utility.getEncryptedValue(password));
		user.setFullName(fullname);

		try {
			UserManager.saveUser(user);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "signup";
		}
	}
	
	//-------------------------------------------------------------- Project Mappings ----------------------------------------------------
	
	public void viewProjectDetails(String userId, Model model){
		try{
			HashMap<Integer, String> tenantMap = MetadataDAO.getTenantDetails();
			List<ProjectDetails> projectList = UserManager.getUserProjectDetails(userId, tenantMap);
			model.addAttribute("projectDetails",projectList);
			model.addAttribute("tenantMap",tenantMap);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/createProject", method = RequestMethod.POST)
	public String createProject(Model model, String projectType){
		try {
			HashMap<Integer, String> tenantMap = MetadataDAO.getTenantDetails();
			model.addAttribute("tenantId", projectType);
			String tenantType =  tenantMap.get(Integer.parseInt(projectType));
			System.out.println("My Tenant Type"+tenantType);
			model.addAttribute("tenantType",tenantType);
			model.addAttribute("user", "kunal.barve@sjsu.edu");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "add_project";
	}
	
	@RequestMapping(value = "/saveProject", method = RequestMethod.POST)
	public String saveProject(Model model, String userId, int tenantId, String projectName, String description, String sprintName, String startDate, String duration){
		String creationDate = Utility.convertDateToMMDDYYYYFormat(new Date());
		Project project = new Project();

		project.setUserId(userId);
		project.setProjectName(projectName);
		project.setCreationDate(creationDate);
		project.setDescription(description);
		project.setTenantId(tenantId);
		if(sprintName != null && startDate != null && duration != null){
			Date startingDate = Utility.convertMMDDYYYYFormatToDate(startDate);
			project.setSprintDuration(Integer.parseInt(duration));
			project.setStartDate(startingDate);
			project.setSprintName(sprintName);
		}

		ArrayList<Data>data = new ArrayList<Data> ();
		
		project.setData(data);

		try {
			ProjectManager.saveProject(project);
			viewProjectDetails(userId, model);
			return "project_screen";
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
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
		return "project_details";
	}
	
	@RequestMapping(value = "/viewProject", method = RequestMethod.GET)
	public String getProject(Model model, String projectId, String tenantId){
		try {
			System.out.println("My Project's Id:"+projectId);
			Project project = ProjectManager.getProject(projectId);
			if(project != null){
				List<MetaData> metaDataList = MetadataDAO.getAttributeDetails(Integer.parseInt(tenantId.trim()));
				List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());	
				dataList = arrangeAttributes(dataList, metaDataList);
				
				ProjectDetails details = new ProjectDetails();
				details.setProjectName(project.getProjectName());
				details.setData(dataList);
				details.setMetaDataList(metaDataList);
				
				model.addAttribute("project", details);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "project_details";
	}
	
	//-------------------------------------------------------------- Data Mappings ----------------------------------------------------
	
	public List<Data> arrangeAttributes(List<Data> dataList, List<MetaData> metaDataList){
		for(Data data: dataList){
			HashMap<String, Attribute> attrMap = new HashMap<String, Attribute>();
			for(Attribute attr: data.getAttributeValues()){
				attrMap.put(attr.getKey(), attr);
			}
			
			List<Attribute> attrList = new ArrayList<Attribute>();
			
			for(MetaData metaData : metaDataList){
				Attribute attribute = (attrMap.get(metaData.getName()) != null ? attrMap.get(metaData.getName()) : new Attribute());
				attrList.add(attribute);
			}
			data.setAttributeValues(attrList);
		}
		return dataList;
	} 
	
	public String setData(){
		try {
			Data data = new Data();
			String projectId = "5540ba2a44ae0afe074b8b8e" ;
			
			data.setDataId(DataSequenceDAO.getNextDataId(ApplicationConstants.DATA_SEQ_KEY));
			
			ArrayList<Attribute> d = new ArrayList<Attribute>();
			Attribute a = new Attribute();
			a.setKey("Name");
			a.setValue("Task Name 2");
			d.add(a);
			data.setAttributeValues(d);
			
			DataManager.saveData(data,projectId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String getData(){
		String projectId = "5540ba2a44ae0afe074b8b8e";
		long dataId = 1;
		Data finalData = null;
		
		try {
			Project project = ProjectManager.getProject(projectId);
			List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());
			for (Data data : dataList) {
				if(data.getDataId() ==  dataId){
					finalData = data;
					break;
				}
			}
			System.out.println("Data : "+finalData.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String deleteData(){
		String projectId = "5540bb6844ae39bf23f1e7f2";
		long dataId = 3;
		try {
			Project project = ProjectManager.getProject(projectId);
			DataManager.deleteData(project, dataId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String updateData(){
		String projectId = "5540bb6844ae39bf23f1e7f2";
		Data data = new Data();
		data.setDataId(4);
		
		List<Attribute> attrList = new ArrayList<Attribute>();
		Attribute a = new Attribute();
		a.setKey("Desciption");
		a.setValue("Test Superb");
		attrList.add(a);
		
		data.setAttributeValues(attrList);
		
		try {
			Project project = ProjectManager.getProject(projectId);
			DataManager.updateData(project, data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//-------------------------------------------------------------- Meta data Mappings ----------------------------------------------------
	
	public String getMetaData(){
		int tenantId = 2;
		List<MetaData> metaDataDetails = MetadataDAO.getAttributeDetails(tenantId);
		for (MetaData metaData : metaDataDetails) {
			System.out.println("Metadata:"+metaData.toString());
		}
		return "";
	}
	
	//-------------------------------------------------------------------------------------------------------------------
}
