package com.dhc.modules.sys.entity.echarts;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class indicator {
	

	String name;
	int max;
		public indicator(String string, int i) {
		this.name=string;
		this.max=i;
	}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getMax() {
			return max;
		}
		public void setMax(int max) {
			this.max = max;
		}
		
		
}
