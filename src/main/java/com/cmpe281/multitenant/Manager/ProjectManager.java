package com.cmpe281.multitenant.Manager;

import java.util.ArrayList;
import java.util.List;

import com.cmpe281.multitenant.DAO.MetadataDAO;
import com.cmpe281.multitenant.DAO.ProjectDAO;
import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.VO.ProjectDetails;

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
	
	public static ProjectDetails updateProjectUI(Project project, String tenantId){
		List<MetaData> metaDataList = MetadataDAO.getAttributeDetails(Integer.parseInt(tenantId.trim()));
		List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());	
		dataList = DataManager.arrangeAttributes(dataList, metaDataList);
		
		ProjectDetails details = new ProjectDetails();
		details.setProjectId(project.getId());
		details.setTenantId(project.getTenantId());
		details.setProjectName(project.getProjectName());
		details.setData(dataList);
		details.setMetaDataList(metaDataList);
		return details;
	}
		
}
