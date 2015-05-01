package com.cmpe281.multitenant.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Model.References;
import com.cmpe281.multitenant.Model.User;
import com.cmpe281.multitenant.Utility.ApplicationConstants;
import com.cmpe281.multitenant.Utility.DatabaseConnector;
import com.cmpe281.multitenant.Utility.MongoConfig;

public class MetadataDAO {
	
	private static Connection conn;
	private static PreparedStatement pst;
	private static ResultSet rs;
	
	public static List<MetaData> getAttributeDetails(int tenantId) {
		List<MetaData> attributeDetails = new ArrayList<MetaData>();
		try {
			conn = DatabaseConnector.getSQLInstance();
			String query = "SELECT A.* FROM TENANT_ATTRIBUTE_TABLE A JOIN MULTI_TENANT_TABLE M "
					+ "ON M.TENANT_ATTRIBUTE_ID = A.TENANT_ATTRIBUTE_ID "
					+ "WHERE M.TENANT_ID = ?";
			
			pst = conn.prepareStatement(query);
			pst.setInt(1, tenantId);
			rs = pst.executeQuery();
			
			while(rs.next()){
				MetaData metaData = new MetaData();
				metaData.setId(rs.getInt(1));
				metaData.setName(rs.getString(2));
				
				String fieldType = rs.getString(3).trim(); 
				metaData.setType(fieldType);
				
				String referenceId = rs.getString(4);
				metaData.setReference(referenceId);
				
				if(fieldType.equalsIgnoreCase(ApplicationConstants.COMBO_USER)){
					metaData.setComboMetadata(getAllUserIds());
				}else if(fieldType.equalsIgnoreCase(ApplicationConstants.COMBO_OTHER)){
					metaData.setComboMetadata(getComboMetadata(referenceId));
				}
				
				attributeDetails.add(metaData);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		DatabaseConnector.closeConn();
		return attributeDetails;
	}
	
	public static List<String> getComboMetadata(String referenceId){
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(referenceId));
		
		References reference = MongoConfig.getMongoOperationsObj().findOne(query, References.class);
		return (reference.getValues() != null ? reference.getValues() : new ArrayList<String>());
	}
	
	public static List<String> getAllUserIds(){
		List<String> mailList = new ArrayList<String>();
		List<User> userList = MongoConfig.getMongoOperationsObj().findAll(User.class);
		for (User user : userList) {
			mailList.add(user.getEmail());
		}
		return mailList;
	}
	
	public static HashMap<Integer, String> getTenantDetails()throws Exception{
		HashMap<Integer, String> tenantMap = new HashMap<Integer, String>();
		conn = DatabaseConnector.getSQLInstance();
		String query = "SELECT * FROM TENANT_TABLE";
		
		pst = conn.prepareStatement(query);
		rs = pst.executeQuery();
		
		while(rs.next()){
			tenantMap.put(rs.getInt(1), rs.getString(2));
		}
		DatabaseConnector.closeConn();
		return tenantMap;
	}
}
