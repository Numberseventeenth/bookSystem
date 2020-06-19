<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


	<!-- sidebar: style can be found in sidebar.less -->


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">
				列表
			</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu menu">
					<li  class="tpl-left-nav-item ">
						<a href="${pageContext.request.contextPath}/pages/main.jsp" class="nav-link active">
							<i class="am-icon-home"></i>
							<span>首页</span>
						</a>
					</li>
                    <security:authorize access="hasRole('ADMIN')">
                        <li class="tpl-left-nav-item">
                            <a href="${pageContext.request.contextPath}/pages/chart.jsp" class="nav-link tpl-left-nav-link-list">
                                <i class="am-icon-bar-chart"></i>
                                <span>数据表</span>
                                <i class="tpl-left-nav-content tpl-badge-danger">

                                </i>
                            </a>
                        </li>
						<li class="tpl-left-nav-item">
							<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
								<i class="am-icon-table"></i>
								<span>通知</span>
								<i id="count" class="tpl-left-nav-content tpl-badge-danger">

								</i>
								<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
							</a>
							<ul class="tpl-left-nav-sub-menu">
								<li>
									<a href="${pageContext.request.contextPath}/advance/advanceByFlag.do">
										<i class="am-icon-angle-right"></i>
										<span>待审核预借图书</span>
										<i id="countFlag" class="tpl-left-nav-content tpl-badge-success">

										</i>
									</a>

									<a href="${pageContext.request.contextPath}/borrow/myReNewList.do">
										<i class="am-icon-angle-right"></i>
										<span>待审核续借图书</span>
										<i id="renewStatus"  class="tpl-left-nav-content tpl-badge-success">

										</i>
									</a>
<%--									<a href="${pageContext.request.contextPath}/advance/MyadvanceList.do">--%>
<%--										<i class="am-icon-angle-right"></i>--%>
<%--										<span>消息2</span>--%>
<%--										<i class="tpl-left-nav-content tpl-badge-success">--%>

<%--										</i>--%>
<%--									</a>--%>

								</li>
							</ul>
						</li>

                    </security:authorize>

					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-table"></i>
							<span>我的</span>
							<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu">
							<li>
								<a href="${pageContext.request.contextPath}/user/queryOne.do">
									<i class="am-icon-angle-right"></i>
									<span>个人资料</span>
									<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
								</a>

								<a href="${pageContext.request.contextPath}/borrow/myBorrowList.do?flag=1">
									<i class="am-icon-angle-right"></i>
									<span>我的图书借阅记录</span>
									<i class="tpl-left-nav-content tpl-badge-success">

									</i>
								</a>
								<a href="${pageContext.request.contextPath}/advance/MyadvanceList.do">
									<i class="am-icon-angle-right"></i>
									<span>我的预借图书</span>
									<i class="tpl-left-nav-content tpl-badge-success">

									</i>
								</a>

								<a href="${pageContext.request.contextPath}/borrow/myNewList.do">
									<i class="am-icon-angle-right"></i>
									<span>我的续借图书</span>
									<i class="tpl-left-nav-content tpl-badge-primary">

									</i>
								</a>

							</li>
						</ul>
					</li>

<%--                    <li class="tpl-left-nav-item">--%>
<%--                        <a href="${pageContext.request.contextPath}/user/queryOne.do?flag=1" class="nav-link tpl-left-nav-link-list">--%>
<%--                            <i class="am-icon-key"></i>--%>
<%--                            <span>全部图书</span>--%>

