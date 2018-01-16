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
    #2degreeTrans ul li{
        display: inline-block;
        width: 33%;
        height: 90%;
    }
    #2degreeTrans ul li img{
        width: 90%;
        height: 90%;
    }

</style>
<body>
<div id="search_div">
    <form id="search_form" style="padding: 10px; border: 0; background: rgba(250, 250, 250, 0);">
        <input type="text" name="table" hidden="" value="HinMetapath">
        <input type="text" name="UserId" maxLength="100" id="UserId"
               placeholder="请输入搜索的文本..."
               onkeydown="if(event.keyCode==13)search()" style="width: 200px;height: 34px"/>
        <div class="btn-group">
            <button type="button" class="btn btn-default">搜索图片</button>

        </div>
      <%--  <a class="easyui-linkbutton" href="#" style="color: #1bd3af"
           data-options="iconCls:'easyui-icon-search',width:100,height:28,onClick:search" id="submit">搜索图片</a>--%>

    </form>
</div>
<div id="about" name="about" style="padding-top: 0px">
    <div class="container" style="margin-left: 5px;margin-right: 5px;width: 100%;">
        <div class="row white">
            <%--<div id="container" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 33%"></div>--%>
            <%--<div id="container1" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 0%"></div>--%>
            <%--<div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:60%;left: 60%"></div>--%>

            <div class="col-md-6" style="padding-right: 10%">
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">多源多模态信息网络示意图</h3>
                <img src="${ctxStatic}/assets/img/search/network.png" width="100%" height="60%">
            </div>
            <div class="col-md-6 col-lg-6">
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">跨模态检索</h3>

                <div id="echatsPic" style="position: relative;z-index:0;/*width: 500px;height: 300px;*/left: 0px;top:0px;right:0px;bottom: 0px;background-color: white;
                            margin-top: 20px; padding-top: 10px">

                    <div class="row" style="height:25% ">
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search1.jpg" width="100%" height="100%"></div>
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search2.jpg" width="100%" height="100%"></div>
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search3.jpg" width="100%" height="100%"></div>
                    </div>

                    <div class="row" style="height: 25%">
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search4.jpg" width="100%" height="100%"></div>
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search5.jpg" width="100%" height="100%"></div>
                        <div class="col-md-4"><img src="${ctxStatic}/assets/img/search/search6.jpg" width="100%" height="100%"></div>
                    </div>

                </div>
            </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>


