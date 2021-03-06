<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sweetalert.css">
</head>

<body data-type="generalComponents">


<jsp:include page="header.jsp"></jsp:include>







<div class="tpl-page-container tpl-page-header-fixed">
    <jsp:include page="aside.jsp"></jsp:include>





    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            新增图书
        </div>
        <ol class="am-breadcrumb">
            <li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
            <li><a href="#">图书管理</a></li>
            <li class="am-active">新增图书</li>
        </ol>
        <div class="tpl-portlet-components">
<%--            <div class="portlet-title">--%>
<%--                <div class="caption font-green bold">--%>
<%--                    <span class="am-icon-code"></span> 表单--%>
<%--                </div>--%>
<%--                <div class="tpl-portlet-input tpl-fz-ml">--%>
<%--                    <div class="portlet-input input-small input-inline">--%>
<%--                        <div class="input-icon right">--%>
<%--                            <i class="am-icon-search"></i>--%>
<%--                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--            </div>--%>
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">


                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/book/save.do"
                              method="post">
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">ISBN(必填)</label>
                                <div class="am-u-sm-9">
                                    <input name="book_isbn" id="queryValue" type="text" placeholder="ISBN(必填)">
                                    <small>ISBN(必填)</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">名称(必填)</label>
                                <div class="am-u-sm-9">
                                    <input name="book_name" type="text"  placeholder="名称(必填)">
                                    <small>名称(必填)</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">类别(必填) <span class="tpl-form-line-small-title"></span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" name="c_id">
                                        <c:forEach items="${categoryList}" var="category">
                                            <option value="${category.c_id}">${category.c_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">价格</label>
                                <div class="am-u-sm-9">
                                    <input name="book_price" type="text" placeholder="价格">
                                    <small>价格</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">出版社</label>
                                <div class="am-u-sm-9">
                                    <input name="book_public" type="text" placeholder="出版社">
                                    <small>出版社</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">作者</label>
                                <div class="am-u-sm-9">
                                    <input name="book_author" type="text" placeholder="作者">
                                    <small>作者</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">出版时间</label>
                                <div class="am-u-sm-9">
                                    <input name="book_year" type="text" placeholder="出版时间">
                                    <small>出版时间</small>
                                </div>
                            </div>
<%--                            //库存--%>
                            <div class="am-form-group">
                                <label for="user-QQ" class="am-u-sm-3 am-form-label">库存(必填)</label>
                                <div class="am-u-sm-9">
                                    <input name="book_count" type="number" pattern="[0-9]*" id="user-QQ" placeholder="库存(必填)">
                                </div>
                            </div>
<%--                            //类别--%>

<%--                            //是否上架--%>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">图书是否上架 <span class="tpl-form-line-small-title"></span></label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" name="out">
                                        <option value="1" selected="selected">上架</option>
                                        <option value="0">下架</option>
                                    </select>
                                </div>
                            </div>

<%--                            <div style="height: 200px"></div>--%>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary">保存修改</button>
                                    <button onclick="history.back(-1);" type="button" class="am-btn am-btn-primary">返回</button>
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
<script src="${pageContext.request.contextPath}/assets/js/sweetalert-dev.js"></script>
<script type="text/javascript">
    $(function() {
        $("#queryValue").keyup(function() {
            //2。 获取输入框的值
            //var word = $("#word").val();
            //this  对应就是执行这个方法的那个对象， $("#word")
            var queryValue = $(this).val();
            // alert("hahaha")

            if(queryValue == ""){
                $("#queryDiv").hide();
            }else{
                //3. 请求数据。
                $.post("http://localhost:81/xiao/book/findByIdJSON.do",{id:queryValue} ,function(data , status){
                    // alert(data);
                    if(data == 1){
                        //已存在
                        // alert("该图书已存在");
                        //可以弹出框框并消失
                        swal("图书已存在", "如若需要添加图书，请进入图书修改页面","error");
                    }
                });
            }
        })
    });
</script>
</body>

</html>