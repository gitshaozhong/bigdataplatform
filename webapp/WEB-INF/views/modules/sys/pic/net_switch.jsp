<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/10
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<html>
<head>
    <title>网络切换分析</title>
    <meta charset="utf-8">
</head>
<body>
<div style="padding-top: 10px;padding-left:20px;">
<p><b>网络切换分析包括对整个区域网络的网络切换次数 Top20 基站横柱图和网络切换次数时间分布折线图：</b></p>
</div>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>网络切换次数 Top20 基站</dt>
            <dd class="clearfix">
                <div id="top20_switch" style="height:550px"></div>

                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('top20_switch'));

                    option = {
                        title : {
                            text: '网络切换次数Top20'
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['切换次数']
                        },
                        toolbox: {
                            show : false,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        grid : {

                            x : 100,
                            y : 60

                        },
                        xAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        yAxis : [
                            {
                                type : 'category',
                                data : ['36740007A541','3674000DAC52','367400072A52','3674000DB600','3674000700E1','3674000DB792','3674000D6F11','367400073451','3674000DA9C0','3674000D8840','367400075B21','3674000D9E60','367400075BF0','367400075330','36740007B3F1','367400075921','3674000DB810','367400075B70','3674000D0B60','3674000D0BF1']
                            }
                        ],
                        series : [
                            {
                                name:'切换次数',
                                type:'bar',
                                data:[157,157,159,166,170,170,172,173,189,198,204,210,211,219,223,244,356,386,403,540]
                            }
                        ]
                    };

                    // 为echarts对象加载数据
                    myChart.setOption(option);

                </script>
            </dd>
        </dl>
    </div>
    <div>
        <dl class="itemBox">
            <dt> 网络切换次数时间分布图</dt>
            <dd class="clearfix">
                <div id="switch_trend" style="height: 400px"></div>

                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('switch_trend'));

                    option = {
                        title : {
                            text: ' 网络切换次数时间分布图'
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['网络切换次数']
                        },
                        toolbox: {
                            show : false,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'category',
                                boundaryGap : false,
                                data : [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value',
                                axisLabel : {
                                    formatter: '{value}'
                                }
                            }
                        ],
                        series : [
                            {
                                name:'网络切换次数',
                                type:'line',
                                data:[26,879,922,725,919,1277,2140,3222,1852,4270,2515,309,263,4330,2577,5620,5603,5599,2255,4974,4894,4545,3250,670],
                                markPoint : {
                                    data : [
                                        {type : 'max', name: '最大值'},
                                        {type : 'min', name: '最小值'}
                                    ]
                                },
                                markLine : {
                                    data : [
                                        {type : 'average', name: '平均值'}
                                    ]
                                }
                            }
                        ]
                    };

                    // 为echarts对象加载数据
                    myChart.setOption(option);

                </script>
            </dd>
        </dl>
    </div>
    <div class="clearfix" style="padding:15px 0;"></div>
</div>
</body>
</html>
