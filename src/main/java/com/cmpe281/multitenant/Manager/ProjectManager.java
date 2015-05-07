package com.cmpe281.multitenant.Manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.ui.Model;

import com.cmpe281.multitenant.DAO.MetadataDAO;
import com.cmpe281.multitenant.DAO.ProjectDAO;
import com.cmpe281.multitenant.GraphData.WaterFallGraphDataContainer;
import com.cmpe281.multitenant.GraphData.WaterfallGraphData;
import com.cmpe281.multitenant.Model.Attribute;
import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.VO.ProjectDetails;
import com.google.gson.Gson;

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
	
	public static ProjectDetails updateProjectUI(Project project, String tenantId, Model model){
		List<MetaData> metaDataList = MetadataDAO.getAttributeDetails(Integer.parseInt(tenantId.trim()));
		List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());	
		dataList = DataManager.arrangeAttributes(dataList, metaDataList);
		
		ProjectDetails details = new ProjectDetails();
		details.setProjectId(project.getId());
		details.setTenantId(project.getTenantId());
		details.setProjectName(project.getProjectName());
		details.setData(dataList);
		details.setMetaDataList(metaDataList);
		
		String projectId = project.getId();
		
		model.addAttribute("tenantId", tenantId);
		
		if(tenantId.equals("1"))
		{
			model.addAttribute("graphData",getWaterFallData(projectId,model));
		}
		else if(tenantId.equals("2"))
		{
			model.addAttribute("graphData",getScrumData(projectId,model));
		}
		else if(tenantId.equals("3"))
		{
			System.out.println("------------------------------>The tenant id is 3<------------------------------");
			model.addAttribute("graphData",getKanbanData(projectId,model));
		}
		
		return details;
	}
	
	//-----------------------------------------------------------------Graph Mappings--------------------------------------------------
	
		public static String getKanbanData(String projectId, Model model)
		{
			Project project;
			String result ="";
			String status="";
			try {
				project = ProjectManager.getProject(projectId);
				int notStartedCount = 0;
				int inProgressCount = 0;
				int completedCount = 0;

				List<Data> dataList = project.getData();
				List<Attribute> attributeList;
				for (Data data : dataList) {
					attributeList =	data.getAttributeValues();
					for (Attribute attribute : attributeList) {
						if(attribute.getValue().equals("Not Started"))
						{
							notStartedCount++;
						}
						else if(attribute.getValue().equalsIgnoreCase("In Progress"))
						{
							inProgressCount++;
						}
						else if(attribute.getValue().equals("Completed"))
						{
							completedCount++;
						}
					}
				}
				result = notStartedCount+","+inProgressCount+","+completedCount;
				
				if(notStartedCount > 5)
				{
					status = "Not Started is Overflowing";
				}
				else if(inProgressCount > 5)
				{
					status = "In Progress is Overflowing";
				}
				else
				{
					status = "No Queue is Overflowing";
					
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		model.addAttribute("ProjectStatus", status);
			return result;

		}

		public static String getScrumData(String projectId, Model model)
		{
			Project project;
			String result ="";
			int completedPoints = 0;
			int totalPoints = 0;
			int remainingPoints = 0;
			Date startDate=null;
			int duration = 0;
			Date currentDate = new Date();
			try {
				project = ProjectManager.getProject(projectId);
				startDate = project.getStartDate();
				duration = project.getSprintDuration();
				List<Data> dataList = project.getData();
				List<Data> completedStoryList = new ArrayList<Data>();
				List<Attribute> attributeList;
				for (Data data : dataList) {
					attributeList =	data.getAttributeValues();
					for (Attribute attribute : attributeList) {
						System.out.println(attribute.getKey().toString());
						if(attribute.getKey().trim().equalsIgnoreCase("Remaining Points"))
						{
							remainingPoints+= Integer.parseInt(attribute.getValue().trim());
							
							System.out.println("Remaining Points"+remainingPoints);

						}

						if(attribute.getKey().equalsIgnoreCase("Total Points"))
						{
							System.out.println("The result is"+attribute.getValue());
							totalPoints+= Integer.parseInt(attribute.getValue().trim());

						}

					}
				}
				for (Data completeStory : completedStoryList) {

					attributeList =	completeStory.getAttributeValues();
					for (Attribute attribute : attributeList) {
						if(attribute.getKey().equals("Points"))
						{
							System.out.println("Completed points"+attribute.getValue() );
							completedPoints+= Integer.parseInt(attribute.getValue().trim()); 
							

						}

					}

				}
				result = "0,"+totalPoints+","+currentDate.compareTo(startDate)+","+remainingPoints;
			

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int idealVelocity = (totalPoints)/duration;
			
			int currentVelocity = (totalPoints - remainingPoints )/currentDate.compareTo(startDate);
			
			String status = "";
			
			if(idealVelocity == currentVelocity)
			{
				status = "Project is On Time";
			}
			else if(idealVelocity > currentVelocity)
			{
				status = "Project is Late";
			}
			else {
				
				status = "Project is Early";
			}
			System.out.println(result);
			model.addAttribute("ProjectStatus", status);
			return result;

		}

		public static String getWaterFallData(String projectId, Model model)
		{
			Project project;
			String json ="";
			float completeCount=0;
			float totalCount = 0;

			try {
				project = ProjectManager.getProject(projectId);

				List<Data> dataList = project.getData();
				List<Attribute> attributeList;
				WaterFallGraphDataContainer graphDataContainer = new WaterFallGraphDataContainer();
				WaterfallGraphData waterfallGraphData;
				for (Data data : dataList) {
					totalCount++;
					waterfallGraphData = new WaterfallGraphData();
					attributeList =	data.getAttributeValues();
					for (Attribute attribute : attributeList) {
						System.out.println(attribute.getKey());
								if(attribute.getKey().equalsIgnoreCase("Name"))
						{
							waterfallGraphData.setTask(attribute.getValue());

						}

						if(attribute.getKey().equalsIgnoreCase("Start Date"))
						{
							waterfallGraphData.setStartDate(attribute.getValue());

						}
						if(attribute.getKey().equalsIgnoreCase("End Date"))
						{
							waterfallGraphData.setEndDate(attribute.getValue());

						}
						
						if(attribute.getKey().equalsIgnoreCase("Status"))
						{
							if(attribute.getValue().equalsIgnoreCase("Complete"))
							{
								completeCount++;
							}
						}

					}
					graphDataContainer.getGraphDataList().add(waterfallGraphData);

				}
				Gson gson = new Gson();
				json = gson.toJson(graphDataContainer);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(json);
			float percentageComplete = (completeCount/totalCount)*100;
			model.addAttribute("ProjectStatus", String.valueOf(percentageComplete)+" Precentage Complete");
			return json;

		}

		
}