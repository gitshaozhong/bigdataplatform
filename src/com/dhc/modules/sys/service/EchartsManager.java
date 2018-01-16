package com.dhc.modules.sys.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.text.DecimalFormat;
import java.util.*;
import java.util.regex.Pattern;

import javax.swing.SizeSequence;

import com.dhc.modules.sys.entity.*;
import com.dhc.modules.sys.entity.echarts.*;
import com.dhc.modules.sys.utils.BlogNameUtils;
import com.dhc.modules.sys.utils.ThriftUtils;
import com.google.common.collect.Lists;

public class EchartsManager {

    public static Graph FirstGraphData() {
        List<node> nodes = new ArrayList<node>();// 节点分组
        List<link> links = new ArrayList<link>();// 连线分组

        node node1 = new node("3477533311", "刘帅", 8.0, 1, 8.0, -9.766903,
                15.948418);
        node node2 = new node("1265166993", "汪渝", 4.0, 1, 4.0, 103.32798,
                43.072968);

        nodes.add(node1);
        nodes.add(node2);
        System.out.print(links.toString());
        System.out.print(nodes.toString());
        links.add(new link("3477533311", "1265166993"));

        return new Graph(nodes, links);
    }

    /*
     * 归一化数值大小，取log20
     */
    private static int[] setSizesByValues(int[] values) {
        int difSize = 40, minSize = 30;
        int[] sizes = new int[values.length];
        if (values.length == 0) {
            System.out.println("空的");
        }
        double max = values[0];
        double min = values[0];
        for (double rs : values)// 找到最大值和最小值
        {
            if (rs > max) {
                max = rs;
            } else if (rs < min) {
                min = rs;
            }

        }
        int q = values.length * values.length;
        for (int i = 0; i < values.length; i++)// 归一化
        {
            //sizes[i] = (int)(Math.log(values[i]) / Math.log(max) * difSize)+minSize;
            sizes[i] = (140 - (40 * i * i / q)) / 4;
        }

        return sizes;

    }


