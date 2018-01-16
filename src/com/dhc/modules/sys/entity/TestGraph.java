package com.dhc.modules.sys.entity;

import com.dhc.modules.sys.entity.echarts.hinNode;
import com.dhc.modules.sys.entity.echarts.link;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 任贵福 on 2016/9/6.
 */
public class TestGraph {
    public List<hinNode> nodes = new ArrayList<hinNode>();//节点分组
    public List<link> links = new ArrayList<link>();//连线分组


    public TestGraph(List<hinNode> testnodes1, List<link> testlinks) {
        super();
        this.nodes = testnodes1;
        this.links = testlinks;

    }
}
