package com.cmpe281.multitenant.Model;

import java.util.List;

public class Data {
	
	private long dataId;
	private List<Attribute> attributeValues;
	
	public long getDataId() {
		return dataId;
	}
	public void setDataId(long dataId) {
		this.dataId = dataId;
	}
	
	public List<Attribute> getAttributeValues() {
		return attributeValues;
	}
	public void setAttributeValues(List<Attribute> attributeValues) {
		this.attributeValues = attributeValues;
	}
	
	@Override
	public String toString() {
		String temp = "";
		for(Attribute attr : attributeValues){
			temp = temp+"\n"+attr.toString();
		}
		
		return "Data [dataId=" + dataId + ", attributeValues="
				+ temp + "]";
	}
	
	
	
}
