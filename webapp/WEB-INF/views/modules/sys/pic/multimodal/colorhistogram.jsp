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
                <h3 style="margin-top: 20px; font-family:微软雅黑;font-size: 10mm;color: black;">颜色直方图</h3>
                <p style="padding-top: 10px;font-size: 4mm;color: black;">
                    颜色直方图是在许多图像检索系统中被广泛采用的颜色特征。它所描述的是不同色彩在整幅图像中所占的比例，而并不关心每种色彩所处的空间位置，即无法描述图像中的对象或物体。       直方图中的数值都是统计而来，描述了该图像中关于颜色的数量特征，可以反映颜色直方图图像颜色的统计分布和基本色调。所以颜色直方图特别适于描述那些难以进行自动分割的图像。
                </p>
                <h3 style="margin-top: 20px;font-family:微软雅黑;font-size: 10mm;color: black;">展示说明</h3>
                <p style="padding-top: 10px;color: black;">
                    上图为原始图片，下图是从图片提取的颜色直方图。
                </p>
            </div>
            <div class="col-md-6">
                <div id="echatsPic" style="position: relative;z-index:0;/*width: 500px;height: 300px;*/left: 0px;top:0px;right:0px;bottom: 0px;background-color: white;
                            margin-top: 20px; padding-top: 10px">

                    <div id="2degreeTrans" style="height: 500px;width: 500px">

                        <div id="container" style="margin: 0px;border: 0px; width:100%;height:50%;position: absolute;top:0%;left: 0%">
                            <img src="${ctxStatic}/assets/img/colorhistogram/rawpicture1.png" width="60%" height="90%">
                        </div>
                        <div id="container1" style="margin: 0px;border: 0px; width:100%;height:50%;position: absolute;top:50%;left: 0%">
                            <img src="${ctxStatic}/assets/img/colorhistogram/rgb1.png" width="60%" height="90%">
                        </div>
                        <%--<div id="container2" style="margin: 0px;border: 0px; width:50%;height:50%;position: absolute;top:50%;left: 60%"></div>--%>

                    </div>
                </div>
            </div>
        </div>
        <!-- row -->
    </div>
</div>
</body>


