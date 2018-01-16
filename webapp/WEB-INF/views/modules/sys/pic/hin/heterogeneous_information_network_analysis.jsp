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
<%--<div id="navbar-main">--%>
    <%--<!-- Fixed navbar -->--%>
    <%--<div class="navbar navbar-default navbar-fixed-top">--%>
        <%--<div class="container">--%>

            <%--<div class="navbar-collapse collapse">--%>
                <%--<ul class="nav navbar-nav navbar-right">--%>
                    <%--<li> <a href="#about" class="smoothScroll"> 系统介绍</a></li>--%>
                    <%--<li> <a href="#services" class="smoothScroll"> 项目基本情况</a></li>--%>
                    <%--<li> <a href="#portfolio" class="smoothScroll"> 项目进展情况</a></li>--%>
                    <%--<li> <a href="#team" class="smoothScroll"> 项目后续计划</a></li>--%>
                    <%--<li> <a href="#contact" class="smoothScroll"> 联系我们</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!--/.nav-collapse -->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div id="team" name="team">
    <div class="container">
        <div class="row centered">
            <h2 class="centered">无处不在的信息网络</h2>
            <div class="col-lg-8 col-lg-offset-2 centered">
                <hr>
                <%--<p class="large">大数据分析系统的设计就是用实践的，只有经过实际的应用才能检验大数据系统是否符合大数据时代下海量数据的挖掘。以下是在大数据分析系统中实现的案例</p>--%>
            </div>
            <div class="col-md-13" style="text-align: left">
                <%--<h3>无处不在的信息网络：</h3>--%>
                <div>
                    <style type="text/css"> ul{color:white}</style>
                </div>
                <ul>
                    <li>信息网络是一种现实世界的抽象表达，它一般将实体当成网络中的节点和实体间的关系当做网络中的边</li>
                    <%--<h3>大数据与异构信息网络</h3>--%>
                    <li>信息网络无处不在，例如社交网络中，将用户、电影、图片等作为节点，用户与用户之间的关系，比如朋友关系、用户与电影、用户与图片间的关系作为边，便构成了社交网络。</li>
                    <li>通过分析信息网络，可以挖掘出现实世界中许多隐藏的信息。因此，从信息网络中挖掘信息获取知识已经成为当前的研究热点之一。</li>
                </ul>
            </div>
            <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/xitongjieshao1.png" height="190px" width="175px" alt="">
                <%--<h4>微博数据</h4>--%>
                <%--<p align="left">通过对爬取的新浪微博的用户数据和微博内容数据进行分析，做了微博用户好友的推荐、热门微博榜和微博内容的推荐，极大地解决了用户在海量信息面前难以获取自己感兴趣的信息的难题。同时还做了微博用户标签的推荐使广告的投放更有针对性。，</p>--%>
            </div>
            <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/xitongjieshao2.png" height="228px" width="226px" alt="">
                <%--<h4>电信数据</h4>--%>
                <%--<p align="left">通过对海量的电信AAA话单数据进行处理，大数据分析系统对网络用户、网络流量、网络掉线和网络切换分析，对异常基站进行预测，并可视化展示出来。电信通过这些结果大大提高了其网络优化的效率和质量。</p>--%>
            </div>
            <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/jibenqingkuang3.png" height="190px" width="170px" alt="">
                <%--<h4>异构信息网络</h4>--%>
                <%--<p align="left">随着图数据规模的爆炸式增长，其形式也越来越复杂.异构信息网可建模成包含多种类型的顶点和多种类型的边的图。尤其是多模态的异构信息网络，通过对这些异构信息数据挖掘分析，比同构信息网络数据挖掘出来的价值更多。</p>--%>
            </div>


        <%--</div>--%>
        <%--<div class="col-lg-8 col-lg-offset-2 centered">--%>
            <%--<hr>--%>
            <%--<p class="large">以上是案例的简单的介绍，在数据展示界面会有这些案例的详细处理过程以及处理后的结果展示</p>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- row -->
