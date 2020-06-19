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
            图书管理系统
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
<%--            <li><a href="#">分类</a></li>--%>
<%--            <li class="am-active">内容</li>--%>
        </ol>
        <div class="tpl-content-scope">
            <div class="note note-info">
                <h3>欢笑诚可贵，交流价更高，若为安静故，二者皆可抛
                    <span class="close" data-close="note"></span>
                </h3>
                <p> 鲁迅嚼辣椒驱寒，伽利略好奇善问，闻一多醉书，华罗庚猜书，侯宝林抄书，高尔基救书，匡衡凿壁偷光，车胤囊萤映雪，孙敬悬梁刺股，范仲淹苦读的故事，马克思坚持读书和科研。</p>
                <p><span class="label label-danger">提示:</span> 本图书借阅为广大喜爱读书的用户提供了查询，借阅，续借，归还等服务。
                </p>
            </div>
        </div>

        <div class="row">
            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                <div class="dashboard-stat blue">
                    <div class="visual">
                        <i class="am-icon-comments-o"></i>
                    </div>
                    <div class="details">
                        <div class="number"> 查询 </div>
                        <div class="desc"> 新消息 </div>
                    </div>
                    <a class="more" href="${pageContext.request.contextPath}/book/findAll.do?page=1&size=20"> 查看更多
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                <div class="dashboard-stat red">
                    <div class="visual">
                        <i class="am-icon-bar-chart-o"></i>
                    </div>
                    <div class="details">
                        <div class="number"> 借阅 </div>
                        <div class="desc"> 30% </div>
                    </div>
                    <a class="more" href="${pageContext.request.contextPath}/eChart/borrowBookHotSort.do"> 查看更多
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                <div class="dashboard-stat green">
                    <div class="visual">
                        <i class="am-icon-apple"></i>
                    </div>
                    <div class="details">
                        <div class="number"> 续借 </div>
                        <div class="desc"> 20% </div>
                    </div>
                    <a class="more" href="${pageContext.request.contextPath}/user/myQueryUserAndBorrow.do"> 查看更多
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
            <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                <div class="dashboard-stat purple">
                    <div class="visual">
                        <i class="am-icon-android"></i>
                    </div>
                    <div class="details">
                        <div class="number"> 归还 </div>
                        <div class="desc"> 45% </div>
                    </div>
                    <a class="more" href="#"> 查看更多
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>



        </div>

        <div class="row">
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <i class="am-icon-cloud-download"></i>
                            <span> 我的借阅数量统计</span>
                        </div>
                        <div class="actions">
<%--                            <ul class="actions-btn">--%>
<%--                                <li class="red-on">昨天</li>--%>
<%--                                <li class="green">前天</li>--%>
<%--                                <li class="blue">本周</li>--%>
<%--                            </ul>--%>
                        </div>
                    </div>
<%--                    <span>{"backNum":[11,11,11,9,9,9,9],"todayBackNum":[0,0,2,0,0,0,1],"borrowNum":[17,17,17,12,9,9,9],"todayBorrowNum":[0,0,5,3,0,0,0],"dateNum":["03.22","03.21","03.20","03.19","03.18","03.17","03.16"]}</span>--%>
                    <!--此部分数据请在 js文件夹下中的 app.js 中的 “百度图表A” 处修改数据 插件使用的是 百度echarts-->
                    <div class="tpl-echarts" id="tpl-echarts-A">

                    </div>
                </div>
            </div>
            <div class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-red ">
                            <i class="am-icon-bar-chart"></i>
                            <span> 借阅图书次数排行</span>
                        </div>
                        <div class="actions">
<%--                            <ul class="actions-btn">--%>
<%--                                <li class="purple-on">昨天</li>--%>
<%--                                <li class="green">前天</li>--%>
<%--                                <li class="dark">本周</li>--%>
<%--                            </ul>--%>
                        </div>
                    </div>
                    <div class="tpl-scrollable">
