<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>图书管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">


    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 导航侧栏 -->

    <div class="tpl-page-container tpl-page-header-fixed">
        <jsp:include page="aside.jsp"></jsp:include>












    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            图书管理系统说明
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
            <li class="am-active">图书管理系统说明</li>
        </ol>
        <div class="tpl-content-scope">
            <div class="note note-info">
                <h3>图书管理系统说明
                    <span class="close" data-close="note"></span>
                </h3>
                <p>借阅管理说明：</p>
                <p>1.用户借阅图书不限次数</p>
                <p>2.借阅周期为一个月，从借出开始一个月之后为归还时间</p>
                <p>3.在归还时间内随时都可以归还书籍</p>
                <p>4.如果闭馆会有闭馆通知，在闭馆时间内还书则转至闭馆还书界面</p>
                <p>5.续借说明：</p>
                <p>&nbsp;&nbsp;1.在归还时间提前3-5天办理续借书籍，并填写续借天数，重新确认归还时间</p>
                <p>&nbsp;&nbsp;2.如果在规定时间内没有还书，则会通过邮件提醒您，并且超过的天数按 超过的天数*书籍价钱的*5%计算费用，直到归还书为止</p>
                <p>6.丢书，损坏书籍说明：</p>
                <p>&nbsp;&nbsp;1.丢书：原价赔偿+借阅费用（借阅书籍天数*0.01*图书价格)</p>
                <p>&nbsp;&nbsp;2.损坏：根据损坏程度进行赔偿</p>
                <p>&nbsp;&nbsp;&nbsp;1.损坏1%-30%：书籍价钱*%2</p>
                <p>&nbsp;&nbsp;&nbsp;2.损坏30%-70%：书籍价钱*50%</p>
                <p>&nbsp;&nbsp;&nbsp;3.损坏70%-100%：书籍价钱*80%</p>
                <p><span class="label label-danger">提示:</span> 有任何问题可以对本馆进行留言或者给管理员发送邮件等
                </p>
            </div>
        </div>

<%--        <div class="row">--%>
<%--            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">--%>
<%--                <div class="dashboard-stat blue">--%>
<%--                    <div class="visual">--%>
<%--                        <i class="am-icon-comments-o"></i>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <div class="number"> 1349 </div>--%>
<%--                        <div class="desc"> 新消息 </div>--%>
<%--                    </div>--%>
<%--                    <a class="more" href="#"> 查看更多--%>
<%--                        <i class="m-icon-swapright m-icon-white"></i>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">--%>
<%--                <div class="dashboard-stat red">--%>
<%--                    <div class="visual">--%>
<%--                        <i class="am-icon-bar-chart-o"></i>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <div class="number"> 62% </div>--%>
<%--                        <div class="desc"> 收视率 </div>--%>
<%--                    </div>--%>
<%--                    <a class="more" href="#"> 查看更多--%>
<%--                        <i class="m-icon-swapright m-icon-white"></i>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">--%>
<%--                <div class="dashboard-stat green">--%>
<%--                    <div class="visual">--%>
<%--                        <i class="am-icon-apple"></i>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <div class="number"> 653 </div>--%>
<%--                        <div class="desc"> 苹果设备 </div>--%>
<%--                    </div>--%>
<%--                    <a class="more" href="#"> 查看更多--%>
<%--                        <i class="m-icon-swapright m-icon-white"></i>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">--%>
<%--                <div class="dashboard-stat purple">--%>
<%--                    <div class="visual">--%>
<%--                        <i class="am-icon-android"></i>--%>
<%--                    </div>--%>
<%--                    <div class="details">--%>
<%--                        <div class="number"> 786 </div>--%>
<%--                        <div class="desc"> 安卓设备 </div>--%>
<%--                    </div>--%>
<%--                    <a class="more" href="#"> 查看更多--%>
<%--                        <i class="m-icon-swapright m-icon-white"></i>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>



        </div>








    </div>



<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>