</div>
<!-- container -->
        <!-- ==== ABOUT ==== -->
        <%--<div id="about" name="about">--%>
            <%--<div class="container">--%>
                <%--<div class="row white">--%>
                    <%--<h2 class="centered">系统介绍</h2>--%>
                    <%--<div class="col-md-6"> <img class="img-responsive" src="${ctxStatic}/assets/img/about/introduction_system1.png" align=""> </div>--%>
                    <%--<div class="col-md-6">--%>
                        <%--<h3>简介</h3>--%>
                        <%--<p>大数据分析系统致力于为客户提供挖掘海量数据的潜在价值的一站式服务。大数据分析系统主要分为大数据处理平台和大数据展示平台。当客户提供资源并提出需求时，大数据处理平台会加载数据，并根据数据特点制定处理方案。然后通过大数据处理平台对数据--%>
                            <%--进行处理。当大数据处理平台处理完之后，大数据展示系统会根据处理后的结果选择合适的方式进行Web端展示，满足客户的需求。</p>--%>
                        <%--<h3>功能</h3>--%>
                        <%--<p>目前大数据时代已经到来，各行各业产生了多类别PB级的数据集，这样的数据集无法用传统的处理方法对其进行处理和分析。大数据分析系统针对大数据处理设计的。具有数据采集、数据处理、统计分析、数据挖掘和数据可视化功能。</p>--%>

                    <%--</div>--%>
                <%--</div>--%>
                <!-- row -->
            </div>
        </div>

<div id="about" name="about">
    <div class="container">
        <div class="row white">
            <h2 class="centered">同构信息网络 VS 异构信息网络</h2>
            <div class="col-lg-8 col-lg-offset-2 centered">
                <hr>
                </div>
            <%--<div class="col-md-13">--%>
                <div class="col-md-6 ">
                    <h4>同构信息网络</h4>
                    <ul>
                        <li>单节点类型、单连接类型的网络</li>
                        <li>信息量小</li>
                        <li>网络模型简单</li>
                        <li>例如：简单的社交网络（用户）</li>
                    </ul>
                </div>
                <div class="col-md-6 ">
                    <h4>异构信息网络</h4>
                    <ul>
                        <li>多节点类型、多链接类型的网络</li>
                        <li>信息量大</li>
                        <li>网络模型复杂</li>
                        <li>例如：一般的社交网络（用户、群组、多媒体内容）</li>
                    </ul>
                </div>
            </div>
        <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/vs1.png" height="200px" width="200px" alt="">
            <%--<p align="left">通过对爬取的新浪微博的用户数据和微博内容数据进行分析，做了微博用户好友的推荐、热门微博榜和微博内容的推荐，极大地解决了用户在海量信息面前难以获取自己感兴趣的信息的难题。同时还做了微博用户标签的推荐使广告的投放更有针对性。，</p>--%>
        </div>
        <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/vs2.png" height="110px" width="110px" alt="">
            <%--<p align="left">通过对爬取的新浪微博的用户数据和微博内容数据进行分析，做了微博用户好友的推荐、热门微博榜和微博内容的推荐，极大地解决了用户在海量信息面前难以获取自己感兴趣的信息的难题。同时还做了微博用户标签的推荐使广告的投放更有针对性。，</p>--%>
        </div>
        <div class="col-md-4 centered"> <img class="img img-thumbnail" src="${ctxStatic}/assets/img/about/vs3.png" height="210px" width="210px" alt="">
            <%--<p align="left">通过对爬取的新浪微博的用户数据和微博内容数据进行分析，做了微博用户好友的推荐、热门微博榜和微博内容的推荐，极大地解决了用户在海量信息面前难以获取自己感兴趣的信息的难题。同时还做了微博用户标签的推荐使广告的投放更有针对性。，</p>--%>
        </div>

        <div style="margin-top: 20pt;">.</div>

            <ul>
                <li>相比同构信息网络，分析异构信息网络能获得更丰富的信息。</li>
                <li>比如：异构的社交网络可以分析：用户可能给哪些多媒体内容打哪些标签等信息。</li>
            </ul>

        </div>
        <!-- row -->
    </div>