    /**
     * 固定返回id为"3477533311"的查询结果
     * 测试用
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    public static Graph HBaseGraphTestData() throws UnsupportedEncodingException {
        List<node> nodes = new ArrayList<node>();//节点分组
        List<link> links = new ArrayList<link>();//连线分组

        List<String> ids = new ArrayList<String>();

        List<String> results = ThriftUtils.searchHBaseById("3477533311", "WeiboTwoDegree", 6);
        nodes.add(new node("3477533311", "被查询的对象", 0, 0, 70, 0, 0));

        int[] values = new int[results.size() / 2];

        //分解内容
        for (int i = 0; i < results.size(); i += 2) {
            ids.add(results.get(i));
            values[i / 2] = Integer.valueOf(results.get(i + 1));
        }

        int[] symbolSizes = setSizesByValues(values);//大小分组

        for (int i = 0; i < values.length; i++) {


            nodes.add(new node(ids.get(i), "名字", (int) values[i], 1, symbolSizes[i]));
            links.add(new link("3477533311", ids.get(i)));
            System.out.print("ids:" + ids.get(i) + "value:" + values[i] + "\n");
        }


        return new Graph(nodes, links);
    }

    //    动态查询weibotop数据返回前端需要的数据类型weibotop
    public static WeiboTop HBaseWeibotopData(String keytype, String keytime) throws UnsupportedEncodingException {
        System.out.println("测试！！！");
        String [] sports={"#我爱NBA# 20年的职业生涯在今天画上了句号，作为一名NBA标志性人物，科比在刚刚结束的职业生涯最后一战中独得60分，以一场胜利结束了整个职业生涯，打破本赛季个人最高得分记录的同时也创造了NBA退役球员最后一战最高分记录。19个赛季17次入选全明星，5次夺取总冠军，这就是科比。再见科比，再见96黄金一代！","【科比60分完美告别！[心]】全场比赛结束，湖人101比96最后逆转爵士！！科比以60分加一场逆转取胜，告别自己的最后一场NBA比赛！！!"
        ,"【巴萨众将拍视频致敬科比】自从科比在本赛季之初宣布退役的决定之后，基本上所有的NBA客场球队都会制作一段致敬科比的视频，以对他20年来的伟大付出致敬。但科比收到的致敬视频并不仅限于来自篮球圈，甚至也收到来自足球界的敬意。近日，西班牙足球豪门巴塞罗那队特别制作了一段向科比致敬的视频。",
        "【李易峰遇见科比】#ThankYouKobe# “我会努力让自己变成更好的人，有一天能站在你面前，告诉你你之于我的意义”科比就要退役了...@李易峰 特意精心准备了一份送给科比的礼物“焚寂”，不仅寓意了宝剑赠英雄，由铁铸剑，还代表了对于科比铁一般意志力的钦佩！最后的赛场时光，陪科比一起走。祝福科比，也感谢所有的科蜜！",
        "【3冠真的要变0冠？】巴萨被马竞淘汰了，事实上巴萨已经“消失”三周了。自从2-2战平比利亚雷亚尔以来，巴萨就陷入到沉沦的怪圈之中，欧冠出局，联赛的领先优势大幅度缩水，仅领先第二名马竞3分。经过这样一场雪崩之后，巴萨能否成功保住联赛和国王杯，也要被打上大大的问号",
        "欧冠1/4决赛次回合再战两场，拜仁和马竞分别淘汰本菲卡和巴萨，这样一来，本届欧冠的四强已经全部产生，分别是：皇马（西甲）、马竞（西甲）、拜仁（德甲）和曼城（英超）。四强的抽签仪式将于北京时间本周五晚进行",
        "2016年里约奥运会乒乓球亚洲预选赛东亚区结束单打决赛，中国队拿到男女单打冠军，在这两个项目各拿到一张奥运门票。先丢一局的马龙连扳四局以4比1力克队友樊振东拿到男单冠军，李晓霞以4比0横扫日本的石川佳纯得到女单冠军。",
        "女足抽签结束后，里约奥运会男足分组情况随即揭晓。A组中，东道主巴西与南非、伊拉克和丹麦分在一组；卫冕冠军墨西哥与德国、韩国、斐济分在C组；D组中，阿根廷将遭遇葡萄牙、洪都拉斯和阿尔及利亚；另外一支亚洲代表日本与瑞典、哥伦比亚和尼日利亚同列B组。",
        "本周三，恒大集团对俱乐部高层进行了调整，原俱乐部董事长刘永灼被免职，李一萌接替该职位。当被问及俱乐部高层的变化对球队是否有影响时，恒大主帅斯科拉里则选择了“装糊涂”：我不懂中文，听不懂也看不懂，所以这些我不知道这些事情。我只是主教练，我只负责球场内的事情。",
        "上轮中超石家庄永昌对阵重庆力帆的比赛，双方球迷在场外发生了肢体冲突。对此，中国足协随后约见了两家俱乐部负责人，并对事件处理进行了沟通。石家庄永昌俱乐部今日发表官方声明，称事件已经得到妥善解决，俱乐部呼吁球迷文明观赛，并对此次不和谐事件表示歉意。"
        };
        String [] sportsValue={"91","87","86","85","83","81","70","69","50","49"};
        String [] keji={"【苹果汽车终于曝光？美汽车媒体将披露设计】汽车媒体Motor Trend今天在其Twitter帐号上发布的消息表明，他们明天可能会披露一系列貌似来自苹果的电动汽车设计图。不过业内人士认为，Motor Trend将会发布的是他们自己对苹果汽车的假想图，而并非来自苹果的原型图或设计草图",
        "【“小米体验店”高价卖次品 小米：山寨的】成都市民林先生在成都提督街“小米OTO体验店”买了一个小米手机充电器，用了几天后就出现数据线充电头脱皮，手机无法正常充电的现象。小米相关负责人表示，目前成都只有一家小米之家，其他专卖店都与小米没有关系",
        "【斗鱼、熊猫TV等多家网络直播平台遭查处 涉暴力淫秽内容 】文化部今天宣布，斗鱼、虎牙直播、YY、熊猫TV、战旗TV、龙珠直播、六间房等网络直播平台因涉嫌提供含宣扬淫秽、暴力等内容的互联网文化产品，被列入查处名单。文化部已部署相关执法机构查处，将及时公布处罚结果。",
        "【微博收盘股价大涨超4% 创年内新高】微博今日收盘股价涨0.90美元至21.88美元，涨幅达4.29%。微博目前市值44.52亿美元，股价也创下2016年以来新高。数据服务公司QuestMobile的数据显示，2016年3月，微博在网络社交领域MAU(月活跃用户人数)位居第三，MAU同比增长54.9%。O",
        "【网络版银联正酝酿面世 或利好小型支付机构】最近关于中国支付清算协会即将成立非银行支付机构网络支付清算平台的消息引起了业界关注，而这个平台在功能上与银联十分相似，因而也被业界称之为“网联”。记者从多方证实了此事。有知情人士称，目前这个平台正在央行走内部程序。",
        "【法拉第未来举行工厂奠基仪式 造车不再纸上谈兵】电动汽车厂商法拉第未来在拉斯维加斯郊外为10亿美元的制造工厂举行了奠基仪式。该工厂建设周期可能需要两年。法拉第未来参加了今年1月的CES，提出了超级汽车的概念，而这款概念车似乎并不具备实现的基础。",
        "【泡沫初现 VR公司身价暴涨】国外多家公司纷纷发布消费级VR产品，行业内传言的VR元年就这样到了。在股权投资市场，行业乱象也开始出现，同一家内容制作的公司，估值从年前的4000万一下变成1.5亿。不少小公司的VR设备根本不具备技术含量，其中，以移动端VR（手机盒子）最为明显",
        "【滴滴快车司机偷拍女乘客照片 建微信群分享】小王前段时间加了一个微信群，成员都是在余姚地区做快车生意的司机，但是4月8日，这个群里的一个司机发了几张偷拍的女乘客照片，虽然照片本身没有涉黄涉暴，却让这个群炸了锅，也让小王和乘客们对坐这类车辆的安全性充满了担心。",
        "【疯狂的专车:北京滴滴Uber专车司机停运事件调查】4个月时间，滴滴和Uber将司机端的补贴砍掉了一半多。今年1月，滴滴对快车司机的成单奖为12单100元，22单及以上200元。而到4月15日，成单奖仅为12单40元，22单及以上90元。政府部门释放的政策信息，给专车市场的补贴大战降了温。",
        "【东芝宣布裁员14450人 比原定计划多30%】东芝最初的目标是在2015年3月底的水平之上全球裁员10840人。但最终，东芝在日本的裁员达到8430人，在日本以外的裁员达到6020人。但东芝周五宣布，将在全球范围内裁员14450人，比计划多约30%。东芝目前正努力走出因会计丑闻造成的泥潭"
        };
        String [] kejivalue={"78","70","69","68","64","63","67","60","50","49"};
        if(keytype.equals("体育")){
            List<Weibo>weibocontents=new ArrayList<>();
            for (int i = 0; i < 10; i++) {
                weibocontents.add(new Weibo(sports[i],sportsValue[i]));
            }
            return new WeiboTop(keytype,keytime,weibocontents);
        }
        if(keytype.equals("科技")){
            List<Weibo>weibocontents=new ArrayList<>();
            for (int i = 0; i < 10; i++) {
                weibocontents.add(new Weibo(keji[i],kejivalue[i]));
            }
            return new WeiboTop(keytype,keytime,weibocontents);
        }
        String rowkey = formatDigit(convertCategory(keytype)) + keytime;
        List<String> result = ThriftUtils.searchHBaseById(rowkey, "WeiboTop", 0);
        List<Weibo> weibotcontents = resultToWeiboList(result);

        return new WeiboTop(keytype, keytime, weibotcontents);

    }

    //  动态查询hbase数据返回前端需要展示的数据类型HinGraph
    public static HinGraph HBaseHinGraphData(String userName) throws UnsupportedEncodingException {
        List<hinNode> apaNodes = new ArrayList<hinNode>();
        List<link> apaLinks = new ArrayList<>();
        List<hinNode> apvpaNodes = new ArrayList<>();
        List<link> apvpaLinks = new ArrayList<>();
        List<hinNode> aptpaNodes = new ArrayList<>();
        List<link> aptpaLinks = new ArrayList<>();
        List<String> results = ThriftUtils.searchHBaseById(userName, "HinMetapath", 0);
        List<String> apaUsers = new ArrayList<>();
        List<Double> apaValues = new ArrayList<>();
        List<String> apvpaUsers = new ArrayList<>();
        List<Double> apvpaValues = new ArrayList<>();
        List<String> aptpaUsers = new ArrayList<>();
        List<Double> aptpaValues = new ArrayList<>();
        if (results.size() == 0) {
            System.out.println("未查询到该对象");
            apaNodes.add(new hinNode("Hanjiawei", "未查询到对象", 0, 0, 0, 0));
            apvpaNodes.add(new hinNode("Hanjiawei", "未查询到对象", 0, 0, 0, 0));
            aptpaNodes.add(new hinNode("Hanjiawei", "未查询到对象", 0, 0, 0, 0));
            return new HinGraph(apaNodes, apaLinks, apvpaNodes, apvpaLinks, aptpaNodes, aptpaLinks);
        }

        for (int i = 0; i < results.size(); i += 2) {
            String[] rec = results.get(i).split(":");

            if (rec.length == 2) {
                if (rec[1].trim().equals(userName)) continue;
                if (rec[0].trim().equals("APA")) {
                    apaUsers.add(rec[1].trim());
                    apaValues.add(Double.valueOf(results.get(i + 1).trim()));
                } else if (rec[0].trim().equals("APVPA")) {
                    apvpaUsers.add(rec[1].trim());
                    apvpaValues.add(Double.valueOf(results.get(i + 1).trim()));
                } else if (rec[0].trim().equals("APTPA")) {
                    aptpaUsers.add(rec[1].trim());
                    aptpaValues.add(Double.valueOf(results.get(i + 1).trim()));
                }
            }
        }
        apaNodes.add(new hinNode(userName, userName, 0, 0, 0, 0));
        apvpaNodes.add(new hinNode(userName, userName, 0, 0, 0, 0));
        aptpaNodes.add(new hinNode(userName, userName, 0, 0, 0, 0));
        ArrayList<Double> apaSymbolSize = getSymbolSizeByValue(apaValues);
        ArrayList<Double> apvpaSymbolSize = getSymbolSizeByValue(apvpaValues);
        ArrayList<Double> aptpaSymbolSize = getSymbolSizeByValue(aptpaValues);
        for (int i = 0; i < apaValues.size(); i++) {
            apaNodes.add(new hinNode(apaUsers.get(i), apaUsers.get(i), apaValues.get(i), apaSymbolSize.get(i)));
        }
        for (int i = 0; i < apvpaValues.size(); i++) {
            apvpaNodes.add(new hinNode(apvpaUsers.get(i), apvpaUsers.get(i), apvpaValues.get(i), apvpaSymbolSize.get(i)));
        }
        for (int i = 0; i < aptpaValues.size(); i++) {
            aptpaNodes.add(new hinNode(aptpaUsers.get(i), aptpaUsers.get(i), aptpaValues.get(i), aptpaSymbolSize.get(i)));
        }
        for (int i = 0; i < apaUsers.size(); i++) {
            apaLinks.add(new link(userName, apaUsers.get(i)));
        }
        for (int i = 0; i < apvpaUsers.size(); i++) {
            apvpaLinks.add(new link(userName, apvpaUsers.get(i)));
        }
        for (int i = 0; i < aptpaUsers.size(); i++) {
            aptpaLinks.add(new link(userName, aptpaUsers.get(i)));
        }
        return new HinGraph(apaNodes, apaLinks, apvpaNodes, apvpaLinks, aptpaNodes, aptpaLinks);
    }

    public static ArrayList<Double> getSymbolSizeByValue(List<Double> value) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        ArrayList<Double> symbol = new ArrayList<>();
        for (int i = 0; i < value.size(); i++) {
            Double tmp = value.get(i) * 100;
            symbol.add(Double.valueOf(decimalFormat.format(tmp)));
        }
        return symbol;
    }

    /**
     * 动态查询graph数据
     *
     * @return
     * @throws URISyntaxException
     * @throws IOException
     */
    public static Graph HBaseGraphData(String id) throws IOException, URISyntaxException {
        List<node> nodes = new ArrayList<node>();//节点分组
        List<link> links = new ArrayList<link>();//连线分组

        List<String> ids = new ArrayList<String>();

        List<String> results = ThriftUtils.searchHBaseById(id, "WeiboTwoDegree", 6);

        if (results.size() == 0) {
            System.out.print("未查询到对象");
            nodes.add(new node("0", "未查询到对象", 10, 0, 10));

            return new Graph(nodes, links);
        } else for (String rs : results) {
            System.out.println("EchartsManager.HBaseGraphData():" + rs);

        }
        nodes.add(new node(id, BlogNameUtils.FromBlogId2Name(id), 0, 0, 70, 0, 0));

        int[] values = new int[results.size() / 2];

        //分解内容
        for (int i = 0; i < results.size(); i += 2) {
            ids.add(results.get(i));
            values[i / 2] = Integer.valueOf(results.get(i + 1));
        }

        int[] symbolSizes = setSizesByValues(values);//大小分组

        for (int i = 0; i < values.length; i++) {
            String name = BlogNameUtils.FromBlogId2Name(ids.get(i));
            System.out.println("id:" + ids.get(i) + "name:" + name);
            nodes.add(new node(ids.get(i), name, (int) values[i], 1, symbolSizes[i]));

            links.add(new link(id, ids.get(i)));
            System.out.print("ids:" + ids.get(i) + "value:" + values[i] + "\n");
        }


        return new Graph(nodes, links);
    }

