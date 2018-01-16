package com.dhc.modules.sys.entity.echarts;

public class node {

	public String id;

	public String name;

	public double value;

//	public int category;

	public double symbolSize;

	public double x;

	public double y;

	public node(String id, String name, double value,
			int category, double symbolSize, double x,double y) {
		super();
		this.id = id;
//		this.category = category;
		this.name = name;
		this.value = value;
		this.symbolSize = symbolSize;
		this.x = x;
		this.y=y;
	}
	/**
	 * 
	 * @param id
	 * @param name
	 * @param value
	 * @param category
	 * @param symbolSize 图形大小，会根据图形大小生成距离和初始位置
	 */
	public node(String id, String name, int value,
			int category, int symbolSize) {
		super();
		this.id = id;
		//this.category = category;
		this.name = name;
		this.value = Double.valueOf(value);
		this.symbolSize = symbolSize*2;
		
		double angle=Math.random()*2*Math.PI;
		this.x = Math.cos(angle)*(80-symbolSize)*10;
		this.y=Math.sin(angle)*(80-symbolSize)*10;
	}
}
