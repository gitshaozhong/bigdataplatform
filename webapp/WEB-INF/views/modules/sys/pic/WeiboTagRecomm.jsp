<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- <script type="text/javascript" src="${ctxStatic}/app/modules/sys/autoCombo.js?_=${sysInitTime}" charset="utf-8"></script> -->
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
<style type="text/css">
    #search_div {
        text-align: right;
        position: relative;
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

<div id="search_div" style="background: #f4f4f4">
    <form id="search_form" style="padding: 10px;">

        <input type="text" name="UserId" maxLength="25" id="UserId"
               placeholder="请输入搜索的id..."
               onkeydown="if(event.keyCode==13)search()" style="width: 160px;height: 28px"/>
        <a class="easyui-linkbutton" href="#"
           data-options="iconCls:'easyui-icon-search',width:100,height:28,onClick:search" id="submit">搜索</a>

    </form>
</div>
<div id="about" name="about" style="padding-top: 0">
    <div class="container">
        <div class="row white">
            <div class="col-md-6" style="padding-right: 10%">
                <h3 style="margin-top: 20px">微博标签推荐原理</h3>
                <p style="padding-top: 10px">
                    标签推荐的核心为协同过滤推荐算法，协同过滤（Collaborative
                    Filtering）是一种被广泛用于推荐系统的推荐算法，实现目标是利用拥有共同兴趣或共同经验的群体的喜好来推荐用户所感兴趣的信息，此处向用户推荐的为标签信息。
                </p>
                <h3>展示说明</h3>
                <p style="padding-top: 10px">
                    右上角为用户ID输入框，根据提示输入完成后点击搜索按钮，在页面的右下方绘制出雷达图（Radar
                    Chart）。雷达图的五个角被标注上了向用户推荐的五个标签，阴影部分顶点的凸起程度表示了对该标签的推荐度，鼠标悬停在阴影部分显示出详细的推荐度。
                </p>
            </div>
            <div class="col-md-6">
                <div id="echatsPic" style="position: absolute;z-index:0;/*width: 500px;height: 300px;*/left: 0px;top:0px;right:0px;bottom: 0px;background-color: white;
                             margin-top: 20px; padding-top: 10px">
                    <!--  <dl class="itemBox">
                         <dt>标签推荐 </dt>
                         <dd class="clearfix"> -->
                    <!-- 开辟空间 -->
                    <div id="2degreeTrans" style="height: 500px">

                        <%--<div data-options="region:'north',title:'过滤条件',collapsed:false,split:false,border:false"--%>
                        <%--style="padding: 0px; height: 70px;width:100%; overflow-y: hidden;">--%>
                        <%--</div>--%>
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


        $.get('/admin/sys/echarts/radar_data', $("#search_form").serialize(), function (radars) {
            myChart.hideLoading();
            //myChart.on("click",function (param){ alert( );});
            var values = radars.value;


            option = {
                title: {
                    text: '标签推荐图',
                    subtext: '基于协同过滤算法',
                    top: 'top',
                    left: 'left'
                },
                tooltip: {},
                // legend: {
                //     data: ['预算分配（Allocated Budget）', '实际开销（Actual Spending）']
                // },
                radar: {
                    // shape: 'circle',
                    indicator: radars.indicators
                },
                series: [{
                    name: '您还可能具备的标签',
                    type: 'radar',
                    areaStyle: {normal: {}},
                    //data : radars.values
                    data: [{value: values, name: '标签推荐'}]
                }]
            };

            myChart.setOption(option);
        }, 'json');
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
                'data': {'UserId': $searchInput.val(), 'table': "WeiboTagRecomm1"}, //参数
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

