<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/8
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<html >
<head>
    <meta charset="UTF-8">

    <%--<script src="echarts.js"></script>--%>
</head>
<body>
<div style="padding-top: 10px;padding-left:20px;">
    <p><b>网络流量分析包括对整个区域网络的网络流量时间分布折线图、网络总用户Top 20基站横柱图和网络流量占比饼图：</b></p>
</div>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>网络流量时间分布图</dt>
            <dd class="clearfix">
                <div id="totaltraffic_trend" style="height: 500px"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('totaltraffic_trend'));
                    option = {
                        title: {
                            text: '网络流量时间分布图'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['EDVO上行流量','EDVO下行流量','CDMA 1X上行流量','CDMA 1X下行流量']
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
                                name: '流量',
                                type: 'value',
                                axisLabel: {
                                    formatter: '{value} GB'
                                }
                            }
                        ],
                        series: [
                            {
                                name: 'EDVO上行流量',
                                type: 'line',
                                data: [77.53,646.93,580.84,411.89,402.56,357.76,346.96,389.87,239.49,638.62,421.01,105.51,112.71,1034.87,617.21,1537.01,1494.6,1397.7,767.95,1416.53,1612.56,1728.15,1565.63,727.79]
                            },
                            {
                                name: 'EDVO下行流量',
                                type: 'line',
                                data: [471.88,3563.07,2835.0,1840.01,1589.09,1478.36,1601.86,2027.61,1303.56,3648.17,2442.77,649.88,683.78,5865.64,3390.0,8510.47,8381.81,7972.81,4494.35,8079.48,9351.54,10269.13,9668.22,4191.61]
                            },
                            {
                                name: 'CDMA 1X上行流量',
                                type: 'line',
                                data: [1.87,29.58,31.05,25.45,30.72,31.67,35.0,36.0,17.69,35.04,19.31,3.1,3.28,38.58,22.67,52.51,55.33,53.07,24.71,49.13,51.18,47.46,41.49,12.16]
                            },
                            {
                                name: 'CDMA 1X下行流量',
                                type: 'line',
                                data: [4.26,45.8,43.01,35.09,41.74,37.92,41.46,46.63,24.17,60.2,35.09,8.39,8.12,74.62,44.78,98.46,101.63,88.24,43.22,92.85,95.54,98.89,88.85,24.7]
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>

            </dd>
        </dl>
    </div>
    <div style="overflow: hidden">
        <div>
            <dl class="itemBox" style="float: left;width: 49%;margin-right: 2%" >
                <dt>网络总用户 Top20 基站</dt>
                <dd class="clearfix">
                    <div id="top20_user" style="height:500px"></div>
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
                        myChart.setOption(option)
                    </script>
                </dd>

            </dl>
            <dl class="itemBox" style="float: left;width: 49%;">
                <dt>网络流量占比</dt>
                <dd class="clearfix">
                    <div id="traffic_ratio" style="height:500px"></div>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById('traffic_ratio'));
                        option = {
                            title : {
                                text: '网络流量占比分析',
                                subtext: '单位：KB',
                                x:'center'
                            },
                            tooltip : {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient : 'vertical',
                                x : 0,
                                y : 150,
                                data:['EVDO','CDMA-1X','EVDO 上行流量', 'EVDO 下行流量','CDMA-1X 上行流量','CDMA-1X 下行流量']
                            },
                            toolbox: {
                                show : false,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    magicType : {
                                        show: true,
                                        type: ['pie', 'funnel']
                                    },
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : false,
                            series : [
                                {
                                    name:'流量类型',
                                    type:'pie',
                                    selectedMode: 'single',
                                    radius : [0, 70],

                                    // for funnel
                                    x: '20%',
                                    width: '40%',
                                    funnelAlign: 'right',
                                    max: 114656441760,

                                    itemStyle : {
                                        normal : {
                                            label : {
                                                position : 'inner'
                                            },
                                            labelLine : {
                                                show : false
                                            }
                                        }
                                    },
                                    data:[
                                        {value:114656441760, name:'EVDO'},
                                        {value:1931612326, name:'CDMA-1X'}
                                    ]
                                },
                                {
                                    name:'流量类型',
                                    type:'pie',
                                    radius : [100, 140],

                                    // for funnel
                                    x: '80%',
                                    width: '35%',
                                    funnelAlign: 'left',
                                    max: 97367226143,

                                    data:[
                                        {value:17289215617, name:'EVDO 上行流量'},
                                        {value:97367226143, name:'EVDO 下行流量'},
                                        {value:716908806, name:'CDMA-1X 上行流量'},
                                        {value:1214703520, name:'CDMA-1X 下行流量'}
                                    ]
                                }
                            ]
                        };
                        myChart.setOption(option);
                    </script>
                </dd>

            </dl>
        </div>
    </div>

</div>

<div class="clearfix" style="padding:15px 0;"></div>

</body>
</html>