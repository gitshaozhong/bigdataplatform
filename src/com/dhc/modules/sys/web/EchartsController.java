package com.dhc.modules.sys.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import com.dhc.modules.sys.entity.*;
import com.dhc.modules.sys.entity.echarts.*;
import com.dhc.modules.sys.utils.BlogNameUtils;
import com.dhc.modules.sys.utils.ThriftUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.modules.sys.service.EchartsManager;
import com.dhc.modules.sys.utils.IdComboUtils;


@Controller
@RequestMapping("${adminPath}/sys/echarts")
public class EchartsController {

    private static final Logger logger = LoggerFactory.getLogger(EchartsController.class);

    @RequestMapping(value = {"WeiboTagRecomm"})
    public String WeiboTagRecomm() {
        return "modules/sys/pic/WeiboTagRecomm";
    }


    @RequestMapping(value = {""})
    public String list() {
        return "modules/sys/pic/2DegreeRelationship";
    }

    @RequestMapping(value = {"/picture"})
    public String picture() {
        return "modules/sys/pic/picture_recommend";
    }
    @RequestMapping(value = {"/agent_bar"})
    public String agent_bar() {
        return "modules/sys/agent_bar";
    }

    @RequestMapping(value = {"/net_traffic"})
    public String net_traffic() {
        return "modules/sys/pic/net_traffic";
    }

    @RequestMapping(value = {"/net_user"})
    public String net_user() {
        return "modules/sys/pic/net_user";
    }

    @RequestMapping(value = {"net_switch"})
    public String net_switch() {
        return "modules/sys/pic/net_switch";
    }

    @RequestMapping(value = {"/net_dropline"})
    public String net_dropline() {
        return "modules/sys/pic/net_dropline";
    }

    @RequestMapping(value = {"/bs_performance"})
    public String bs_performance() {
        return "modules/sys/pic/bs_performance";
    }

    @RequestMapping(value = {"user_prediction"})
    public String user_prediction() {
        return "modules/sys/pic/map_echarts2/user_prediction";
    }

    @RequestMapping(value = {"/bs_healmap"})
    public String bs_healmap() {
        return "modules/sys/pic/bs_healmap";
    }

    @RequestMapping(value = {"/telecom_data_introduce"})
    public String telecom_data_introduce() {
        return "modules/sys/pic/telecom_data_introduce";
    }

    @RequestMapping(value = {"/microblog_data_introduce"})
    public String weibo_data_introduce() {
        return "modules/sys/pic/microblog_data_introduce";
    }

    @RequestMapping(value = {"/dbpedia"})
    public String dbpedia() {
        return "modules/sys/pic/hin/dbpedia";
    }

    @RequestMapping(value = {"/metapath"})
    public String metapath() {
        return "modules/sys/pic/hin/metapath";
    }

    @RequestMapping(value = {"/HIN-cluster"})
    public String cluster() {
        return "modules/sys/pic/hin/HIN-cluster";
    }

    @RequestMapping(value = {"/heterogeneous_information_network_analysis"})
    public String heterogeneous_information_network_analysis() {
        return "modules/sys/pic/hin/heterogeneous_information_network_analysis";
    }

    @RequestMapping(value = {"/weibotop"})
    public String weibotop() {
        return "modules/sys/pic/hin/WeiboTop";
    }

    @RequestMapping(value = {"/colorhistogram"})
    public String histogram(){return "modules/sys/pic/multimodal/colorhistogram";}

    @RequestMapping(value = {"/cannyedge"})
    public String canny(){return "modules/sys/pic/multimodal/cannyedge";}

    @RequestMapping(value = {"/hough"})
    public String hough(){return "modules/sys/pic/multimodal/hough";}

    @RequestMapping(value = {"/picturesearch"})
    public String search(){return "modules/sys/pic/multimodal/search";}

    @RequestMapping(value = {"/eventfind"})
    public String eventFind(){return "modules/sys/pic/multimodal/eventfind";}

