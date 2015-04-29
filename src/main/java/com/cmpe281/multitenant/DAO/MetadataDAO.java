package com.cmpe281.multitenant.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cmpe281.multitenant.Model.MetaData;
import com.cmpe281.multitenant.Utility.DatabaseConnector;

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
				metaData.setType(rs.getString(3));
				metaData.setReference(rs.getString(4));
				attributeDetails.add(metaData);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		DatabaseConnector.closeConn();
		return attributeDetails;
	}
}
