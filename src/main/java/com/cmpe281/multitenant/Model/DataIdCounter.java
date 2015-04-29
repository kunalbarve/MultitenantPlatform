package com.cmpe281.multitenant.Model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "DataIdCounter")
public class DataIdCounter {
	
	@Id
	private String id;
	private int sequence;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	
	@Override
	public String toString() {
		return "DataIdCounter [id=" + id + ", sequence=" + sequence + "]";
	}
}
