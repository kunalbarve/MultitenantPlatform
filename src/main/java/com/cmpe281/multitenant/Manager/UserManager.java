package com.cmpe281.multitenant.Manager;

import com.cmpe281.multitenant.DAO.UserDAO;
import com.cmpe281.multitenant.Model.User;

public class UserManager {

	public static void getUser(User user) {
		UserDAO.getUser(user);
	}

}