<!-- ==== ABOUT ==== -->
<div id="services" name="services">
    <div class="container">
        <div class="row white">
            <h2 class="centered">无处不在的信息网络</h2>
            <div>
                <hr>
            </div>

            <div class="col-md-13">
                    <%--<h3>模式丰富的异构信息网络</h3>--%>
                <div class="col-md-13 ">
                    <h3>模式丰富的异构信息网络</h3>
                    <div color="#fff" align="left">
                        <ul>
                    <li>简单异构信息网络，可以用简单的网络模式描述网络结构。</li>
                    <li>现实世界中，网络情况更加复杂，节点和链接类型不计其数，模式丰富，无法用简单的网络模式来描述——模式丰富的异构信息网络</li>
                    <li>最典型的例子是大规模知识库（YAGO、DBpedia、NELL、Freebase及Google知识图谱等），包含百万数量级别的节点及十亿数量级别的链接，蕴含极为丰富的信息量亟待挖掘。</li>
                    </ul>
                        </div>
                    </div>
                <%--<div class="col-md-6 ">--%>
                    <%--<h4>异构信息网络</h4>--%>
                    <%--<ul>--%>
                    <%--<li>多节点类型、多链接类型的网络</li>--%>
                    <%--<li>信息量大</li>--%>
                    <%--<li>网络模型复杂</li>--%>
                    <%--<li>例如：一般的社交网络（用户、群组、多媒体内容）</li>--%>
                    <%--</ul>--%>
                </div>
                </div>
                <%--<h3></h3>--%>
                    <%--<ul>--%>
                        <%--<li>相比同构信息网络，分析异构信息网络能获得更丰富的信息。</li>--%>
                        <%--<li>比如：异构的社交网络可以分析：用户可能给哪些多媒体内容打哪些标签等信息</li>--%>
                    <%--</ul>--%>
                <div class="col-md-13">
                   <%--<h3 class="">模式丰富的异构信息网络</h3>--%>
                    <div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/about/yigouxinxiwangguanxitu.png" height="180px" width="180px" alt=""></div>
                </div>
        </div>
    </div>

<%-----------------%>
        <div id="about" name="about">
            <div class="container">
                <div class="row white">
            <div class="col-md-13">
                <h2 style="text-align: center">大数据与异构信息网络</h2>
                <div>
                    <hr>
                </div>
                <h4>数据时代，数据多呈现大量化和多样化的特点：</h4>
                <%--<div>--%>
                <%--<style type="text/css"> ul{color:black}</style>--%>
            <%--</div>--%>
                <ul>

                    <li><strong>大量化：</strong>全球在正式进入ZB时代，庞大的数据量给数据分析带来一定的挑战</li>
                    <li><strong>多样化：</strong><P><strong>来源多</strong>（搜索引擎，社交网络，通话记录，传感器……）；</P><p><strong>类型多</strong>（文本、图像、视频、网页数据、机器数据……）</p></li>

                </ul>


                <p>异构信息网络将不同类型、不同来源的实体抽象为节点，实体间的关系抽象为边的建模方法，可以很好地解决大数据多样化的问题。</p>
                <p>现实世界的异构信息网络规模巨大，利用大数据计算方法和存储机制可以对这样的网络进行挖掘。</p>
                <div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/about/dashujuyuyigouxinxiwangluo.png" height="180px" width="180px" alt=""></div>
            </div>
        </div>
    </div>
            </div>
        <%--<!-- row -->--%>
    <%--</div>--%>
<%--</div>--%>
<!-- container -->

<!-- ==== SERVICES ==== -->
<div id="services" name="services">
    <div class="container">
        <div class="row">
            <h2 class="centered">研究现状</h2>

            <div class="col-lg-8 col-lg-offset-2">
                <hr>
            </div>
            <h3 style="text-align: left">现有研究局限与不足主要在于：</h3>
            <p style="text-align: left" >大部分针对信息网络的研究，将真实世界的网络看作同构的，忽略了节点及链接的种类多样性，导致了对真实网络的刻画准确率低下，丢失了大量的语义信息。</p>
            <P style="text-align: left">现有异构信息网络的研究，主要集中于研究节点和链接类型比较少，结构比较简单的异构信息网络的数据挖掘，模式丰富的异构信息网络很少涉及，且关于异构信息网络的信息扩散及传播规律的研究很少。</P>
            <p style="text-align: left">大部分异构信息网络的研究，还停留在对静态异构信息网的分析阶段，对网络随时间动态演化的特征还鲜有研究。</p>
            <%--<div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/xitongjieshao1.png" height="60px" width="130px" alt=""></div>--%>
            <%--<div class="col-lg-3 "> <i class="fa fa-dot-circle-o fa-3x"></i>--%>
                <%--<h3></h3>--%>
                <%--<p>信息网络无处不在，例如社交网络中，将用户、电影、图片等作为节点，用户与用户之间的关系，比如朋友关系、用户与电影、用户与图片间的关系作为边，便构成了社交网络。</p>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;<div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/xitongjieshao2.png" alt=""></div>&ndash;%&gt;--%>
            <%--<div class="col-lg-3 "> <i class="fa fa-dot-circle-o fa-3x"></i>--%>
                <%--<h3></h3>--%>
                <%--<p>通过分析信息网络，可以挖掘出现实世界中许多隐藏的信息。因此，从信息网络中挖掘信息获取知识已经成为当前的研究热点之一。</p>--%>
            <%--</div>--%>
            <%--<div align="center"><img class="img-responsive" width=70% src="${ctxStatic}/assets/img/jibenqingkuang3.png" alt=""></div>--%>
        </div>
        <!-- row -->
    </div>
