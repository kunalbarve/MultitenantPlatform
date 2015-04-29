package com.cmpe281.multitenant.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class ProjectDAO {

	public static void saveProject(Project project)throws Exception {
		MongoConfig.getMongoOperationsObj().save(project);
	}

	public static List<Project> getAllProjects(String userId)throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("userId").is(userId));
		
		List<Project> projectList = MongoConfig.getMongoOperationsObj().find(query, Project.class);
		return (projectList != null ? projectList : new ArrayList<Project>());
	}

	public static Project getProject(String projectId)throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(projectId));
		
		Project project = MongoConfig.getMongoOperationsObj().findOne(query, Project.class);
		return project;
	}

}
