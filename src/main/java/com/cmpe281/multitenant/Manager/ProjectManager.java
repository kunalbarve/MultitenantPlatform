package com.cmpe281.multitenant.Manager;

import com.cmpe281.multitenant.DAO.ProjectDAO;
import com.cmpe281.multitenant.Model.Project;

public class ProjectManager {

	public static void saveProject(Project project) {
		ProjectDAO.saveProject(project);
	}
	
		
}
