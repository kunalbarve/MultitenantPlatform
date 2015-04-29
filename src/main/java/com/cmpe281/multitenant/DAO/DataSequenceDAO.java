package com.cmpe281.multitenant.DAO;

import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.cmpe281.multitenant.Model.DataIdCounter;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class DataSequenceDAO {
	
	public static long getNextDataId(String key)throws Exception{
		  Query query = new Query(Criteria.where("id").is(key));
		  
		  Update update = new Update();
		  update.inc("sequence", 1);
	 
		  FindAndModifyOptions options = new FindAndModifyOptions();
		  options.returnNew(true);
	 
		  DataIdCounter data = MongoConfig.getMongoOperationsObj().findAndModify(query, update, options, DataIdCounter.class);
	 
		  if (data == null) {
			throw new Exception("Unable to get sequence id for key : " + key);
		  }
	 
		  return data.getSequence();
	}
}
