package com.cmpe281.multitenant.GraphData;

import java.util.ArrayList;
import java.util.List;

public class WaterFallGraphDataContainer {

	List<WaterfallGraphData> graphDataList;
	
	public WaterFallGraphDataContainer() {
		graphDataList = new ArrayList<WaterfallGraphData>();
	}
	
	public List<WaterfallGraphData> getGraphDataList() {
		return graphDataList;
	}

	public void setGraphDataList(List<WaterfallGraphData> graphDataList) {
		this.graphDataList = graphDataList;
	}
	
}
