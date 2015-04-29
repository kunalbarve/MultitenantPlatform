package com.cmpe281.multitenant.Manager;

import com.cmpe281.multitenant.DAO.UserDAO;
import com.cmpe281.multitenant.Model.User;

public class UserManager  {

	public static void getUser(User user) throws Exception {
		UserDAO.getUser(user);
	}
	
	public static void saveUser(User user) throws Exception {
		UserDAO.setUser(user);
	}
	
	public static boolean verifyLogin(User user) throws Exception{
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
