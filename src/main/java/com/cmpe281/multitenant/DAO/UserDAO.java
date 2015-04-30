package com.cmpe281.multitenant.DAO;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class UserDAO {

	public static User getUser(User user) throws Exception{
		
		Query query = new Query();
		query.addCriteria(Criteria.where("email").is(user.getEmail()));
		query.addCriteria(Criteria.where("password").is(user.getPassword()));
		user = MongoConfig.getMongoOperationsObj().findOne(query, User.class);
		System.out.println(user.toString());
	
		return user;
		
	}
	
	public static void setUser(User user)throws Exception {
		MongoConfig.getMongoOperationsObj().save(user);
	
		if(user != null)
		System.out.println("User :"+user.toString());
	}

}
