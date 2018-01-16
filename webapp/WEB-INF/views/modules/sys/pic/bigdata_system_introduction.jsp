<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html lang="ch-zn">
<head>
    <meta charset="utf-8">



    <!-- Bootstrap core CSS -->
    <link href="${ctxStatic}/assets/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctxStatic}/assets/css/main.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/css/animate-custom.css" rel="stylesheet">
    <%--<link href='http://fonts.useso.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.useso.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>--%>
    <script src="${ctxStatic}/assets/js/jquery.min.js"></script>
    <script type="${ctxStatic}/text/javascript" src="assets/js/modernizr.custom.js"></script>


</head>

<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
<div id="navbar-main">
    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#home" class="smoothScroll">首页</a></li>
                    <li> <a href="#about" class="smoothScroll"> 系统介绍</a></li>
                    <li> <a href="#services" class="smoothScroll"> 大数据处理平台</a></li>
                    <li> <a href="#portfolio" class="smoothScroll"> 大数据可视化系统</a></li>
                    <li> <a href="#team" class="smoothScroll"> 案例</a></li>
                    <li> <a href="#contact" class="smoothScroll"> 联系我们</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<!-- ==== HEADERWRAP ==== -->
<div id="headerwrap" name="home">
    <header class="clearfix">
        <h1>大数据分析系统</h1>
        <p>下一代通信系统理论与技术研究室</p>
    </header>
</div>
<!-- /headerwrap -->

<!-- ==== ABOUT ==== -->
<div id="about" name="about">
    <div class="container">
        <div class="row white">
            <h2 class="centered">系统介绍</h2>
            <div class="col-md-6"> <img class="img-responsive" src="${ctxStatic}/assets/img/about/introduction_system1.png" align=""> </div>
            <div class="col-md-6">
                <h3>简介</h3>
                <p>大数据分析系统致力于为客户提供挖掘海量数据的潜在价值的一站式服务。大数据分析系统主要分为大数据处理平台和大数据展示平台。当客户提供资源并提出需求时，大数据处理平台会加载数据，并根据数据特点制定处理方案。然后通过大数据处理平台对数据
                    进行处理。当大数据处理平台处理完之后，大数据展示系统会根据处理后的结果选择合适的方式进行Web端展示，满足客户的需求。</p>
                <h3>功能</h3>
                <p>目前大数据时代已经到来，各行各业产生了多类别PB级的数据集，这样的数据集无法用传统的处理方法对其进行处理和分析。大数据分析系统针对大数据处理设计的。具有数据采集、数据处理、统计分析、数据挖掘和数据可视化功能。</p>

            </div>
        </div>
        <!-- row -->
    </div>
</div>
<!-- container -->

<!-- ==== SERVICES ==== -->
<div id="services" name="services">
    <div class="container">
        <div class="row">
            <h2 class="centered">大数据处理平台</h2>

            <div class="col-lg-8 col-lg-offset-2">
                <hr>
                <p class="large">大数据处理平台提供PB级数据的采集、处理和分析能力，采用了全新的调度框架，能够极大地提升物理集群的效率。大数据处理平台主要是在Cloudera Hadoop生态系统上构建的。</p>
            </div>
            <div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/bigdata_system.png" alt="网络连接异常"></div>
            <div class="col-lg-3 callout"> <i class="fa fa-dot-circle-o fa-3x"></i>
                <h3>HDFS</h3>
                <p>HDFS 是一个高度容错的分布式文件系统，提供给大数据集的高吞吐量的访问。HDFS是大数据处理平台的数据存储系统</p>
            </div>
            <div class="col-lg-3 callout"> <i class="fa fa-dot-circle-o fa-3x"></i>
                <h3>Yarn</h3>
                <p>YARN 是一种新的Hadoop 资源管理器，是大数据处理平台的资源管理系统，可为上层应用提供统一的资源管理和调度。</p>
            </div>
            <div class="col-lg-3 callout"> <i class="fa fa-dot-circle-o fa-3x"></i>
                <h3>MapReduce</h3>
                <p>MapReduce 是一种分布式计算框架，用于大规模数据集的并行运算。在大数据处理平台中MapReduce主要用来实现数据的统计分析。</p>
            </div>
            <div class="col-lg-3 callout"> <i class="fa fa-dot-circle-o  fa-3x"></i>
                <h3>Spark</h3>
                <p>Spark 是基于内存的分布式迭代计算框架，用于大规模数据集的迭代计算。在大数据处理平台中Spark主要用来的进行数据挖掘。</p>
            </div>

        </div>
        <!-- row -->
    </div>
</div>
<!-- container -->

