package com.cmpe281.multitenant.Manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cmpe281.multitenant.DAO.DataDAO;
import com.cmpe281.multitenant.Model.Attribute;
import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.Project;

public class DataManager {
	
		public static void saveData(Data data,String projectId) throws Exception{
			DataDAO.saveData(data,projectId);
		}

		public static List<Data> getData(String projectId, long dataId) {

			return DataDAO.getData(projectId, dataId);
		}

		public static void deleteData(Project project, long dataId) {
			Data finalData = null;
			List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());
			for (Data data : dataList) {
				if(data.getDataId() ==  dataId){
					finalData = data;
					break;
				}
			}
			
			if(finalData != null){
				dataList.remove(finalData);
				DataDAO.updateData(project.getId(), dataList);
			}
		}
		
		public static void updateData(Project project, Data newData)throws Exception{
			List<Data> dataList = (project.getData() != null ? project.getData() : new ArrayList<Data>());
			boolean isFound = false;
			for (Data data : dataList) {
				if(data.getDataId() ==  newData.getDataId()){
					data.setAttributeValues(newData.getAttributeValues());
					isFound = true;
					break;
				}
			}
			
			if(isFound){
				DataDAO.updateData(project.getId(), dataList);
			}
		}
		
		public static List<Data> arrangeAttributes(List<Data> dataList, List<MetaData> metaDataList){
			for(Data data: dataList){
				HashMap<String, Attribute> attrMap = new HashMap<String, Attribute>();
				for(Attribute attr: data.getAttributeValues()){
					attrMap.put(attr.getKey(), attr);
				}
				
				List<Attribute> attrList = new ArrayList<Attribute>();
				
				for(MetaData metaData : metaDataList){
					Attribute attribute = (attrMap.get(metaData.getName()) != null ? attrMap.get(metaData.getName()) : new Attribute());
					attrList.add(attribute);
				}
				data.setAttributeValues(attrList);
			}
			return dataList;
		} 

}
