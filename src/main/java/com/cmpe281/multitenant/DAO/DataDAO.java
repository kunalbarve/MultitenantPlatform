package com.cmpe281.multitenant.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.cmpe281.multitenant.Model.Data;
import com.cmpe281.multitenant.Model.Project;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class DataDAO {

	public static void saveData(Data data,String projectId) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(projectId));
		Update update = new Update();
		update.push("data", data);
		MongoConfig.getMongoOperationsObj().updateFirst(query,update,Project.class);
	}

	public static List<Data> getData(String projectId, long dataId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(projectId));
		query.addCriteria(Criteria.where("data.dataId").is(dataId));
		
		Project project = MongoConfig.getMongoOperationsObj().findOne(query, Project.class);
		
		return (project.getData() != null ? project.getData() : new ArrayList<Data>());
	}

	public static void updateData(String projectId, List<Data> dataList) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(projectId));
		
		Update updateObj = new Update();
		updateObj.set("data", dataList);
		
		MongoConfig.getMongoOperationsObj().updateFirst(query, updateObj, Project.class);
	}
	
}
