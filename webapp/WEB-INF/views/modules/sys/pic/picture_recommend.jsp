<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <!-- Bootstrap core CSS -->
    <link href="${ctxStatic}/assets/css/bootstrap.css" rel="stylesheet">


    <!-- Custom CSS -->
    <link href="${ctxStatic}/assets/css/main.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/css/animate-custom.css" rel="stylesheet">
    <%--<link href='http://fonts.useso.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet'--%>
          <%--type='text/css'>--%>
    <%--<link href='http://fonts.useso.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>--%>
    <script src="${ctxStatic}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/assets/js/modernizr.custom.js"></script>
</head>
<!-- <script type="text/javascript" src="${ctxStatic}/app/modules/sys/autoCombo.js?_=${sysInitTime}" charset="utf-8"></script> -->
<!--  <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/ad/style.css"/> -->
<style type="text/css">
    #search_div {
        text-align: right;
        position: relative;
        background: #f4f4f4;
        height: 50px;
    }

    .autocomplete {
        border: 1px solid #9ACCFB;
        background-color: white;
        text-align: left;
        z-index: 1;
    }

    .autocomplete li {
        list-style-type: none;

    }

    .clickable {
        cursor: default;
    }

    .highlight {
        background-color: #9ACCFB;
    }
</style>
<body>
<div id="search_div">
    <form id="search_form" style="padding: 10px; border: 0; background: rgba(250, 250, 250, 0);">
        <input type="text" name="table" hidden="" value="WeiboTwoDegree">
        <input type="text" name="UserId" maxLength="25" id="UserId"
               placeholder="请输入搜索的id..."
               onkeydown="if(event.keyCode==13)search()" style="width: 160px;height: 28px"/>
        <a class="easyui-linkbutton" href="#"
           data-options="iconCls:'easyui-icon-search',width:100,height:28,onClick:search" id="submit">搜索</a>

    </form>
</div>
<div id="about" name="about" style="padding-top: 0px">
    <div class="container">
        <div class="row white">
            <div class="col-md-6" style="padding-right: 10%">
                <h3 style="margin-top: 20px">基于多源多模态的图片推荐原理</h3>
                <p style="padding-top: 10px">
                    在新浪微博或Twitter等社交网络上，会向用户提供类似“可能的好友”、“你可能感兴趣的人”等好友推荐功能，二度人脉算法就为这类推荐提供了原理基础。二度人脉表示不考虑边的方向，从一个起始节点开始，以深度为二进行搜索能够到达的节点，对应到关注关系图上则表示一个缺少一边的三角形，由此类关系可以得到对潜在关注对象的推荐。</p>
                <h3 style="margin-top: 20px">展示说明</h3>
                <p style="padding-top: 10px">
                    页面的右上角为用户ID输入框，输入数字后下方出现输入提示框，输入完成后点击搜索按钮，在页面的右下方绘制出潜在用户的关系图，关系图的正中央的用户为目标用户，图片为用户的头像，与中央用户相连的为向该用户推荐的潜在好友，鼠标悬停在头像上可以显示出推荐度。由于微博用户名和头像为在线爬取，故需要服务器具有互联网访问功能。
                </p>
            </div>
            <div class="col-md-6">
                <div id="echatsPic" style="position: relative;z-index:0;/*width: 500px;height: 300px;*/left: 0px;top:0px;right:0px;bottom: 0px;background-color: white;
                            margin-top: 20px; padding-top: 10px">
                    <!-- <dl class="itemBox">
                        <dt>二度人脉图</dt>
                        <dd class="clearfix"> -->
                    <!-- 开辟空间 -->
                    <div id="2degreeTrans" style="height: 500px;width: 500px">

                        <%--<div data-options="region:'north',title:'过滤条件',collapsed:false,split:false,border:false"--%>
                        <%--style="padding: 0px; height: 70px;width:100%; overflow-y: hidden;">--%>
                        <%--</div>--%>
                        <!-- <div class="easyui-layout" fit="true" style="margin: 0px;border: 0px;overflow: hidden;width:100%;height:100%;"> -->

                        <div id="container" style="margin: 0px;border: 0px; width:100%;height:100%;"></div>


                    </div>
                </div>
            </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>