<!-- ==== PORTFOLIO ==== -->
<div id="portfolio" name="portfolio">
    <div class="container">
        <div class="row">
            <h2 class="centered">大数据可视化系统</h2>
            <div class="col-lg-8 col-lg-offset-2 centered">
                <hr>
                <p class="large">大数据可视化系统作为大数据分析系统的必不可少的一个环节。大数据可视化系统用来把大数据处理平台处理后的结果展现在客户面前，
                    大数据可视化系统能够直观的呈现出大数据分析后的结果，使客户能够非常容易地获得数据的价值从而满足自己的需求。</p>
            </div>
            <div class="col-md-6"> <img class="img-responsive" src="${ctxStatic}/assets/img/system_display.png" align=""> </div>
            <div class="col-md-6">
                <h3>登录界面</h3>
                <p>登录界面是进入大数据可视化系统的入口。登录界面根据用户名和密码判断用户的属于普通用户还是管理员用户。普通用户登录之后只能显示数据展示界面。而管理员用户登录之后显示数据展示界面和管理界面</p>
                <h3>主界面</h3>
                <p>主界面是用户登录之后进入的界面。主界面主要包括两个部分：<strong>数据展示</strong>和<strong>管理界面</strong>。<strong>数据展示</strong>根据案例划分不同的专题，不同的专题下面会根据数据处理平台
                的结果选择合适的形式展现处理，目前主要用到Echarts。<strong>管理界面</strong>主要是管理员用来管理用户和维护系统。</p>

            </div>
        </div>
        <!-- /row -->

        <!-- /row -->
    </div>
</div>
<!-- /container -->

<!-- ==== TEAM MEMBERS ==== -->
<div id="team" name="team">
    <div class="container">
        <div class="row centered">
            <h2 class="centered">案例</h2>
            <div class="col-lg-8 col-lg-offset-2 centered">
            <hr>
            <p class="large">大数据分析系统的设计就是用实践的，只有经过实际的应用才能检验大数据系统是否符合大数据时代下海量数据的挖掘。以下是在大数据分析系统中实现的案例</p>
            </div>
            <div class="col-md-4 centered"> <img class="img img-circle" src="${ctxStatic}/assets/img/weibo.png" height="180px" width="180px" alt="">
                <h4>微博数据</h4>
                <p align="left">通过对爬取的新浪微博的用户数据和微博内容数据进行分析，做了微博用户好友的推荐、热门微博榜和微博内容的推荐，极大地解决了用户在海量信息面前难以获取自己感兴趣的信息的难题。同时还做了微博用户标签的推荐使广告的投放更有针对性。，</p>
                 </div>
            <div class="col-md-4 centered"> <img class="img img-circle" src="${ctxStatic}/assets/img/telecom.jpg" height="180px" width="180px" alt="">
                <h4>电信数据</h4>
                <p align="left">通过对海量的电信AAA话单数据进行处理，大数据分析系统对网络用户、网络流量、网络掉线和网络切换分析，对异常基站进行预测，并可视化展示出来。电信通过这些结果大大提高了其网络优化的效率和质量。</p>
                </div>
            <div class="col-md-4 centered"> <img class="img img-circle" src="${ctxStatic}/assets/img/network.jpg" height="180px" width="180px" alt="">
                <h4>异构信息网络</h4>
                <p align="left">随着图数据规模的爆炸式增长，其形式也越来越复杂.异构信息网可建模成包含多种类型的顶点和多种类型的边的图。尤其是多模态的异构信息网络，通过对这些异构信息数据挖掘分析，比同构信息网络数据挖掘出来的价值更多。</p>
            </div>


        </div>
        <div class="col-lg-8 col-lg-offset-2 centered">
            <hr>
            <p class="large">以上是案例的简单的介绍，在数据展示界面会有这些案例的详细处理过程以及处理后的结果展示</p>
        </div>
    </div>
    <!-- row -->
</div>
<!-- container -->

<!-- ==== CONTACT ==== -->
<div id="contact" name="contact">
    <div class="container">
        <div class="row">
            <h2 class="centered">联系我们</h2>
            <hr>
            <div class="col-md-4 centered"> <i class="fa fa-map-marker fa-2x"></i>
                <p>北京邮电大学<br>
                    教三6楼607</p>
            </div>
            <div class="col-md-4"> <i class="fa fa-envelope-o fa-2x"></i>
                <p>renguifu@bupt.edu.cn</p>
            </div>
            <div class="col-md-4"> <i class="fa fa-phone fa-2x"></i>
                <p> 13269339077</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 centered">
                <p>如果你需要挖掘海量数据背后的价值赶快联系我们吧，同时欢迎大家与我们关于大数据挖掘方面的进行交流。</p>

                <!-- form -->
            </div>
        </div>
        <!-- row -->

    </div>
</div>
<!-- container -->



<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script type="text/javascript" src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/js/retina.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/js/smoothscroll.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/js/jquery-func.js"></script>
</body>
</html>
