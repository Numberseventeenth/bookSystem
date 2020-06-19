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

<body data-type="chart">


	<jsp:include page="header.jsp"></jsp:include>







<div class="tpl-page-container tpl-page-header-fixed">

	<jsp:include page="aside.jsp"></jsp:include>





	<div class="tpl-content-wrapper">
		<div class="tpl-content-page-title">
			信息数据表
		</div>
		<ol class="am-breadcrumb">
			<li><a href="#" class="am-icon-home">首页</a></li>
			<li><a href="#">数据表</a></li>
<%--			<li class="am-active">Amaze UI 表单</li>--%>
		</ol>
		<div class="tpl-portlet-components">
			<div class="portlet-title">
				<div class="caption font-green bold">
					<span class="am-icon-code"></span> 图书借阅信息数量折线图
				</div>
				<div class="tpl-portlet-input tpl-fz-ml">
					<div class="portlet-input input-small input-inline">
						<div class="input-icon right">
							<i class="am-icon-search"></i>
<%--							<input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
					</div>
				</div>


			</div>
			<div class="tpl-block">
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
<%--							<div class="am-btn-group am-btn-group-xs">--%>
<%--								<button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>--%>
<%--								<button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>--%>
<%--								<button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>--%>
<%--								<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>--%>
<%--							</div>--%>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-form-group">
<%--							<select data-am-selected="{btnSize: 'sm'}">--%>
<%--								<option value="option1">所有类别</option>--%>
<%--								<option value="option2">IT业界</option>--%>
<%--								<option value="option3">数码产品</option>--%>
<%--								<option value="option3">笔记本电脑</option>--%>
<%--								<option value="option3">平板电脑</option>--%>
<%--								<option value="option3">只能手机</option>--%>
<%--								<option value="option3">超极本</option>--%>
<%--							</select>--%>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
<%--						<div class="am-input-group am-input-group-sm">--%>
<%--							<input type="text" class="am-form-field">--%>
<%--							<span class="am-input-group-btn">--%>
<%--            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>--%>
<%--          </span>--%>
<%--						</div>--%>
					</div>
				</div>


				<!--此部分数据请在 js文件夹下中的 app.js 中的 “百度图表A” 处修改数据 插件使用的是 百度echarts-->
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-A">

				</div>
<%--				<div class="portlet-title">--%>
<%--					<div class="caption font-green bold">--%>
<%--						<span class="am-icon-code"></span> 雷达图--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-B">--%>

<%--				</div>--%>

<%--				<div class="portlet-title">--%>
<%--					<div class="caption font-green bold">--%>
<%--						<span class="am-icon-code"></span> 折线柱图--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-C">--%>

<%--				</div>--%>
			</div>

		</div>










	</div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript">
	function eChartTest() {
		var echartsA = echarts.init(document.getElementById('tpl-echarts-A'));
		$.get("${pageContext.request.contextPath}/eChart/borrow.do",function (json,status) {
			// alert("收到数据");
			//获取数据
			borrowNum = json.borrowNum;  //总借阅
			borrowNum.reverse();
			todayBorrowNum = json.todayBorrowNum.reverse();   //今天借阅数量
			dateNum = json.dateNum.reverse();   //获取今日前一周的日期
			backNum = json.backNum.reverse();  //总归还数量
			todayBackNum = json.todayBackNum.reverse();  //今日归还数量
			option = {

				tooltip: {
					trigger: 'axis',
				},
				legend: {
					data: ['总借阅', '今日借阅', '总归还', '今日归还']
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
						data: todayBorrowNum,
						itemStyle: {
							normal: {
								color: '#e7505a'
							}
						}
					},
					{
						name: '总归还',
						type: 'line',
						stack: '总量',
						areaStyle: { normal: {} },
						// data: [150, 232, 201, 154, 190, 330, 410],
						data: backNum,
						itemStyle: {
							normal: {
								color: '#32c5d2'
							}
						}
					},
					{
						name: '今日归还',
						type: 'line',
						stack: '总量',
						areaStyle: { normal: {} },
						// data: [150, 232, 201, 154, 190, 330, 410],
						data: todayBackNum,
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
</script>
</body>

</html>