package com.dhc.modules.sys.entity.echarts;

/**
 * Created by 任贵福 on 2016/9/6.
 */
public class hinNode {
    public String id;
    public String name;

    public double value;

    public double symbolSize;

    public double x;

    public double y;
    public hinNode(String id,String userName,double value,double symbolsize,double x,double y){
        super();
        this.id=id;
        this.name =userName;
        this.value=value;
        this.symbolSize =symbolsize;
        this.x=x;
        this.y=y;
    }
    public hinNode(String id,String userName,double value,double symbolsize){
        super();
        this.id=id;
        this.name =userName;
        this.value=value;
        this.symbolSize =symbolsize;
        double angle=Math.random()*2*Math.PI;
        this.x =Math.cos(angle)*(symbolsize)*10;
        this.y=Math.sin(angle)*(symbolsize)*10;

    }
    public String getUserName(){
        return name;
    }

    public double getSymbolSize() {
        return symbolSize;
    }

    public double getValue() {
        return value;
    }
}