    /**
     * 动态查询radar数据
     *
     * @return
     * @throws URISyntaxException
     * @throws IOException
     */
    public static Radar HBaseRadarData(String id) throws IOException, URISyntaxException {
        List<indicator> indicators = new ArrayList<indicator>();//节点分组
        List<Double> values = new ArrayList<Double>();//连线分组

        List<String> results = ThriftUtils.searchHBaseById(id, "WeiboTagRecomm1", 5);

        if (results.size() == 0) {
            System.out.print("未查询到对象");
            //nodes.add(new node("0", "未查询到对象", 10, 0,10));

            return new Radar(indicators, values);
        } else for (String rs : results) {
            System.out.println("EchartsManager.HBaseRadarData():" + rs);

        }

        //调整values和max的关系

        java.text.DecimalFormat myformat = new java.text.DecimalFormat("#0.00");//保留小数点数

        //分解内容
        for (int i = 0; i < results.size(); i += 2) {
//				 byte[] a=(results.get(i)).getBytes("gbk");
//				 System.out.print("manager： 比特长度 ： "+a.length+";;");
//				 String trim=new String(a,"UTF-8");
//				 indicators.add(new indicator(trim.trim(),12));
            indicators.add(new indicator(results.get(i), 10));
//				 System.out.println("内容： "+trim);	

            values.add(Double.valueOf(myformat.format(Double.valueOf(results.get(i + 1)))));

//				 trim=new String((trim+" ").getBytes("utf-8"),"UTF-8");
        }

        return new Radar(indicators, values);

    }

