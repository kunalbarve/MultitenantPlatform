package com.cmpe281.multitenant.DAO;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class UserDAO {

	public static void getUser(User user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("email").is(user.getEmail()));
		
		user = MongoConfig.getMongoOperationsObj().findOne(query, User.class);
		
		
		if(user != null)
		System.out.println("User :"+user.toString());
	}

}
