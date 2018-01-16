<%--
  Created by IntelliJ IDEA.
  User: 任贵福
  Date: 2016/7/12
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/import_map.jsp"%>

<html>
<head>
    <title>异常基站预测</title>
    <meta charset="utf-8"/>
</head>
<body>
<div class="chartArea">
    <div>
        <dl class="itemBox">
            <dt>异常基站检测图</dt>
            <dd class="clearfix">
                <div id="user_prediction" style="height:600px"></div>

                <script type='text/javascript'>

                    var bs_normal;
                    var bs_high=[
                        {
                            "bsid": "3674000D0031",
                            "traffic": 0,
                            "userWZ": -30614,
                            "lng": 117.030733,
                            "userZ": 1382,
                            "user": 7186,
                            "lat": 39.064613,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }, {
                            "bsid": "3674000D0032",
                            "traffic": 0,
                            "userWZ": -39372,
                            "lng": 117.02392,
                            "userZ": 3834,
                            "user": 9638,
                            "lat": 39.064156,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }, {
                            "bsid": "367400070080",
                            "traffic": 0,
                            "userWZ": -3497,
                            "lng": 117.411748,
                            "userZ": 3220,
                            "user": 9024,
                            "lat": 39.178454,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }, {
                            "bsid": "3674000700A2",
                            "traffic": 0,
                            "userWZ": -1859,
                            "lng": 117.399116,
                            "userZ": 12948,
                            "user": 18752,
                            "lat": 39.00303,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }, {
                            "bsid": "3674000D0191",
                            "traffic": 0,
                            "userWZ": -57593,
                            "lng": 117.217758,
                            "userZ": 5218,
                            "user": 11022,
                            "lat": 39.139765,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }, {
                            "bsid": "3674000701A0",
                            "traffic": 0,
                            "userWZ": -7469,
                            "lng": 117.07192,
                            "userZ": 5,
                            "user": 5809,
                            "lat": 39.424333,
                            "userMoranScatterQuadrant": 2,
                            "quadrant": 2
                        }
                    ];
                    var bs_low=[
                        {
                        "bsid": "367400070010",
                        "traffic": 0,
                        "userWZ": 20162,
                        "lng": 117.313585,
                        "userZ": 3115,
                        "user": 8919,
                        "lat": 38.96085,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "367400070012",
                        "traffic": 0,
                        "userWZ": 3466,
                        "lng": 117.305116,
                        "userZ": 8450,
                        "user": 14254,
                        "lat": 38.961688,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "367400070020",
                        "traffic": 0,
                        "userWZ": 35893,
                        "lng": 117.863288,
                        "userZ": 9535,
                        "user": 15339,
                        "lat": 38.945047,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "367400070021",
                        "traffic": 0,
                        "userWZ": 35893,
                        "lng": 117.861413,
                        "userZ": 9924,
                        "user": 15728,
                        "lat": 38.941025,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "367400070022",
                        "traffic": 0,
                        "userWZ": 35893,
                        "lng": 117.856829,
                        "userZ": 16434,
                        "user": 22238,
                        "lat": 38.944605,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "3674000D0030",
                        "traffic": 0,
                        "userWZ": -32541,
                        "lng": 117.029939,
                        "userZ": -1436,
                        "user": 4368,
                        "lat": 39.067047,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "367400070040",
                        "traffic": 0,
                        "userWZ": -13398,
                        "lng": 117.822913,
                        "userZ": -4036,
                        "user": 1768,
                        "lat": 39.361223,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "367400070041",
                        "traffic": 0,
                        "userWZ": -28134,
                        "lng": 117.81668,
                        "userZ": -3789,
                        "user": 2015,
                        "lat": 39.354706,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "367400070042",
                        "traffic": 0,
                        "userWZ": -1564,
                        "lng": 117.810447,
                        "userZ": -4470,
                        "user": 1334,
                        "lat": 39.361223,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "3674000D0060",
                        "traffic": 0,
                        "userWZ": -12552,
                        "lng": 117.227716,
                        "userZ": -2824,
                        "user": 2980,
                        "lat": 39.071134,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "3674000D0061",
                        "traffic": 0,
                        "userWZ": -68826,
                        "lng": 117.224217,
                        "userZ": -4618,
                        "user": 1186,
                        "lat": 39.060959,
                        "userMoranScatterQuadrant": 3,
                        "quadrant": 3
                    }, {
                        "bsid": "367400070070",
                        "traffic": 0,
                        "userWZ": 19178,
                        "lng": 117.61189,
                        "userZ": 19178,
                        "user": 24982,
                        "lat": 39.106494,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }, {
                        "bsid": "367400070072",
                        "traffic": 0,
                        "userWZ": 598,
                        "lng": 117.59533,
                        "userZ": 598,
                        "user": 6402,
                        "lat": 39.106494,
                        "userMoranScatterQuadrant": 1,
                        "quadrant": 1
                    }];
                    $.getJSON("${ctxStatic}/data/jsonOfBsNormal.json",function (data) {
                        var dom=document.getElementById("user_prediction")
                        var myChart=echarts.init(dom);
                        bs_normal = data;
                        option = {
                            backgroundColor: '#404a59',
                            title : {
                                text: '空间负相关性',
                                subtext: '天津市24小时用户接入数',
                                left: 'center',
                                top: 'top',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            tooltip: {},
                            legend: {
                                left: 'left',
                                orient: 'vertical',
                                data: ['高于正常', '正常', '低于正常'],
                                textStyle: {
                                    color: '#ccc'
                                }
                            },
                            geo: {
                                name: '高于正常',
                                type: 'scatter',
                                map: '天津',
                                roam: true,
                                label: {
                                    emphasis: {
                                        show: false
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        areaColor: '#323c48',
                                        borderColor: '#111'
                                    },
                                    emphasis: {
                                        areaColor: '#2a333d'
                                    }
                                }
                            },
                            series: [{
                                name: '低于正常',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                roam: true,
                                symbolSize: 1,
                                large: true,
                                itemStyle: {
                                    normal: {
                                        shadowBlur: 2,
                                        shadowColor: 'rgba(37, 140, 249, 0.8)',
                                        color: 'rgba(37, 140, 249, 0.8)'
                                    }
                                },
                                data: (function () {
                                    var data = [];
                                    var len = bs_low.length;
                                    while (len--) {
                                        data.push([bs_low[len].lng,bs_low[len].lat]);
                                    }
                                    return data;
                                })()
                            }, {
                                name: '正常',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                roam: true,
                                symbolSize: 1,
                                large: true,
                                itemStyle: {
                                    normal: {
                                        shadowBlur: 2,
                                        shadowColor: 'rgba(14, 241, 242, 0.8)',
                                        color: 'rgba(14, 241, 242, 0.8)'
                                    }
                                },
                                data: (function () {
                                    var data = [];
                                    var len = bs_normal.length;
                                    while (len--) {
                                        data.push([bs_normal[len].lng,bs_normal[len].lat]);
                                    }
                                    return data;
                                })()
                            }, {
                                name: '高于正常',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                roam: true,
                                symbolSize: 1,
                                large: true,
                                itemStyle: {
                                    normal: {
                                        shadowBlur: 2,
                                        shadowColor: 'rgba(255, 255, 255, 0.8)',
                                        color: 'rgba(255, 255, 255, 0.8)'
                                    }
                                },
                                data: (function () {
                                    var data = [];
                                    var len = bs_high.length;
                                    while (len--) {
                                        data.push([bs_high[len].lng,bs_high[len].lat]);
                                    }
                                    return data;
                                })()
                            }]
                        }
                        myChart.setOption(option);
                        });




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
                    var myChart =echarts.init(document.getElementById('traffic_trend'))
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
                 var myChart=echarts.init(document.getElementById('dl_trend'))
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
                 myChart.setOption(option);

                </script>
            </dd>
        </dl>
        <dl class="itemBox" style="float: left;width: 49%;">
            <dt>切换次数</dt>
            <dd>
                <div id="nwc_trend" style="height: 400px"></div>
                <script type="text/javascript">
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
                                // 基于准备好的dom，初始化echarts图表
                    myChart.setOption(option);


                </script>
            </dd>
        </dl>
    </div>
</div>
</body>
</html>
