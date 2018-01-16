<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/10
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<html>
<head>
    <title>网络用户分析</title>
    <meta charset="utf-8">
</head>
<body>
<div style="padding-top: 10px;padding-left:20px;">
    <p><b>网络用户分析包括对整个区域网络的网络总用户 Top 20 基站横柱图和总用户时间分布折线图：</b></p>
</div>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>网络总用户 Top20 基站</dt>
            <dd class="clearfix">
                <div id="top20_user" style="height:550px"></div>

                <script type="text/javascript">

                    var myChart = echarts.init(document.getElementById('top20_user'));

                    option = {
                        title: {
                            text: '网络总用户数Top20'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['总用户数']
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
                                data: ['3674000D65C1', '3674000DC510', '3674000D1091', '367400071F50', '3674000D97F0', '367400075882', '3674000D9972', '3674000DCC70', '3674000D7471', '36740007C442', '3674000D8B80', '3674000D0FF2', '3674000701C2', '3674000D7E42', '3674000DD452', '3674000DA861', '3674000D9792', '3674000DB5E2', '3674000D7631', '3674000DB852']
                            }
                        ],
                        series: [
                            {
                                name: '总用户数',
                                type: 'bar',
                                data: [4022, 4027, 4083, 4105, 4120, 4178, 4419, 4486, 4545, 4546, 4743, 4768, 4833, 5079, 5358, 5450, 5490, 5695, 6645, 7174]
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
            <dt>总用户时间分布图</dt>
            <dd class="clearfix">
                <div id="totaluser_trend" style="height: 400px"></div>

                <script type="text/javascript">

                    var myChart = echarts.init(document.getElementById('totaluser_trend'));

                    option = {
                        title: {
                            text: '总用户时间分布图'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['用户数']
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
                                name: '用户数',
                                type: 'line',
                                data: [43408,168035,156609,147944,150795,176358,235315,320826,273820,378146,294802,104119,104760,380659,295102,447704,454179,479016,332322,432047,413826,382413,320459,105809],
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
    <div class="clearfix" style="padding:15px 0;"></div>
</div>
</body>
</html>