<%--                        </a>--%>
<%--                    </li>--%>

					<security:authorize access="hasRole('ADMIN')">
						<li class="tpl-left-nav-item">
							<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
								<i class="am-icon-table"></i>
								<span>系统管理</span>
								<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
							</a>
							<ul class="tpl-left-nav-sub-menu">
								<li>
									<a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=10">
										<i class="am-icon-angle-right"></i>
										<span>用户管理</span>
										<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
									</a>

									<a href="${pageContext.request.contextPath}/role/findAll.do">
										<i class="am-icon-angle-right"></i>
										<span>角色管理</span>
										<i class="tpl-left-nav-content tpl-badge-success">

										</i>
									</a>

									<a href="${pageContext.request.contextPath}/permission/findAll.do">
										<i class="am-icon-angle-right"></i>
										<span>资源权限管理</span>
										<i class="tpl-left-nav-content tpl-badge-primary">

										</i>
									</a>


									<a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=30">
										<i class="am-icon-angle-right"></i>
										<span>访问日志</span>

									</a>


								</li>
							</ul>
						</li>




                    </security:authorize>
					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-wpforms"></i>
							<span>图书管理</span>
							<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu" style="display: block;">
							<li>
								<security:authorize access="hasRole('ADMIN')">
									<a href="${pageContext.request.contextPath}/book/findAllCategory.do">
										<i class="am-icon-angle-right"></i>
										<span>图书类别</span>
										<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
									</a>
									<a href="${pageContext.request.contextPath}/book/findCategory.do">
										<i class="am-icon-angle-right"></i>
										<span>图书表单购入</span>
									</a>
									<a href="${pageContext.request.contextPath}/pages/book-lead.jsp">
										<i class="am-icon-angle-right"></i>
										<span>图书导入</span>
									</a>
								</security:authorize>
								<a href="${pageContext.request.contextPath}/book/findAll.do?page=1&size=20">
									<i class="am-icon-angle-right"></i>
									<span>图书信息查询</span>
								</a>
							</li>
						</ul>
					</li>
					<security:authorize access="hasRole('ADMIN')">
						<li class="tpl-left-nav-item">
							<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
								<i class="am-icon-wpforms"></i>
								<span>借阅图书管理</span>
								<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
							</a>
							<ul class="tpl-left-nav-sub-menu" style="display: block;">
								<li>
										<a href="${pageContext.request.contextPath}/borrow/findAll.do?page=1&size=10&flag=2">
											<i class="am-icon-angle-right"></i>
											<span>借阅信息</span>
											<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
										</a>


									<a href="${pageContext.request.contextPath}/pages/borrow-page.jsp">
										<i class="am-icon-angle-right"></i>
										<span>借阅/归还图书</span>
									</a>
									<a href="${pageContext.request.contextPath}/pages/renew-page.jsp">
										<i class="am-icon-angle-right"></i>
										<span>续借</span>
									</a>
									<a href="${pageContext.request.contextPath}/pages/take-book-page.jsp">
										<i class="am-icon-angle-right"></i>
										<span>借阅取书</span>
									</a>
<%--									<a href="${pageContext.request.contextPath}/pages/description.jsp">--%>
<%--										<i class="am-icon-angle-right"></i>--%>
<%--										<span>闭馆还书</span>--%>
<%--									</a>--%>
								</li>
							</ul>
						</li>
					</security:authorize>



<%--					<li class="tpl-left-nav-item">--%>
<%--						<a href="${pageContext.request.contextPath}/pages/description.jsp" class="nav-link tpl-left-nav-link-list">--%>
<%--							<i class="am-icon-key"></i>--%>
<%--							<span>闭馆还书</span>--%>

<%--						</a>--%>
<%--					</li>--%>

					<li class="tpl-left-nav-item">
						<a href="${pageContext.request.contextPath}/user/myQueryUserAndBorrow.do" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-bar-chart"></i>
							<span>续借</span>
							<i class="tpl-left-nav-content tpl-badge-danger">

							</i>
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="${pageContext.request.contextPath}/pages/description.jsp" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-key"></i>
							<span>管理说明</span>

						</a>
					</li>

				</ul>
			</div>
		</div>
	<!-- /.sidebar -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){

		$.get("${pageContext.request.contextPath}/advance/countFlag.do",function(data,status){
			// alert("jirul");
			if(data != null){
				console.log(data.renew);
				// console.log(typeof(data));
				// console.log(data);
				if(data.renew != 0){
					$("#renewStatus").html(data.renew);
				}
				if(data.advance != 0){
					$("#countFlag").html(data.advance);
				}
				if((data.advance + data.renew) != 0){
					$("#count").html(data.advance + data.renew);
				}

			}
		});


        //子菜单点击
    //     $(".menu li a").click(function(){
    //         //获取到现在被选中的菜单，去除其选中状态
    //
    //         $(".menu li.select").removeClass("select");
    //         //将当前点击菜单设为选中状态，添加select类
    //         $(this).parent().addClass("select");
    //
    //
    //         //获取href地址，发起ajax获取指定资源
    //         // $.ajax({
    //         //     type:'get',
    //         //     url:$(this).attr('href'),
    //         //     beforeSend:function(){
    //         //         $("#right_panel").html("加载中.......")
    //         //     },
    //         //     success:function(result){
    //         //         $('#right_panel').html(result);
    //         //     }
    //         // });
    //
    //         return false;
    //     });
	});


</script>
