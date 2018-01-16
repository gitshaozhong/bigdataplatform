package com.dhc.modules.sys.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 任贵福 on 2016/10/31.
 */
public class WeiboTop {
    public String weibocategory;
    public String localtime;
    public List<Weibo> weiboconetsList = new ArrayList<>();

    public WeiboTop(String weibocategory, String localtime, List<Weibo> weiboconetsList) {
        this.weibocategory = weibocategory;
        this.localtime = localtime;
        this.weiboconetsList = weiboconetsList;
    }

}