<%--                        <div class="number-stats">--%>
<%--                            <div class="stat-number am-fl am-u-md-6">--%>
<%--                                <div class="title am-text-right"> Total </div>--%>
<%--                                <div class="number am-text-right am-text-warning"> 2460 </div>--%>
<%--                            </div>--%>
<%--                            <div class="stat-number am-fr am-u-md-6">--%>
<%--                                <div class="title"> Total </div>--%>
<%--                                <div class="number am-text-success"> 2460 </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>

                        <div id="bookSort">


                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div hidden class="am-u-md-6 am-u-sm-12 row-mb">

                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>指派任务</span>
                            <span class="caption-helper">16 件</span>
                        </div>
                        <div class="tpl-portlet-input">
                            <div class="portlet-input input-small input-inline">
                                <div class="input-icon right">
                                    <i class="am-icon-search"></i>
                                    <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                            </div>
                        </div>
                    </div>
                    <div id="wrapper" class="wrapper">
                        <div id="scroller" class="scroller">
                            <ul class="tpl-task-list">
                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> Amaze UI Icon 组件目前使用了 Font Awesome </span>
                                        <span class="label label-sm label-success">技术部</span>
                                        <span class="task-bell">
                                            <i class="am-icon-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 在 data-am-dropdown 里指定要适应到的元素，下拉内容的宽度会设置为该元素的宽度。当然可以直接在 CSS 里设置下拉内容的宽度。 </span>
                                        <span class="label label-sm label-danger">运营</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 使用 LESS： 通过设置变量 @fa-font-path 覆盖默认的值，如 @fa-font-path: "../fonts";。这个变量定义在 icon.less 里。 </span>
                                        <span class="label label-sm label-warning">市场部</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 添加 .am-btn-group-justify class 让按钮组里的按钮平均分布，填满容器宽度。 </span>
                                        <span class="label label-sm label-default">已废弃</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 按照示例组织好 HTML 结构（不加 data-am-dropdown 属性），然后通过 JS 来调用。 </span>
                                        <span class="label label-sm label-success">技术部</span>
                                        <span class="task-bell">
                                            <i class="am-icon-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>


                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 添加 .am-btn-group-justify class 让按钮组里的按钮平均分布，填满容器宽度。 </span>
                                        <span class="label label-sm label-default">已废弃</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 使用 LESS： 通过设置变量 @fa-font-path 覆盖默认的值，如 @fa-font-path: "../fonts";。这个变量定义在 icon.less 里。 </span>
                                        <span class="label label-sm label-warning">市场部</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 添加 .am-btn-group-justify class 让按钮组里的按钮平均分布，填满容器宽度。 </span>
                                        <span class="label label-sm label-default">已废弃</span>

                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="task-checkbox">
                                        <input type="hidden" value="1" name="test">
                                        <input type="checkbox" class="liChild" value="2" name="test"> </div>
                                    <div class="task-title">
                                        <span class="task-title-sp"> 按照示例组织好 HTML 结构（不加 data-am-dropdown 属性），然后通过 JS 来调用。 </span>
                                        <span class="label label-sm label-success">技术部</span>
                                        <span class="task-bell">
                                            <i class="am-icon-bell-o"></i>
                                        </span>
                                    </div>
                                    <div class="task-config">
                                        <div class="am-dropdown tpl-task-list-dropdown" data-am-dropdown>
                                            <a href="###" class="am-dropdown-toggle tpl-task-list-hover " data-am-dropdown-toggle>
                                                <i class="am-icon-cog"></i> <span class="am-icon-caret-down"></span>
                                            </a>
                                            <ul class="am-dropdown-content tpl-task-list-dropdown-ul">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-check"></i> 保存 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-pencil"></i> 编辑 </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="am-icon-trash-o"></i> 删除 </a>
                                                </li>
                                            </ul>


                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div hidden class="am-u-md-6 am-u-sm-12 row-mb">
                <div class="tpl-portlet">
                    <div class="tpl-portlet-title">
                        <div class="tpl-caption font-green ">
                            <span>项目进度</span>
                        </div>

                    </div>

                    <div class="am-tabs tpl-index-tabs" data-am-tabs>
                        <ul class="am-tabs-nav am-nav am-nav-tabs">
                            <li class="am-active"><a href="#tab1">进行中</a></li>
                            <li><a href="#tab2">已完成</a></li>
                        </ul>

                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                <div id="wrapperA" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul class="tpl-task-list tpl-task-remind">
                                            <li>
                                                <div class="cosB">
                                                    12分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                                    <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    36分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>

                                                    <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                                                </div>

                                            </li>

                                            <li>
                                                <div class="cosB">
                                                    2小时前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>

                                                    <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    1天前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-warning">
                        <i class="am-icon-plus"></i>
                      </span>

                                                    <span> 部分用户反应在过长的 Tabs 中滚动页面时会意外触发 Tab 切换事件，用户可以选择禁用触控操作。</span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    12分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                                    <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    36分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>

                                                    <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                                                </div>

                                            </li>

                                            <li>
                                                <div class="cosB">
                                                    2小时前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>

                                                    <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                                                </div>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="am-tab-panel am-fade" id="tab2">
                                <div id="wrapperB" class="wrapper">
                                    <div id="scroller" class="scroller">
                                        <ul class="tpl-task-list tpl-task-remind">
                                            <li>
                                                <div class="cosB">
                                                    12分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                                    <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    36分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>

                                                    <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                                                </div>

                                            </li>

                                            <li>
                                                <div class="cosB">
                                                    2小时前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>

                                                    <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    1天前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-warning">
                        <i class="am-icon-plus"></i>
                      </span>

                                                    <span> 部分用户反应在过长的 Tabs 中滚动页面时会意外触发 Tab 切换事件，用户可以选择禁用触控操作。</span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    12分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco">
                        <i class="am-icon-bell-o"></i>
                      </span>

                                                    <span> 注意：Chrome 和 Firefox 下， display: inline-block; 或 display: block; 的元素才会应用旋转动画。<span class="tpl-label-info"> 提取文件
                                                            <i class="am-icon-share"></i>
                                                        </span></span>
                                                </div>

                                            </li>
                                            <li>
                                                <div class="cosB">
                                                    36分钟前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-danger">
                        <i class="am-icon-bolt"></i>
                      </span>

                                                    <span> FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 .am-icon-fw 将图标设置为固定的宽度，解决宽度不一致问题（v2.3 新增）。</span>
                                                </div>

                                            </li>

                                            <li>
                                                <div class="cosB">
                                                    2小时前
                                                </div>
                                                <div class="cosA">
                                                        <span class="cosIco label-info">
                        <i class="am-icon-bullhorn"></i>
                      </span>

                                                    <span> 使用 flexbox 实现，只兼容 IE 10+ 及其他现代浏览器。</span>
                                                </div>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>



    </div>



