package com.dhc.modules.sys.entity;

import java.util.ArrayList;
import java.util.List;

import com.dhc.modules.sys.entity.echarts.link;
import com.dhc.modules.sys.entity.echarts.node;

public class Graph {
	public List<node> nodes = new ArrayList<node>();//节点分组
	public List<link> links = new ArrayList<link>();//连线分组
	
	
	public Graph(List<node> nodes, List<link> links) {
		super();
		this.nodes = nodes;
		this.links = links;
		
	}
}
