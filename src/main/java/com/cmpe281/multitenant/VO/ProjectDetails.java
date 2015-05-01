package com.cmpe281.multitenant.VO;

import java.util.List;

import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;

public class ProjectDetails {
	
	private String projectId;
	private String projectName;
	private String description;
	private String creationDate;
	private String userId;
	private String tenantType;
	private int tenantId;
	private String sprintName;
	private int sprintDuration;
	private String startDate;
	private String status;
	private List<MetaData> metaDataList;
	private List<Data> data;
	
	public List<MetaData> getMetaDataList() {
		return metaDataList;
	}
	public void setMetaDataList(List<MetaData> metaDataList) {
		this.metaDataList = metaDataList;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTenantType() {
		return tenantType;
	}
	public void setTenantType(String tenantType) {
		this.tenantType = tenantType;
	}
	public int getTenantId() {
		return tenantId;
	}
	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "ProjectDetails [projectId=" + projectId + ", projectName="
				+ projectName + ", description=" + description
				+ ", creationDate=" + creationDate + ", userId=" + userId
				+ ", tenantType=" + tenantType + ", tenantId=" + tenantId
				+ ", sprintName=" + sprintName + ", sprintDuration="
				+ sprintDuration + ", startDate=" + startDate + ", status="
				+ status + "]";
	}
}
