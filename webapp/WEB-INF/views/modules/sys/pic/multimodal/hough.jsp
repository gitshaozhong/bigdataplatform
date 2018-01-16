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

<div id="about" name="about" style="padding-top: 0px">
    <div class="container" style="margin-left: 5px;margin-right: 5px;width: 100%;">
        <div class="row white">
            <%--<div id="container" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 33%"></div>--%>
            <%--<div id="container1" style="margin: 0px;border: 0px; width:50%;height:50%;position: relative;top:0%;left: 0%"></div>--%>
            <%--<div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:60%;left: 60%"></div>--%>

            <div class="col-md-6" style="padding-right: 10%">
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">Hough Transform直线检测</h3>
                <p style="padding-top: 10px;font-size: 4mm;color: black;">
                    霍夫变换(Hough Transform)是图像处理中的一种特征提取技术，它通过一种投票算法检测具有特定形状的物体。该过程在一个参数空间中通过计算累计结果的局部最大值得到一个符合该特定形状的集合作为霍夫变换结果。
                    霍夫变换运用两个坐标空间之间的变换将在一个空间中具有相同形状的曲线或直线映射到另一个坐标空间的一个点上形成峰值，从而把检测任意形状的问题转化为统计峰值问题。
                    简单的说 Hough 变换采用的是一种证据收集的方式，遍历一幅图像上所有的直线位置，哪条直线上的特征点（证据）更多，哪条直线就更可能是我们希望找到的直线。

                </p>
                <h3 style="margin-top: 20px;font-family:微软雅黑;font-size: 10mm;color: black;">展示说明</h3>
                <p style="padding-top: 10px;color: black;">
                    上图为原始图像，左下图是去噪后的图像。右下图是边缘检测图
                </p>
            </div>
            <div class="col-md-6">
                <div id="echatsPic" style="position: relative;z-index:0;/*width: 500px;height: 300px;*/left: 0px;top:0px;right:0px;bottom: 0px;background-color: white;
                            margin-top: 20px; padding-top: 10px">

                    <div id="2degreeTrans" style="height: 500px;width: 500px">

                        <div id="container" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:0%;left: 33%">
                            <img src="${ctxStatic}/assets/img/hougth/raw1.jpg" width="60%" height="90%">
                        </div>
                        <div id="container1" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:50%;left: 0%">
                            <img src="${ctxStatic}/assets/img/hougth/denoise1.png" width="60%" height="90%">
                        </div>
                        <div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:50%;left: 60%">
                            <img src="${ctxStatic}/assets/img/hougth/hough1.png" width="60%" height="90%">
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>


