package com.cmpe281.multitenant.Manager;

import java.util.List;

import com.cmpe281.multitenant.DAO.ProjectDAO;
import com.cmpe281.multitenant.Model.Project;

public class ProjectManager {

	public static void saveProject(Project project)throws Exception {
		ProjectDAO.saveProject(project);
	}

	public static List<Project> getAllProjects(String userId)throws Exception {
		return ProjectDAO.getAllProjects(userId);
	}

	public static Project getProject(String projectId)throws Exception {
		return ProjectDAO.getProject(projectId);
	}
	
		
}
