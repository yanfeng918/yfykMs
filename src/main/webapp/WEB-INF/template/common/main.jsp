<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">
<title></title>

<link href="resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="resources/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/admin/js/jquery.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
 }
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a:not(:last)");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	// 
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		$currentMenu.show();
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});

});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="./管理中心_files/管理中心.html">
					<!-- <img src="resources/admin/images/header_logo.gif"> -->
				</a>
			</th>
			<th>
			<div id="nav" class="nav">
			<%--<%--%>
        <%--out.print(SecurityUtils.getSubject().getSession().getAttribute("key"));--%>
			<%----%>
    <%--%>--%>
					<ul>
						<li>
							<a href="#product" class="">房源</a>
						</li>
						<li>
							<a href="#finance" class="">财务</a>
						</li>
						<li>
							<a href="#member" class="">会员</a>
						</li>
						<li>
							<a href="#collect" class="">征集</a>
						</li>
						<%--<li>--%>
							<%--<a href="#marketing" class="">营销</a>--%>
						<%--</li>--%>
						<li>
							<a href="#statistics" class="">统计</a>
						</li>
						<li>
							<a href="#system" class="current">系统</a>
						</li>
						<li>
							<a href="" target="_blank">首页</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<%--<a href="http://localhost:8888/shopxx/" target="_blank">官方网站</a>|--%>
					<%--<a href="http://localhost:8888/shopxx/" target="_blank">交流论坛</a>|--%>
					<%--<a href="http://localhost:8888/shopxx/" target="_blank">关于我们</a>--%>
				</div>
				<div class="link">
					<strong>[<shiro:principal/>]</strong>
					您好!
					<a href="/yjbadmin/admin/changePage" target="iframe">[密码修改]</a>
					<a href="/yjbadmin/logout" target="_top">[注销]</a>

				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				<dl id="product" class="default" style="display: none;">
					<dt>房源信息</dt>
						<dd>
							<a href="auth/houseInfo/list" target="iframe">房源管理</a>
						</dd>
                        <dd>
                            <a href="houseInfoCheckWait/edit" target="iframe">待审核房源</a>
                        </dd>
						<dd>
							<a href="houseInfoCheckWait/editDiscon" target="iframe">电话不通房源</a>
						</dd>
						<dd>
							<a href="stateCheck/edit" target="iframe">申诉房源</a>
						</dd>
						<dd>
							<a href="houseInfoCheckWait/listCollection" target="iframe">征集房源审核</a>
						</dd>
                        <dd>
                            <a href="houseInfoCheck/list" target="iframe">已审核房源</a>
                        </dd>
                        <dd>
                            <a href="auth/report/list" target="iframe">举报管理</a>
                        </dd>
                        <dd>
                            <a href="reportCheckWait/edit" target="iframe">待审核举报</a>
                        </dd>
                        <dd>
                            <a href="reportCheck/list" target="iframe">已审核举报</a>
                        </dd>
						<dd>
							<a href="auth/houseInfo/uploadPage" target="iframe">导入房源</a>
						</dd>
						<dd>
							<a href="auth/houseActive/list" target="iframe">激活房源</a>
						</dd>
						<%--<dd>--%>
							<%--<a href="product_category/list.jhtml" target="iframe">商品分类</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/parameter_group/list.jhtml" target="iframe">商品参数</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/attribute/list.jhtml" target="iframe">商品属性</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/specification/list.jhtml" target="iframe">规格管理</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/brand/list.jhtml" target="iframe">品牌管理</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/product_notify/list.jhtml" target="iframe">到货通知</a>--%>
						</dd>
				</dl>
				<dl id="finance" style="display: none;">
					<dt>财务管理</dt>
						<%--<dd>--%>
							<%--<a href="financeIndex/list" target="iframe">财务首页</a>--%>
						<%--</dd>--%>
						<dd>
							<a href="auth/recharge/list" target="iframe">充值管理</a>
						</dd>
						<dd>
							<a href="auth/rechargeCheckWait/edit" target="iframe">待审核的充值</a>
						</dd>
						<dd>
							<a href="auth/rechargeCheck/list" target="iframe">已审核的充值</a>
						</dd>
						<dd>
							<a href="auth/withDraw/list" target="iframe">取现管理</a>
						</dd>

                        <dd>
                            <a href="auth/withDrawCheckWait/edit" target="iframe">待审核的取现</a>
                        </dd>

                        <dd>
                            <a href="auth/withDrawCheck/list" target="iframe">已审核的取现</a>
                        </dd>
                        <dd>
                            <a href="auth/incomeFrom/list" target="iframe">系统收入查询</a>
                        </dd>
                        <dd>
                            <a href="auth/expensesFrom/list" target="iframe">系统支出查询</a>
                        </dd>
						<dd>
							<a href="auth/extraAward/list" target="iframe">本月额外奖励</a>
						</dd>
						<dd>
							<a href="auth/extraAward/provideList" target="iframe">上月奖励确认</a>
						</dd>
						<dd>
							<a href="auth/extraAward/historyList" target="iframe">额外奖励历史</a>
						</dd>
                        <%--<dd>--%>
                            <%--<a href="auth/pettyCash/list" target="iframe">备用金管理</a>--%>
                        <%--</dd>--%>

				</dl>
				<dl id="member" style="display: none;">
					<dt>会员管理</dt>
						<dd>
							<a href="auth/member/list" target="iframe">会员管理</a>
						</dd>
						<dd>
							<a href="auth/admin/list" target="iframe">操作员管理</a>
						</dd>
				</dl>
				<dl id="collect" style="display: none;">
					<dt>征集管理</dt>
						<dd>
							<a href="collect/list" target="iframe">征集管理</a>
						</dd>
						<dd>
							<a href="http://localhost:8888/shopxx/admin/article/list.jhtml" target="iframe">文章管理</a>
						</dd>
				</dl>
				<dl id="marketing" style="display: none;">
					<dt>营销管理</dt>
						<dd>
							<a href="" target="iframe">促销管理</a>
						</dd>
						<dd>
							<a href="http://localhost:8888/shopxx/admin/coupon/list.jhtml" target="iframe">优惠券管理</a>
						</dd>
						<dd>
							<a href="http://localhost:8888/shopxx/admin/seo/list.jhtml" target="iframe">SEO设置</a>
						</dd>
						<dd>
							<a href="http://localhost:8888/shopxx/admin/sitemap/build.jhtml" target="iframe">Sitemap管理</a>
						</dd>
				</dl>
				<dl id="statistics" style="display: none;">
					<dt>统计报表</dt>
					<dd>
						<a href="member/statistics/list" target="iframe">我的审核统计</a>
					</dd>
					<dd>
						<a href="auth/statistics/dayReport" target="iframe">备用金管理</a>
					</dd>
					<dd>
						<a href="statistics/dailyReportList" target="iframe">每日房源统计</a>
					</dd>
					<dd>
						<a href="statistics/checkStatistics" target="iframe">审核人工作统计</a>
					</dd>
					<dd>
						<a href="auth/statistics/promoterStatistics" target="iframe">员工邀请统计</a>
					</dd>
					<dd>
						<a href="auth/statistics/channelList" target="iframe">自发和批量房源统计</a>
					</dd>
					<dd>
						<a href="auth/statistics/incomeRankingList" target="iframe">用户收入排行榜</a>
					</dd>
					<dd>
						<a href="auth/statistics/exportReport" target="iframe">导出报表</a>
					</dd>
					<%--<dd>--%>
						<%--<a href="auth/statistics/dayReport" target="iframe">审核统计</a>--%>
					<%--</dd>--%>
					<%--<dd>--%>
						<%--<a href="auth/statistics/dayReport" target="iframe">审核人统计</a>--%>
					<%--</dd>--%>
				</dl>
				<dl id="system" style="display: block;">
					<dt>系统设置</dt>
						<%--<dd>--%>
							<%--<a href="setting/edit.jhtml" target="iframe">系统设置</a>--%>
						<%--</dd>--%>
						<dd>
							<a href="auth/area/list" target="iframe">地区管理</a>
						</dd>
						<%--<dd>--%>
							<%--<a href="payment_method/list.jhtml" target="iframe">支付方式</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="shipping_method/list.jhtml" target="iframe">配送方式</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="delivery_corp/list.jhtml" target="iframe">物流公司</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/payment_plugin/list.jhtml" target="iframe">支付插件</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/storage_plugin/list.jhtml" target="iframe">存储插件</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/admin/list.jhtml" target="iframe">管理员</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/role/list.jhtml" target="iframe">角色管理</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/message/send.jhtml" target="iframe">发送消息</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/message/list.jhtml" target="iframe">消息列表</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/message/draft.jhtml" target="iframe">草稿箱</a>--%>
						<%--</dd>--%>
						<%--<dd>--%>
							<%--<a href="http://localhost:8888/shopxx/admin/log/list.jhtml" target="iframe">日志管理</a>--%>
						<%--</dd>--%>
				</dl>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="" frameborder="0"></iframe>
			</td>
		</tr>

	</table>
</body>
</html>