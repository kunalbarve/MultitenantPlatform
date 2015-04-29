package com.cmpe281.multitenant.Manager;

import com.cmpe281.multitenant.DAO.UserDAO;
import com.cmpe281.multitenant.Model.User;

public class UserManager {

	public static void getUser(User user) {
		UserDAO.getUser(user);
	}
	
	public static void saveUser(User user) {
		UserDAO.setUser(user);
	}
	
	public static boolean verifyLogin(User user) {
		User localuser = UserDAO.getUser(user);
		
		if(localuser == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

}
