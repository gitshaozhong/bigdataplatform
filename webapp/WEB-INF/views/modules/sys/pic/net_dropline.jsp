<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/10
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<html>

<head>
    <title>网络掉线分析</title>
    <meta charset="utf-8"/>
</head>
<body>
<div style="padding-top: 10px;padding-left:20px;">
    <p><b>网络掉线分析包括对整个区域网络的掉线时间分布折线图、掉线量 Top 20 基站横柱图和掉线原因占比饼图：</b></p>
</div>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>掉线量时间分布图</dt>
            <dd class="clearfix">
                <div id="dropline_trend" style="height: 500px"></div>

                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('dropline_trend'));

                    option = {
                        title: {
                            text: '掉线量时间分布图'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['掉线量']
                        },
                        toolbox: {
                            show: false,
                            feature: {
                                mark: {show: true},
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                name: '时间',
                                type: 'category',
                                boundaryGap: false,
                                data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                axisLabel: {
                                    formatter: '{value}'
                                }
                            }
                        ],
                        series: [
                            {
                                name: '掉线量',
                                type: 'line',
                                data: [2,119,110,90,97,122,198,279,187,505,299,17,26,597,291,488,495,516,150,487,438,360,259,11],
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
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
    <div style="overflow: hidden">
        <div>
            <dl class="itemBox" style="float: left;width: 49%;margin-right: 2%">
                <dt>掉线量 Top20 基站</dt>
                <dd class="clearfix">
                    <div id="top20_dropline" style="height:500px"></div>

                    <script type="text/javascript">

                        // 基于准备好的dom，初始化echarts图表
                        var myChart = echarts.init(document.getElementById('top20_dropline'));

                        option = {
                            title: {
                                text: '掉线次数 Top20 基站'
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data: ['掉线次数']
                            },
                            toolbox: {
                                show: false,
                                feature: {
                                    mark: {show: true},
                                    dataView: {show: true, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar']},
                                    restore: {show: true},
                                    saveAsImage: {show: true}
                                }
                            },
                            calculable: true,
                            grid: {

                                x: 100,
                                y: 60

                            },
                            xAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'category',
                                    data : ['367400072B41','3674000773D2','36740007A310','36740007D100','36740007DD11','3674000DB0F0','3674000DCC70','3674000721C2','3674000760F0','3674000D8CB2','3674000716A2','3674000717D1','3674000745A0','367400075FD1','367400074710','367400074091','3674000D0401','3674000D7E91','367400071F61','367400072301']
                                }
                            ],
                            series: [
                                {
                                    name: '掉线次数',
                                    type: 'bar',
                                    data:[6,6,6,6,6,6,6,7,7,7,8,8,8,9,11,12,18,33,68,72]
                                }
                            ]
                        };

                        // 为echarts对象加载数据
                        myChart.setOption(option);

                    </script>
                </dd>
            </dl>
            <dl class="itemBox" style="float: left;width: 49%;">
                <dt>掉线原因占比</dt>
                <dd class="clearfix">
                    <div id="dropline_ratio" style="height:500px"></div>

                    <script type="text/javascript">

                        // 基于准备好的dom，初始化echarts图表
                        var myChart = echarts.init(document.getElementById('dropline_ratio'));

                        option = {
                            title : {
                                text: '掉线原因分析',
                                x:'center'
                            },
                            tooltip : {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient : 'vertical',
                                x : 400,
                                data:['信号中断','业务中断','端口错误']
                            },
                            toolbox: {
                                show : false,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    magicType : {
                                        show: true,
                                        type: ['pie', 'funnel'],
                                        option: {
                                            funnel: {
                                                x: '25%',
                                                width: '50%',
                                                funnelAlign: 'left',
                                                max: 4093
                                            }
                                        }
                                    },
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : true,
                            series : [
                                {
                                    name:'掉线原因',
                                    type:'pie',
                                    radius : '55%',
                                    center: ['50%', '60%'],
                                    data:[
                                        {value:4093, name:'信号中断'},
                                        {value:1750, name:'业务中断'},
                                        {value:300, name:'端口错误'}
                                    ]
                                }
                            ]
                        };
                        // 为echarts对象加载数据
                        myChart.setOption(option);

                    </script>
                </dd>
            </dl>
        </div>
    </div>

    <div class="clearfix" style="padding:15px 0;"></div>
</div>
</body>
</html>
