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
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">Canny边缘检测</h3>
                <p style="padding-top: 10px;font-size: 4mm;color: black;">
                    Canny边缘检测算法是John F. Canny于 1986 年开发出来的一个多级边缘检测算法。分为去噪声、寻找图像中的亮度梯度和在图像中跟踪边缘这三个步骤。去噪声：对原始数据与高斯平滑模板作卷积，得到的图像与原始图像相比有些轻微的模糊。
                    寻找图像中的亮度梯度：图像中的边缘可能会指向不同的方向，所以 Canny 算法使用 4 个 mask 检测水平、垂直以及对角线方向的边缘。原始图像与每个 mask 所作的卷积都存储起来。对于每个点我们都标识在这个点上的最大值以及生成的边缘的方向。这样就从原始图像生成了图像中每个点亮度梯度图以及亮度梯度的方向。
                    在图像中跟踪边缘：较高的亮度梯度比较有可能是边缘，但是没有一个确切的值来限定多大的亮度梯度是边缘多大，所以 Canny 使用了滞后阈值。

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
                            <img src="${ctxStatic}/assets/img/cannyedge/raw1.jpg" width="60%" height="90%">
                        </div>
                        <div id="container1" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:50%;left: 0%">
                            <img src="${ctxStatic}/assets/img/cannyedge/denoise1.png" width="60%" height="90%">
                        </div>
                        <div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:50%;left: 60%">
                            <img src="${ctxStatic}/assets/img/cannyedge/canny1.png" width="60%" height="90%">
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>


