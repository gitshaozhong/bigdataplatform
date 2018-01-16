<%@ page language="java" pageEncoding="utf-8" contentType="text/html" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--<meta charset="UTF-8"/>--%>
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
<span id="test"></span>
<div id="search_div">
    <form id="search_form" style="padding: 10px; border: 0; background: rgba(250, 250, 250, 0);">
        <input type="text" name="table" hidden="" value="HinMetapath">
        <input type="date" style="line-height: inherit;height: 28px" name ="time" value="2016/4" />
        <input type="text" name="type" maxLength="25" id="timetype"
               placeholder="请输入搜索微博类别..."
               onkeydown="if(event.keyCode==13)search()" style="width: 160px;height: 28px"/>
        <a class="easyui-linkbutton" href="javascript:search();" style="width:100;height:28"
            id="submit" >搜索</a>
        <%--data-options="iconCls:'easyui-icon-search',width:100,height:28"--%>

    </form>
</div>

<div id="about" name="about" style="padding-top: 0px">
    <div class="container" style="margin-left: 5px;margin-right: 5px;width: 100%;">
        <div class="row white">
            <%--<div id="container" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 33%"></div>--%>
            <%--<div id="container1" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 0%"></div>--%>
            <%--<div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:60%;left: 60%"></div>--%>

            <div class="col-md-6" style="padding-right: 10%">
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">热门微博榜原理</h3>
                <p style="padding-top: 10px;font-size: 4mm;color: black;">
                   热门微博榜的核心为基于MLlib的机器学习的特征提取算法和朴素贝叶斯分类算法。词频-逆文档频率(TF-IDF)是一种用来从文本文档生成特征向量的方法，利用此方法对分词后的微博进行特征提取。朴素贝叶斯是一种多元分类算法,使用TF-IDF特征对微博进行分类,分为娱乐和科技等12个类别。以转发数，点赞数，评论数拟合出的一个权值排序实现微博排行榜。</p>
                <h3 style="margin-top: 20px;font-family:微软雅黑;font-size: 10mm;color: black;">展示说明</h3>
                <p style="padding-top: 10px;color: black;">
                   右上角有两个输入框,一个作为日期搜索(以一个月为粒度),一个作为类别搜索。输入后点击查询,页面下方会出现该月该类别下排行前10的热门微博,每条微博右边对应一个热度值,鼠标放在一条微博上,右边会动态的出现一个方框显示该微博的全部内容。
                </p>
            </div>
                <div class="box2" id="movie_rank">
                    <%--<h2>微博热度排行榜TOP10</h2>--%>
                    <h3><span id="time"></span><span id="Type"></span></h3>
                    <div class="inner">
                        <ul class="rank_list">
                            <li class="top3"><em>1</em><a href="javascript:void(0)" id="1" onmouseover="showall(this)" onmouseout="hideall()" class='con'>1111</a><span class="hot"></span></li>
                            <li class="top3"><em>2</em><a href="javascript:void(0)" id="2" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li class="top3"><em>3</em><a href="javascript:void(0)" id="3" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>4</em><a href="javascript:void(0)"  id="4" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>5</em><a href="javascript:void(0)"  id="5" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>6</em><a href="javascript:void(0)"  id="6" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>7</em><a href="javascript:void(0)"  id="7" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>8</em><a href="javascript:void(0)"  id="8" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>9</em><a href="javascript:void(0)"  id="9" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                            <li><em>10</em><a href="javascript:void(0)"  id="10" onmouseover="showall(this)" onmouseout="hideall()" class='con'></a><span class="hot"></span></li>
                        </ul>
                    </div>
                    <div id="sanjiaoxing"></div>
                    <div id="all"><img src="${ctxStatic}/css/weibo/image/1.png" style="width: 25px;height: 25px;margin:0 5px 0;z-index:2;"><div id="all1"></div></div>
                </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>

<script type="text/javascript"  charset="utf-8">

    var myChart;
    var myChart1;
    var myChart2;
    var employees;

    function search() {

        //   var ecConfig = require(['echarts']);
        $.post('/admin/sys/echarts/weibotopsearch', $("#search_form").serialize(), function (weibotop) {
            var i=0;
            var cont = document.getElementsByClassName("con");
            var hot = document.getElementsByClassName("hot");
            function show(){

                /*alert(cont[1].getBoundingClientRect().left);
                 alert(cont[1].getBoundingClientRect().top);*/
                for(i=0;i<=9;i++){
                    cont[i].innerHTML=weibotop.weiboconetsList[i].weibocontent;
                    hot[i].innerHTML=weibotop.weiboconetsList[i].weibovalue;
                }
                document.getElementById("time").innerHTML = weibotop.localtime;
                document.getElementById("Type").innerHTML = weibotop.weibocategory;

            }
             employees = [    //定义一个json数据
                { "content":"艾恩An-Upload 无组件上传类" , "hot":"621" },
                { "content":"EasySlide jQuery图片轮显" , "hot":"528" },
                { "content":"通用Ajax无刷新表彰验证类" , "hot":"232" },
                { "content":"支持中文的鼠标取词VB源码" , "hot":"174" },
                { "content":"通用Ajax无刷新表彰验证类" , "hot":"96" },
                { "content":"多样式链接提示框组件" , "hot":"85" },
                { "content":"类似lightbox的无刷新图片显示插件" , "hot":"75" },
                { "content":"通用Ajax无刷新表彰验证类" , "hot":"62" },
                { "content":"爱啦啦啦啦啦啦啦" , "hot":"20" },
                { "content":"啊啊哈哈啊哈哈哈哈哈哈" , "hot":"15" },
                { "time": {
                    "content": "2017/10/27",
                    "Type": "jj",
                }
                }
            ];//页面一加载更新排行榜
            show();
    /*var cont = document.getElementsByClassName("con");*/
    /*cont = document.getElementsByTagName("a");*/

    /*cont[1].innerText=employees[1].content;*/





        }, 'json');

    }

    function showall(s) {
        if (window.innerWidth)
            winWidth = document.body.offsetWidth;
        if (window.innerHeight)
            winHeight = window.innerHeight;

        var id = s.id;
        var this_a = document.getElementById(id);
        var content_all = this_a.innerHTML;
        var show = document.getElementById("all");
        var jiantou = document.getElementById("sanjiaoxing");
        jiantou.style.display = "block";
        show.style.display = "block";
        jiantou.style.left = (this_a.getBoundingClientRect().left/winWidth-0.10)*winWidth-10;
        jiantou.style.top = this_a.getBoundingClientRect().top-50;
        show.style.left = (this_a.getBoundingClientRect().left/winWidth-0.10)*winWidth;
        show.style.top = this_a.getBoundingClientRect().top-100;
        /*show.style.opacity="0.75";*/
        var show1 = document.getElementById("all1");
        show1.innerHTML = content_all;

    }
    function hideall() {
        var jiantou = document.getElementById("sanjiaoxing");
        jiantou.style.display = "none";
        var show = document.getElementById("all");
        show.style.display = "none";
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
        var $searchInput = $search_div.find('#timetype');
        //关闭浏览器提供给输入框的自动完成
        $searchInput.attr('autocomplete', 'off');
        //创建自动完成的下拉列表，用于显示服务器返回的数据,插入在搜索按钮的后面，等显示的时候再调整位置
        var $autocomplete = $('<div class="autocomplete" style:"position: relative"></div>').hide().insertAfter('#submit');
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
                'data': {'UserId': $searchInput.val(), 'table': "HinMetapath"}, //参数
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

