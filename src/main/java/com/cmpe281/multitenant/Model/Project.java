package com.cmpe281.multitenant.Model;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="Project")
public class Project {

	@Id
	private String id;
	private String userId;
	private String projectName;
	private int tenantId;
	private String sprintName;
	private int sprintDuration;
	private Date startDate; 
	private List<Data> data;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public int getTenantId() {
		return tenantId;
	}
	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}

	public String getSprintName() {
		return sprintName;
	}
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	public int getSprintDuration() {
		return sprintDuration;
	}
	public void setSprintDuration(int sprintDuration) {
		this.sprintDuration = sprintDuration;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	
	@Override
	public String toString() {
		return "Project [id=" + id + ", userId=" + userId + ", projectName="
				+ projectName + ", tenantId2=" + tenantId + ", data=" + data
				+ "]";
	}
}