    @RequestMapping(value = {"/nameList"})
    @ResponseBody
    public List<String> nameList(String UserId, String table) throws IOException, URISyntaxException {
        System.out.println(UserId);
        List<String> IdList = IdComboUtils.getIdComboByPrefix(UserId, table);
        System.out.println("id number:" + IdList.size());
        return IdList;
//		return EchartsManager.fromIdList2JsonName(IdList);
    }

    //读取Jaon文件
    @RequestMapping("/get_json_data")
    @ResponseBody
    public static String test() throws IOException, URISyntaxException {

        File f = new File("E:" + File.separator + "jsonOfBsNormal.json");
        Scanner scan = null;
        try {
            scan = new Scanner(f);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        StringBuffer str = new StringBuffer();
        while (scan.hasNextLine()) {
            str.append(scan.nextLine()).append("\n");
        }
        System.out.println("成功调用get_json");

        return str.toString();
    }

    @RequestMapping("/line_data")
    @ResponseBody
    public EchartData lineData() {
        logger.info("lineData....");

        List<String> legend = new ArrayList<String>(Arrays.asList(new String[]{"最高气温"}));//数据分组
        List<String> category = new ArrayList<String>(Arrays.asList(new String[]{"周一", "周二", "周三", "周四", "周五", "周六", "周日"}));//横坐标
        List<Series> series = new ArrayList<Series>();//纵坐标

        series.add(new Series("最高气温", "bar",
                new ArrayList<Integer>(Arrays.asList(
                        21, 23, 28, 26, 21, 33, 44))));

        EchartData data = new EchartData(legend, category, series);
        return data;
    }

    @RequestMapping("/graph_data")
    @ResponseBody
    public Graph graphData(String UserId) throws IOException, URISyntaxException {
        logger.info("graphData's option....");
//		Graph graph= EchartsManager.HBaseGraphTestData();
        System.out.println("rowkey:" + UserId);
        Graph graph = EchartsManager.HBaseGraphData("1200138904");
        if (!UserId.equals("")) {
            graph = EchartsManager.HBaseGraphData(UserId);
        }
        System.out.println("the size of nodes:" + graph.nodes.size());
        System.out.println("the size of links:" + graph.links.size());

        return graph;
    }

    @RequestMapping("/picture_graph_data")
    @ResponseBody
    public Graph PictureGraphData(String UserId) throws IOException, URISyntaxException {
//		Graph graph= EchartsManager.HBaseGraphTestData();
        List<node> nodes = new ArrayList<node>();//节点分组
        List<link> links = new ArrayList<link>();//连线分组

        String[] ids = {"1","2","3","4","5","6"};
        String[] names = {"clayton","music4computers","LMonzato","Stephen Curry","Kleydson","JhaIr_WithWear"};
        int[] values = {60,80,30,40,50,65};
        nodes.add(new node("0", "flickr", 0, 0, 60, 0, 0));

        for (int i = 0; i < ids.length; i++) {

            nodes.add(new node(ids[i], names[i], values[i], 1, 40));

            links.add(new link("0", ids[i]));
        }


        return new Graph(nodes, links);
    }
    @RequestMapping("/hin_graph_data")
    @ResponseBody
    public HinGraph hinGraphData(String UserId) throws UnsupportedEncodingException {
        logger.info("hingraphData's option....");
        HinGraph graph = EchartsManager.HBaseHinGraphData("Jiawei Han");
        System.out.println("rowkey:" + UserId);
        for (int i = 0; i < graph.apaNodes.size(); i++) {
            System.out.println(graph.apaNodes.get(i).getUserName());
        }
        System.out.println("the size of nodes" + graph.apaNodes.size());
        System.out.println("the size of links: " + graph.apaLinks.size());

        if (!UserId.equals("")) {
            graph = EchartsManager.HBaseHinGraphData(UserId);
        }

        return graph;
    }

    @RequestMapping("/weibotopsearch")
    @ResponseBody
    public WeiboTop WeiboTopSearch(String type, String time) throws UnsupportedEncodingException {
        WeiboTop weibotop = EchartsManager.HBaseWeibotopData(type, time);
        return weibotop;
    }

    @RequestMapping("/apa_graph_data")
    @ResponseBody
    public TestGraph apaGraphData(String UserId) throws UnsupportedEncodingException {
        logger.info("hingraphData's option....");
        HinGraph graph = EchartsManager.HBaseHinGraphData("Jiawei Han");
        System.out.println("rowkey:" + UserId);
        for (int i = 0; i < graph.apaNodes.size(); i++) {
            System.out.println(graph.apaNodes.get(i).getUserName());
        }
        System.out.println("the size of nodes" + graph.apaNodes.size());
        System.out.println("the size of links: " + graph.apaLinks.size());

        if (!UserId.equals("")) {
            graph = EchartsManager.HBaseHinGraphData(UserId);
        }
        for (int i = 0; i < graph.apaLinks.size(); i++) {
            System.out.println("source" + graph.apaLinks.get(i).source + "target" + graph.apaLinks.get(i).target);
        }
        for (int i = 0; i < graph.apaNodes.size(); i++) {
            System.out.println("id:" + graph.apaNodes.get(i).id + " name" + graph.apaNodes.get(i).getUserName());
        }
//		hinNode testNode = new hinNode("Spark","Spark",20.0,20,1,1);
//		hinNode testNode1=new hinNode("hadoop","hadoop",30,30,2,2);
//		List<hinNode>nodes=new ArrayList<>();
//		nodes.add(testNode);
//		nodes.add(testNode1);
//		link link1=new link("Spark","hadoop");
//		List<link>links=new ArrayList<>();
//		links.add(link1);
        return new TestGraph(graph.apaNodes, graph.apaLinks);
    }

    @RequestMapping("/apvpa_graph_data")
    @ResponseBody
    public TestGraph apvpaGraphData(String UserId) throws UnsupportedEncodingException {
        HinGraph graph = EchartsManager.HBaseHinGraphData("Jiawei Han");
        System.out.println("rowkey:" + UserId);
        for (int i = 0; i < graph.apaNodes.size(); i++) {
            System.out.println(graph.apaNodes.get(i).getUserName());
        }
        System.out.println("the size of nodes" + graph.apaNodes.size());
        System.out.println("the size of links: " + graph.apaLinks.size());

        if (!UserId.equals("")) {
            graph = EchartsManager.HBaseHinGraphData(UserId);
        }
        return new TestGraph(graph.apvpaNodes, graph.apvpaLinks);
    }

    @RequestMapping("/aptpa_graph_data")
    @ResponseBody
    public TestGraph aptpaGraphData(String UserId) throws UnsupportedEncodingException {
        HinGraph graph = EchartsManager.HBaseHinGraphData("Jiawei Han");
        System.out.println("rowkey:" + UserId);
        for (int i = 0; i < graph.apaNodes.size(); i++) {
            System.out.println(graph.apaNodes.get(i).getUserName());
        }
        System.out.println("the size of nodes" + graph.apaNodes.size());
        System.out.println("the size of links: " + graph.apaLinks.size());

        if (!UserId.equals("")) {
            graph = EchartsManager.HBaseHinGraphData(UserId);
        }
        return new TestGraph(graph.aptpaNodes, graph.aptpaLinks);
    }

    @RequestMapping("/radar_data")
    @ResponseBody
    public static Radar radarData(String UserId) throws IOException, URISyntaxException {
        logger.info("graphData's option....");
//		UserId=new String(UserId.getBytes("ISO-8859-1"),"UTF-8");
        System.out.println("rowkey:" + UserId);
        Radar radar = EchartsManager.HBaseRadarData("1761094551");
        if (!UserId.equals("")) {
            radar = EchartsManager.HBaseRadarData(UserId);
        }
        return radar;
    }

//	@RequestMapping("/line_page")
//	public String linePage() {
//		logger.info("linePage....");
//		return "report/line";
//	}
//	

}
