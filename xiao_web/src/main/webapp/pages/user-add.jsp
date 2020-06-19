<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body data-type="generalComponents">


<jsp:include page="header.jsp"></jsp:include>







<div class="tpl-page-container tpl-page-header-fixed">
    <jsp:include page="aside.jsp"></jsp:include>




    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            新增用户
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=10">用户管理</a></li>
            <li class="am-active">新增用户</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 填写表单
                </div>
<%--                <div class="tpl-portlet-input tpl-fz-ml">--%>
<%--                    <div class="portlet-input input-small input-inline">--%>
<%--                        <div class="input-icon right">--%>
<%--                            <i class="am-icon-search"></i>--%>
<%--                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--                    </div>--%>
<%--                </div>--%>


            </div>

            <div class="tpl-block">

                <div class="am-g">
                    <div class="tpl-form-body tpl-form-line">
                        <form class="am-form tpl-form-line-form" action="${pageContext.request.contextPath}/user/save.do"
                              method="post">
                            <input name="flag" value="0" hidden>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">用户名 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input id="usernameInput" name="username" type="text" class="tpl-form-input" placeholder="请输入用户名">
                                    <small id="tishi"></small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">密码 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input name="password" type="password" class="tpl-form-input" placeholder="请输入密码">
<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">邮箱 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input name="email" type="text" class="tpl-form-input"  placeholder="邮箱">
<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">联系电话 <span class="tpl-form-line-small-title">Title</span></label>
                                <div class="am-u-sm-9">
                                    <input name="phoneNum" type="text" class="tpl-form-input"  placeholder="联系电话">
<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">用户角色 <span class="tpl-form-line-small-title">Author</span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" name="roleId">
                                        <c:forEach items="${roleList}" var="role">
                                            <option value="${role.id}" selected="selected">${role.roleDesc}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">用户状态 <span class="tpl-form-line-small-title">Author</span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" name="status">
                                        <option value="0" selected="selected">关闭</option>
                                        <option value="1">开启</option>
                                    </select>
                                </div>
                            </div>



                            <div style="height: 200px"></div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                    <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="history.back(-1);">返回</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>


        </div>










    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript">
    $("#usernameInput").keyup(function () {
        var username = $(this).val();
        $.post("http://localhost:81/xiao/user/queryUsername.do",{username:username} ,function(data , status){
            // alert(data);
            if(data == 0){
                $("#tishi").html("可以使用");
            }
            if(data == 1){
                //有重复
                $("#tishi").html("该用户名已被注册");
            }
        });
        if(username == null){
            $("#tishi").html();
        }
    })
</script>
</body>

</html>