<script type="text/javascript" charset="utf-8">

    var myChart;


    function search() {
        var dom = document.getElementById("container");
        myChart = echarts.init(dom);

        //   var ecConfig = require(['echarts']);

        var app = {};
        option = null;
        myChart.showLoading();

        $.get('/admin/sys/echarts/picture_graph_data', $("#search_form").serialize(), function (graph) {

            myChart.hideLoading();
            //myChart.on("click",function (param){ alert( );});

            // var categories = [{name: '强烈推荐',symbol:'circle'}, {name: '可选推荐',symbol:'rect'}];


            var i = 0;
            graph.nodes.forEach(function (node) {
                node.itemStyle = 'normal';
                node.value = node.symbolSize;
                node.draggable = true;
                // node.categories= (node.symbolSize%2);
                node.label = {
                    normal: {
                        show: node.symbolSize > 50
                    }
                };

                node.symbol = 'image://http://10.103.238.28:8080/' + node.id + '.jpg';

                node.itemStyle.borderColor = "#abc";
                node.itemStyle.borderWidth = 5;
                node.opacity = 0;
            });


            option = {
                title: {
                    text: '基于多源多模态的图片推荐',
                    subtext: '多源多模态数据融合',
                    top: 'top',
                    left: 'left'
                },
//               visualMap: {
//        min: 0,
//        max: 70,
//        left: 'right',
//        top: 'top',
//        text: ['高','低'],           // 文本，默认为数值文本
//        orient:'horizontal',
//        handlePosition: 'right',
//
//        calculable: true
//            },
                tooltip: {},
                // legend: [{

                //     data: categories.map(function (a) {
                //         return a.name;
                //     })
                // }],
                animationDuration: 1500,
                animationEasingUpdate: 'quinticInOut',
                series: [
                    {
                        name: '推荐用户',
                        type: 'graph',
                        layout: 'force',
                        width: 'auto',
                        height: 'auto',
                        force: {

                            //initLayout: 'circular',
                            repulsion: 3000,
                            gravity: 0.8,
                            edgeLength: 200,
                            layoutAnimation: true,
                        },
                        data: graph.nodes,
                        links: graph.links,
                        // categories: categories,
                        nodeClick: ' zoomToNode',
                        roam: true,
                        label: {
                            normal: {
                                position: 'right',
                                formatter: '{b}'
                            }
                        },
                        lineStyle: {
                            normal: {
                                curveness: 0
                            }
                        }
                    }
                ]
            };

            myChart.setOption(option);
        }, 'json');
        // if (option && typeof option === "object") {
        //     var startTime = +new Date();
        //     myChart.setOption(option, true);
        //     var endTime = +new Date();
        //     var updateTime = endTime - startTime;
        //     console.log("Time used:", updateTime);
        // }

    }

    // 仅运行一次
    function once(fn, context) {
        var result;
        return function () {
            if (fn) {
                result = fn.apply(context || this, arguments);
                fn = null;
            }
            return result;
        };
    }


    $(function () {
        var firstEChart = once(search());
        firstEChart();
        //取得div层
        var $search_div = $('#search_div');
        //取得输入框JQuery对象
        var $searchInput = $search_div.find('#UserId');
        //关闭浏览器提供给输入框的自动完成
        $searchInput.attr('autocomplete', 'off');
        //创建自动完成的下拉列表，用于显示服务器返回的数据,插入在搜索按钮的后面，等显示的时候再调整位置
        var $autocomplete = $('<div class="autocomplete" style:"position: relative"></div>')
                .hide()
                .insertAfter('#submit');
        //清空下拉列表的内容并且隐藏下拉列表区
        var clear = function () {
            $autocomplete.empty().hide();
        };
        //注册事件，当输入框失去焦点的时候清空下拉列表并隐藏
        $searchInput.blur(function () {
            setTimeout(clear, 500);
        });
        //下拉列表中高亮的项目的索引，当显示下拉列表项的时候，移动鼠标或者键盘的上下键就会移动高亮的项目，想百度搜索那样
        var selectedItem = null;
        //timeout的ID
        var timeoutid = null;
        //设置下拉项的高亮背景
        var setSelectedItem = function (item) {
        //更新索引变量
            selectedItem = item;
        //按上下键是循环显示的，小于0就置成最大的值，大于最大值就置成0
            if (selectedItem < 0) {
                selectedItem = $autocomplete.find('li').length - 1;
            }
            else if (selectedItem > $autocomplete.find('li').length - 1) {
                selectedItem = 0;
            }
        //首先移除其他列表项的高亮背景，然后再高亮当前索引的背景
            $autocomplete.find('li').removeClass('highlight')
                    .eq(selectedItem).addClass('highlight');
        };
        var ajax_request = function () {
        //ajax服务端通信
            $.ajax({
                'url': '/admin/sys/echarts/nameList', //服务器的地址
                'data': {'UserId': $searchInput.val(), 'table': "WeiboTwoDegree"}, //参数
                'dataType': 'json', //返回数据类型
                'type': 'POST', //请求类型

                'success': function (data) {
                    if (data.length) {
                        //遍历data，添加到自动完成区
                        $.each(data, function (index, term) {
                            //创建li标签,添加到下拉列表中
                            $('<li></li>').text(term).appendTo($autocomplete)
                                    .addClass('clickable')
                                    .hover(function () {
                                        //下拉列表每一项的事件，鼠标移进去的操作
                                        $(this).siblings().removeClass('highlight');
                                        $(this).addClass('highlight');
                                        selectedItem = index;
                                    }, function () {
                                        //下拉列表每一项的事件，鼠标离开的操作
                                        $(this).removeClass('highlight');
                                        //当鼠标离开时索引置-1，当作标记
                                        selectedItem = -1;
                                    })
                                    .click(function () {
                                    //鼠标单击下拉列表的这一项的话x，就将这一项的值添加到输入框中
                                        $searchInput.val(term);
                                    //清空并隐藏下拉列表
                                        $autocomplete.empty().hide();
                                    });
                        });//事件注册完毕
                            //设置下拉列表的位置，然后显示下拉列表
                        var ypos = $searchInput.position().top;
                        var xpos = $searchInput.position().left;
                        $autocomplete.css('width', $searchInput.css('width'));
                        $autocomplete.css({'position': ' relative', 'left': xpos, 'top': ypos});
                        setSelectedItem(0);
                        //显示下拉列表

                        $autocomplete.show();

                    }
                }
            });
        };
                            //对输入框进行事件注册
        $searchInput
                .keyup(function (event) {
                        //字母数字，退格，空格
                    if (event.keyCode > 40 || event.keyCode == 8 || event.keyCode == 32) {
                        //首先删除下拉列表中的信息
                        $autocomplete.empty().hide();
                        clearTimeout(timeoutid);
                        timeoutid = setTimeout(ajax_request, 100);
                    }
                    else if (event.keyCode == 38) {
                    //上
                    //selectedItem = -1 代表鼠标离开
                        if (selectedItem == -1) {
                            setSelectedItem($autocomplete.find('li').length - 1);
                        }
                        else {
                    //索引减1
                            setSelectedItem(selectedItem - 1);
                        }
                        event.preventDefault();
                    }
                    else if (event.keyCode == 40) {
                    //下
                    //selectedItem = -1 代表鼠标离开
                        if (selectedItem == -1) {
                            setSelectedItem(0);
                        }
                        else {
                    //索引加1
                            setSelectedItem(selectedItem + 1);
                        }
                        event.preventDefault();
                    }
                })
                .keypress(function (event) {
                    //enter键
                    if (event.keyCode == 13) {
                        //列表为空或者鼠标离开导致当前没有索引值
                        if ($autocomplete.find('li').length == 0 || selectedItem == -1) {
                            return;
                        }
                        $searchInput.val($autocomplete.find('li').eq(selectedItem).text());
                        $autocomplete.empty().hide();
                        event.preventDefault();
                    }
                })
                .keydown(function (event) {
                    //esc键
                    if (event.keyCode == 27) {
                        $autocomplete.empty().hide();
                        event.preventDefault();
                    }
                });
        //注册窗口大小改变的事件，重新调整下拉列表的位置
        $(window).resize(function () {
            var ypos = $searchInput.position().top;
            var xpos = $searchInput.position().left;
            $autocomplete.css('width', $searchInput.css('width'));
            $autocomplete.css({'position': 'relative', 'left': xpos + "px", 'top': ypos + "px"});
        });
    });

</script>

