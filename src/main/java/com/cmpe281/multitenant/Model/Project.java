package com.cmpe281.multitenant.Model;

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
	
	@Override
	public String toString() {
		return "Project [id=" + id + ", userId=" + userId + ", projectName="
				+ projectName + ", tenantId=" + tenantId + ", data=" + data
				+ "]";
	}
}