</div>
<!-- container -->

<!-- ==== PORTFOLIO ==== -->
<div id="portfolio" name="portfolio">
    <div class="container">
        <div class="row">
            <h2 class="centered">研究内容</h2>
            <div class="col-lg-8 col-lg-offset-2 centered">
                <hr>
            </div>
            <h3 class="large">研究内容一：基于大数据的异构信息网络结构特性及模型的研究</h3>
            <ul>
                <li>对大数据异构信息网络的实体关系进行研究</li>
                <li>对模式丰富的大数据异构信息网络的实体关系进行研究</li>
            </ul>
            <h3 class="large">研究内容二：基于大数据的异构信息网络的数据挖掘及信息传播规律研究</h3>
            <ul>
                <li>（模式丰富的）大数据异构信息网络数据挖掘研究：相似性度量、聚类、分类及排序</li>
                <li>大数据异构信息网络的信息扩散及影响力传播规律的研究</li>
            </ul>
            <h3 class="large">研究内容三：基于大数据的异构信息网络的演化机理研究</h3>
            <ul>
                <li>对网络拓扑结构的动态关联和演化规律进行研究</li>
            </ul>

            <%--<div class="col-md-6"> <img class="img-responsive" src="${ctxStatic}/assets/img/jizhanliuliangxiangguantu.png" align=""> </div>--%>
            <%--<div class="col-md-6"> <img class="img-responsive" src="${ctxStatic}/assets/img/jizhanrelitu.png" align=""> </div>--%>
            <%--<div class="col-md-6">--%>
                <%--<h3>异构信息网络的实体关系发现研究</h3>--%>
                <%--<p><strong>意义：</strong>如何从大规模知识库中获取有用的信息，进行知识寻径成为最近的研究热点</p>--%>
                <%--<p><strong>难点：</strong>模式丰富的异构信息网络中，实体间关系非常复杂、庞大，枚举关系路径搜索空间、计算量非常大。</p>--%>
                <%--<h3>异构信息网络的信息传播规律研究</h3>--%>
                <%--<p><strong>意义：</strong>通过分析电信网络产生的大数据来掌握网络运行情况，不仅可以节约人工路测的成本，而且实时性高，可以对未来的异常进行提前预测。</p>--%>
                <%--<p><strong>难点：</strong>如何从大量的数据中找到规律，发现潜在异常；数据量巨大，如何提升处理速度。</p>--%>
                <%--<p><strong>方法：</strong>采用Moran's I指标进行基站流量的空间自相关分析以发现异常基站；采用大数据分布式计算技术来加快处理速度。</p>--%>

            <%--</div>--%>
        </div>
        <!-- /row -->

        <!-- /row -->
    </div>
</div>
<!-- /container -->

