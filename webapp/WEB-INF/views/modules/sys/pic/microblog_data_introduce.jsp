<%--
  Created by IntelliJ IDEA.
  User: tomxie
  Date: 2016/7/19
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>微博数据分析</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="${ctxStatic}/img/techjunkie/images/TechJunkie.css" type="text/css"/>
</head>
<body>
<div id="wrap">
    <!--header -->
    <div id="header">
        <h1 id="logo-text"><a>微博数据分析</a></h1>
        <%--<p id="slogan">天津地区</p>--%>
    </div>
    <!-- content-wrap starts -->
    <div id="content-wrap">
        <div id="main">
            <h2><a>意义</a></h2>
            <p>
                随着互联网技术的飞速发展，网络用户的数量不断增加，由网络产生的数据量呈爆炸式增长，社会已经进入了大数据时代。社交网络作为大数据时代下发展最为迅速的互联网服务之一，为用户提供了一个便捷的线上社交方式，拓展了用户的社交圈。微博作为一种典型的社交网络，拥有庞大的用户群体和海量的数据集。通过对微博产生的海量信息进行分析处理，能够得出用户的兴趣爱好、舆论导向等隐含信息，然后根据此类信息进行推荐、预测等操作，帮助用户更快地获得有效信息，提升微博的使用体验。
            </p>
            <h2><a>数据介绍</a></h2>
            <p>
                新浪微博数据作为微博数据分析系统的主要分析对象，可以被分成两个部分：一个用户数据，另一个是内容数据，对这两个部分的分析如下。<br>
                微博用户数据是新浪微博的在注册用户的用户信息。微博用户大体上可以分为非个人用户和个人用户两种。非个人用户中包含官方用户，企业用户和组织用户等，官方用户主要用于微博官方的推广；企业用户主要由企业进行管理，主要进行企业的宣传；组织用户主要作为组织的信息发布门户进行相关信息的发布。个人用户中主要包含名人用户，网络红人和一般用户，名人用户是名人所拥有的账号，一般具有较高的社会影响力，能够在很大程度上影响舆论的方向；网络红人拥有一定的网络影响力，但一般小于名人用户；一般用户是微博的主要用户群体，他们主要通过关注的名人用户等信息源进行信息的获取，并通过好友关注网络进行信息的传播。<br>
                微博内容数据是新浪微博用户发布的微博信息。微博内容数据可以分为原创微博和转发微博两种，转发微博除了包含原创微博所包括的消息ID、发布者ID、消息内容，发布时间、转发评论点赞次数信息之外还包括转发消息的ID，消息内容除了包含文字内容外，还可能包含图片、音乐、视频等多媒体内容，需要对多媒体内容进行解析，转化成文字信息再进行后续处理。通过分析原创微博能够发现热点话题，舆论导向等信息；通过分析转发微博能够对用户的兴趣进行挖掘，后续可以将挖掘结果应用到推荐等相关功能上。
            </p>
            <h2><a>数据处理框架</a></h2>
            <p>
                微博数据处理框架设计图如下图所示：
            </p>
            <p align="center"><img src="${ctxStatic}/img/techjunkie/images/weibo_system.png" alt="网络连接出现问题" width="400" height="400"></p>
            <p>
                根据上图，整个微博数据处理系统可以分成四个模块分别是：数据采集模块，数据处理模块，结果存储模块和数据展示模块。四个模块实现了从数据采集，处理，存储和展示的整个过程。各个模块的设计与实现功能如下：<br>
                数据采集模块主要负责原始数据的获取与数据的汇总，据此可以将数据采集模块分为两个部分，分别是数据获取部分和数据汇总部分，数据获取部分使用公开的爬虫工具在多个节点上进行并行爬取，爬取的数据先保存到当前节点的指定目录，由后台的数据汇总进程监控目录，将目录下的文件远程上传到Hadoop集群的HDFS中。数据采集模块为后续的数据分析与处理提供了支持。<br>
                数据处理模块是微博推荐系统中的核心模块，主要负责对从数据采集模块获得的原始数据进行分割、清洗、提取与运算，完成获取推荐信息的任务。数据处理模块需要根据原始微博数据的字段信息，从中提取出与推荐系统需求相关的字段信息，从提取的信息中构建社交网络模型，并利用相关推荐算法，对用户进行推荐。涉及的推荐算法可以通过MapReduce或Spark提供的MLlib和GraphX库进行实现，充分利用分布式运算资源，实现更快速的大数据处理。<br>
                结果存储模块为数据处理模块处理所得的结果设计数据库结构，并负责结果的数据库存储，同时为数据展示模块提供数据库远程访问接口。结果存储模块主要采用分布式数据库HBase和HBase Thrift
                Server为基础组件。结果存储模块通过HBase提供的MapReduce
                API从HDFS中读取结果数据，并存储到设计好的HBase表格中，数据展示模块利用结果存储模块的Thrift服务提供的HBase远程访问端口，利用Thrift
                API从HBase中读取前端展示所需的数据。<br>
                数据展示模块负责将数据分析结果，此处为推荐结果。数据展示模块采用可定制化的数据可视化工具ECharts实现推荐结果的可视化展示，通过多种类型的图表直观、生动地向用户展示多种推荐内容。数据展示模块在微博推荐系统中有着重要的作用，用户可以通过推荐结果的可视化展示获取个性化的推荐信息。<br>
            </p>
            <!-- main ends -->
        </div>
        <!-- content-wrap ends-->
    </div>
</div>
</body>
</html>
