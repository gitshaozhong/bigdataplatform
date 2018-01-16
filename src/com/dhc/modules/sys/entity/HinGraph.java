package com.dhc.modules.sys.entity;

import com.dhc.modules.sys.entity.echarts.hinNode;
import com.dhc.modules.sys.entity.echarts.link;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 任贵福 on 2016/9/6.
 */
public class HinGraph {
    public List<hinNode> apaNodes=new ArrayList<hinNode>();
    public  List<link> apaLinks=new ArrayList<>();
    public List<hinNode> apvpaNodes=new ArrayList<>();
    public List<link> apvpaLinks=new ArrayList<>();
    public List<hinNode> aptpaNodes=new ArrayList<>();
    public List<link>aptpaLinks=new ArrayList<>();
    public HinGraph(List<hinNode> apaNodes,List<link>apaLinks,List<hinNode>apvpaNodes,List<link>apvpaLinks,List<hinNode>aptpaNodes,List<link>aptpaLinks){
        this.apaNodes=apaNodes;
        this.apaLinks=apaLinks;
        this.apvpaNodes=apvpaNodes;
        this.apvpaLinks=apvpaLinks;
        this.aptpaNodes=aptpaNodes;
        this.aptpaLinks=aptpaLinks;
    }
    public List<hinNode> getApaNodes() {
        return apaNodes;
    }

    public List<link> getApaLinks() {
        return apaLinks;
    }

    public List<link> getAptpaLinks() {
        return aptpaLinks;
    }

    public List<hinNode> getAptpaNodes() {
        return aptpaNodes;
    }

    public List<hinNode> getApvpaNodes() {
        return apvpaNodes;
    }

    public List<link> getApvpaLinks() {
        return apvpaLinks;
    }
}
