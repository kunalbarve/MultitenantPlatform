package com.cmpe281.multitenant.Manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cmpe281.multitenant.DAO.ProjectDAO;
import com.cmpe281.multitenant.DAO.UserDAO;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.VO.ProjectDetails;

public class UserManager  {

	public static void getUser(User user) throws Exception {
		UserDAO.getUser(user);
	}
	
	public static void saveUser(User user) throws Exception {
		UserDAO.setUser(user);
	}
	
	public static boolean verifyLogin(User user) throws Exception{
		User localuser = UserDAO.getUser(user);
		
		if(localuser == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	public static List<ProjectDetails> getUserProjectDetails(String userId, HashMap<Integer, String> tenantMap)throws Exception {
		List<ProjectDetails> detailList = new ArrayList<ProjectDetails>();
		List<Project> projectList = ProjectDAO.getAllProjects(userId);

		for (Project project : projectList) {
			ProjectDetails details = new ProjectDetails();
			details.setProjectId(project.getId());
			details.setProjectName(project.getProjectName());
			details.setDescription(project.getDescription() != null ? project.getDescription() : "");
			details.setCreationDate(project.getCreationDate() != null ? project.getCreationDate(): "");
			details.setUserId(userId);
			details.setTenantId(project.getTenantId());
			details.setTenantType(tenantMap.get(project.getTenantId()));
			System.out.println("Project: "+details.toString());
			detailList.add(details);
		}
		return detailList;
	}

}
