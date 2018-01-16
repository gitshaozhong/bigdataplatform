<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/10
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>

<html>
<head>
    <title>基站性能分析</title>
    <meta charset="UTF-8">
</head>
<body>
<div style="padding-top: 10px;padding-left:20px;">
    <h ><b>基站性能分析中包括全天二十四小时对特定基站的基站用户统计折线统计图、流量统计柱状图、掉线次数折线图和网络切换次数折线图：</b></h>
</div>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>基站用户统计图</dt>
            <dd class="clearfix">
                <div id="user_main" style="height:550px"></div>

                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('user_main'));

                    option = {
                        title: {
                            text: 'ID：3674000DB852',
                            subtext: 'Date：2015-05-20'
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
                                name: '总用户数',
                                type: 'line',
                                data: [16, 133, 223, 185, 136, 253, 348, 571, 459, 650, 392, 94, 88, 620, 426, 760, 827, 883, 593, 775, 522, 521, 379, 68],
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
    <div>
        <dl class="itemBox">
            <dt>流量统计</dt>
            <dd class="clearfix">
                <div id="traffic_trend" style="height: 400px"></div>
                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('traffic_trend'));

                    option = {
                        title: {
                            text: 'ID：3674000DB852',
                            subtext: 'Date：2015-05-20'
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        legend: {
                            data: ['EVDO 上行流量', 'EVDO 下行流量', '1X 上行流量', '1X 下行流量']
                        },
                        toolbox: {
                            show: false,
                            feature: {
                                mark: {show: true},
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        calculable: true,
                        grid: {

                            x: 100,
                            y: 60

                        },
                        yAxis: [
                            {
                                type: 'value',
                                axisLabel: {
                                    formatter: '{value} KB'
                                }
                            }
                        ],
                        xAxis: [
                            {
                                type: 'category',
                                data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
                            }
                        ],
                        series: [
                            {
                                name: 'EVDO 上行流量',
                                type: 'bar',
                                stack: '总量',
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: false,
                                            position: 'insideRight'
                                        }
                                    }
                                },
                                data: [142598, 526506, 649705, 885715, 1274629, 1630627, 2140752, 2542934, 344271, 1689251, 983729, 336981, 432689, 3112585, 1096161, 4204013, 5164277, 3376458, 3107757, 5006514, 6217360, 6372080, 7234180, 1594767]
                            },
                            {
                                name: 'EVDO 下行流量',
                                type: 'bar',
                                stack: '总量',
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: false,
                                            position: 'insideRight'
                                        }
                                    }
                                },
                                data: [2058252, 8108091, 7307082, 5986475, 6708676, 5380411, 4261935, 4370700, 2748343, 3873581, 3941058, 1546469, 2235288, 12753158, 8597601, 31644550, 31856260, 15898113, 14941950, 20448694, 28569963, 32686944, 31524222, 14480212]
                            },
                            {
                                name: '1X 上行流量',
                                type: 'bar',
                                stack: '总量',
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: false,
                                            position: 'insideRight'
                                        }
                                    }
                                },
                                data: [0, 2210, 6975, 6576, 2722, 509, 452, 1291, 0, 14, 1, 1, 0, 1911, 997, 49, 136, 1167, 0, 314, 598, 1693, 2682, 0]
                            },
                            {
                                name: '1X 下行流量',
                                type: 'bar',
                                stack: '总量',
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: false,
                                            position: 'insideRight'
                                        }
                                    }
                                },
                                data: [0, 4830, 17555, 15861, 7143, 427, 616, 9259, 0, 28, 2, 0, 0, 7209, 10747, 106, 258, 1900, 0, 837, 1511, 7585, 12478, 0]
                            }
                        ]
                    };
                    //var data = [1, -2, 2, 5, 3, 2, 0];
                    //alert(option.series[0].data);
                    //option.series[1].data = data;

                    // 为echarts对象加载数据
                    myChart.setOption(option);

                </script>
            </dd>
        </dl>
    </div>
    <div style="overflow: hidden">
        <dl class="itemBox" style="float: left;width: 49%;margin-right: 2%">
            <dt>掉线次数</dt>
            <dd>
                <div id="dl_trend" style="height: 400px;"></div>
                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('dl_trend'));

                    option = {
                        title: {
                            text: 'ID：3674000DB852',
                            subtext: 'Date：2015-05-20'
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
                                name: '掉线次数',
                                type: 'line',
                                data: [0, 8, 5, 1, 3, 1, 0, 5, 3, 7, 3, 0, 0, 5, 4, 1, 2, 3, 1, 9, 10, 9, 5, 0],
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
        <dl class="itemBox" style="float: left;width: 49%;">
            <dt>切换次数</dt>
            <dd>
                <div id="nwc_trend" style="height: 400px"></div>
                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('nwc_trend'));

                    option = {
                        title: {
                            text: 'ID：3674000DB852',
                            subtext: 'Date：2015-05-20'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['网络切换次数']
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
                                name: '网络切换次数',
                                type: 'line',
                                data: [0, 3, 0, 1, 1, 21, 41, 57, 27, 44, 27, 3, 1, 56, 24, 71, 42, 56, 15, 22, 25, 18, 16, 4],
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