<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript">
    function eChartTest() {
        //换成：我的借阅统计表
        var echartsA = echarts.init(document.getElementById('tpl-echarts-A'));
        $.get("${pageContext.request.contextPath}/eChart/myBorrow.do",function (json,status) {
            // alert("收到数据");
            //获取数据
            borrowNum = json.borrowNum;  //总借阅
            borrowNum.reverse();
            todayMyBorrowNum = json.todayMyBorrowNum.reverse();   //今天借阅数量
            dateNum = json.dateNum.reverse();   //获取今日前一周的日期
            option = {

                tooltip: {
                    trigger: 'axis',
                },
                legend: {
                    data: ['总借阅', '今日借阅']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    boundaryGap: true,
                    // data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                    data: dateNum
                }],

                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '总借阅',
                    type: 'line',
                    stack: '总量',
                    areaStyle: { normal: {} },
                    // data: [120, 132, 101, 134, 90, 230, 210],
                    data: borrowNum,
                    itemStyle: {
                        normal: {
                            color: '#59aea2'
                        },
                        emphasis: {

                        }
                    }
                },
                    {
                        name: '今日借阅',
                        type: 'line',
                        stack: '总量',
                        areaStyle: { normal: {} },
                        // data: [220, 182, 191, 234, 290, 330, 310],
                        data: todayMyBorrowNum,
                        itemStyle: {
                            normal: {
                                color: '#e7505a'
                            }
                        }
                    }
                ]
            };
            echartsA.setOption(option);
        });
        //借阅图书排行
    <%--<tbody id="bookHotSort">--%>
    <%--        <tr>--%>
    <%--        <td>--%>
    <%--        <img src="${pageContext.request.contextPath}/assets/img/user01.png" alt="" class="user-pic">--%>
    <%--        <a class="user-name" href="###">禁言小张</a>--%>
    <%--        </td>--%>
    <%--        <td>￥3213</td>--%>
    <%--        <td>65</td>--%>
    <%--        <td class="font-green bold">26%</td>--%>
    <%--        </tr>--%>

    <%--        </tbody>--%>

    }
    window.onload = eChartTest;

    $(function(){
        $.get("${pageContext.request.contextPath}/eChart/borrowBookHotSort.do",function(data,status){
            $("#bookSort").html(data);
        })
    })

</script>
</body>

</html>