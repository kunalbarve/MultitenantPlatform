package com.cmpe281.multitenant.DAO;

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
	
}
