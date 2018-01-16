package com.dhc.modules.sys.entity.echarts;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class Radar {
 
	public List<indicator> indicators;
	public List<Double> value;
	
	
	public Radar(List<indicator> indicators,List<Double> values)
	{
		this.indicators=indicators;
		this.value=values;
		
	}
}
