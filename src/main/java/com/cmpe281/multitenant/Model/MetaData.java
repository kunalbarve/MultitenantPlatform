package com.cmpe281.multitenant.Model;

import java.util.List;

public class MetaData {
	
	private int id;
	private String name;
	private String type;
	private String reference;
	private List<String> comboMetadata;	
	
	public List<String> getComboMetadata() {
		return comboMetadata;
	}
	public void setComboMetadata(List<String> comboMetadata) {
		this.comboMetadata = comboMetadata;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}

	@Override
	public String toString() {
		return "MetaData [id=" + id + ", name=" + name + ", type=" + type
				+ ", reference=" + reference + "]";
	}
}
