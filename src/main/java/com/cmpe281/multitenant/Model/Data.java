package com.cmpe281.multitenant.Model;

import java.util.List;

public class Data {
	
	private int dataId;
	private List<Attribute> attributeValues;
	
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
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
		return "Data [dataId=" + dataId + "]";
	}
	
}