package com.cmpe281.multitenant.DAO;

import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class ProjectDAO {

	public static void saveProject(Project project) {
		
		MongoConfig.getMongoOperationsObj().save(project);
	
		
	}
}