<!-- ==== TEAM MEMBERS ==== -->
<%--<div id="team" name="team">--%>
    <%--<div class="container">--%>
        <%--<div class="row centered">--%>
            <%--<h2 class="centered">项目后续计划</h2>--%>
            <%--<div class="col-lg-8 col-lg-offset-2 centered">--%>
            <%--<hr>--%>
                <%--<h3>异构信息网络结构特征及描述模型的研究</h3>--%>
            <%--<p class="large">模式复杂的异构信息网络下，实体间关系复杂多样、网络结构无既定的模式。如何理解在这种网络背后蕴藏的大量信息及实体间的关系，不仅能深刻认识网络的内在规律和本质特征，而且可以为聚类等挖掘任务奠定基础。</p>--%>
            <%--</div>--%>
            <%--<!--<div class="col-md-4 centered"> <img class="img img-responsive" src="${ctxStatic}/assets/img/xiangmuhouxu1.png" height="180px" width="180px" alt="">-->--%>
                <%--<h4>基于元结构的复杂关系的研究</h4>--%>
                <%--<p align="left">在元路径的基础上进行扩展，构建元结构来描述实体间的复杂关系，并基于元结构设计相关性度量以及探究不同的元结构对实体关系的影响。</p>--%>
                 <%--</div>--%>
            <%--<!--<div class="col-md-4 centered"> <img class="img img-circle" src="${ctxStatic}/assets/img/telecom.jpg" height="180px" width="180px" alt="">-->--%>
                <%--<h4>模式复杂的异构信息网络下多实体间关系解释研究</h4>--%>
                <%--<p align="left">现有的实体关系研究只能对两个实体间的关系进行发现和解释，不能针对多个实体间进行关系解释，有很大的局限性；多个实体间的关系解释不仅可以提取网络中感兴趣的新模式结构，而且可以为简化社区发现提供帮助。</p>--%>
                <%--</div>--%>
            <%--<!--<div class="col-md-4 centered"> <img class="img img-circle" src="${ctxStatic}/assets/img/network.jpg" height="180px" width="180px" alt="">-->--%>
                <%--<h4>异构信息网络</h4>--%>
                <%--<p align="left">随着图数据规模的爆炸式增长，其形式也越来越复杂.异构信息网可建模成包含多种类型的顶点和多种类型的边的图。尤其是多模态的异构信息网络，通过对这些异构信息数据挖掘分析，比同构信息网络数据挖掘出来的价值更多。</p>--%>
            <%--</div>--%>
<%--<div class="col-lg-8 col-lg-offset-2 centered">--%>
    <%--<hr>--%>
<%--<h3>异构信息网络的信息传播规律研究</h3>--%>
<%--<p class="large">影响力是指导节点行为和描述关系信息的有力工具，影响力分析大部分应用在社交网络，在异构信息网络中结合影响力传播。</p>--%>
<%--</div>--%>
<%--<!--<div class="col-md-4 centered"> <img class="img img-responsive" src="${ctxStatic}/assets/img/xiangmuhouxu1.png" height="180px" width="180px" alt="">-->--%>
<%--<h4>异构信息网络的影响力学习研究</h4>--%>
<%--<p align="left">在元路径的基础上进行扩展，构建元结构来描述实体间的复杂关系，并基于元结构设计相关性度量以及探究不同的元结构对实体关系的影响。</p>--%>
<%--<h4>异构信息网络下的基于影响力传播的分类研究</h4>--%>
<%--<p align="left">在元路径的基础上进行扩展，构建元结构来描述实体间的复杂关系，并基于元结构设计相关性度量以及探究不同的元结构对实体关系的影响。</p>--%>
<%--</div>--%>


        <%--</div>--%>
        <%--<div class="col-lg-8 col-lg-offset-2 centered">--%>
            <%--<hr>--%>
            <%--<p class="large">以上是案例的简单的介绍，在数据展示界面会有这些案例的详细处理过程以及处理后的结果展示</p>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!-- row -->--%>
<%--</div>--%>
<!-- container -->

<!-- ==== CONTACT ==== -->
<%--<div id="contact" name="contact">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<h2 class="centered">联系我们</h2>--%>
            <%--<hr>--%>
            <%--<div class="col-md-4 centered"> <i class="fa fa-map-marker fa-2x"></i>--%>
                <%--<p>北京邮电大学<br>--%>
                    <%--教三6楼607</p>--%>
            <%--</div>--%>
            <%--<div class="col-md-4"> <i class="fa fa-envelope-o fa-2x"></i>--%>
                <%--<p>renguifu@bupt.edu.cn</p>--%>
            <%--</div>--%>
            <%--<div class="col-md-4"> <i class="fa fa-phone fa-2x"></i>--%>
                <%--<p> 13269339077</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-8 col-lg-offset-2 centered">--%>
                <%--<p>如果你需要挖掘海量数据背后的价值赶快联系我们吧，同时欢迎大家与我们关于大数据挖掘方面的进行交流。</p>--%>

                <%--<!-- form -->--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- row -->--%>

    <%--</div>--%>
<%--</div>--%>
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