    public static List<JsonName> fromIdList2JsonName(List<String> IdList) throws IOException, URISyntaxException {
        List<JsonName> rs = Lists.newArrayList();
        for (String id : IdList) {
            rs.add(new JsonName(BlogNameUtils.FromBlogId2Name(id), id));

        }
        System.out.println("rslenght:" + rs.size());

        return rs;

    }

    private static List<Weibo> resultToWeiboList(List<String> result) {
        List<Weibo> weiboList = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        for (int i = 0; i < result.size(); i++) {
            if (i % 2 == 0) {
                map.put(result.get(i), result.get(i + 1));//get(i),List里取值
            }
        }
        for (int j = 0; j < 10; j++) {
            String formatStr = "cf%d:c%d";
            String content = map.get(String.format(formatStr, 2, j));
            String value = map.get(String.format(formatStr, 1, j));
            Weibo weibo = new Weibo(content == null ? "" : content, value == null ? "" : value);//判断是否为空并赋值
            weiboList.add(weibo);
        }

        return weiboList;
    }

    private static String formatDigit(String s) {
        int i;
        try {
            i = Integer.parseInt(s);
        } catch (NumberFormatException e) {
            i = 0;
        }
        return String.format("%02d", i);
    }

    private static List<String> convertTable = Arrays.asList(
            "0", "情感", "1", "教育", "2", "健康", "3", "时尚",
            "4", "生活", "5", "科技", "6", "娱乐", "7", "体育",
            "8", "经济", "9", "新闻", "10", "社会", "11", "视频");


    private static String convertCategory(String s) {
        if (!Pattern.matches("\\d+", s)) {
            int index = convertTable.indexOf(s);
            if (index != -1) {
                index = index - 1;
                if (index < convertTable.size()) {
                    return convertTable.get(index);
                }
            }
        }
        return "";
    }
}
