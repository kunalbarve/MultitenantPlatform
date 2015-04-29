package com.cmpe281.multitenant.Manager;

import com.cmpe281.multitenant.DAO.DataDAO;
import com.cmpe281.multitenant.Model.Data;

public class DataManager {
	
		public static void saveProject(Data data) {
			DataDAO.saveData(data);
		}

}
