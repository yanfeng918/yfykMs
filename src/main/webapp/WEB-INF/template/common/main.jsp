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
			String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
		<base href="<%=base%>">
<title></title>


	<title>Detail Admin - Home</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- bootstrap -->
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap.css" rel="stylesheet" />
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

	<!-- libraries -->
	<link href="<%=base%>/resources/detailAdmin/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
	<link href="<%=base%>/resources/detailAdmin/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

	<!-- global styles -->
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/elements.css" />
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/icons.css" />

	<!-- this page specific styles -->
	<link rel="stylesheet" href="<%=base%>/resources/detailAdmin/css/compiled/index.css" type="text/css" media="screen" />

	<!-- open sans font -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

	<!-- lato font -->
	<link href='http://fonts.useso.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

</head>
<body>
	<!-- navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<a class="brand" href="index.html"><img src="<%=base%>/resources/detailAdmin/img/logo.png" /></a>

			<ul class="nav pull-right">
				<li class="hidden-phone">
					<input class="search" type="text" />
				</li>
				<li class="notification-dropdown hidden-phone">
					<a href="#" class="trigger">
						<i class="icon-warning-sign"></i>
						<span class="count">8</span>
					</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="notifications">
								<h3>You have 6 new notifications</h3>
								<a href="#" class="item">
									<i class="icon-signin"></i> New user registration
									<span class="time"><i class="icon-time"></i> 13 min.</span>
								</a>
								<a href="#" class="item">
									<i class="icon-signin"></i> New user registration
									<span class="time"><i class="icon-time"></i> 18 min.</span>
								</a>
								<a href="#" class="item">
									<i class="icon-envelope-alt"></i> New message from Alejandra
									<span class="time"><i class="icon-time"></i> 28 min.</span>
								</a>
								<a href="#" class="item">
									<i class="icon-signin"></i> New user registration
									<span class="time"><i class="icon-time"></i> 49 min.</span>
								</a>
								<a href="#" class="item">
									<i class="icon-download-alt"></i> New order placed
									<span class="time"><i class="icon-time"></i> 1 day.</span>
								</a>
								<div class="footer">
									<a href="#" class="logout">View all notifications</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<div class="copyrights">Collect from <a href="http://www.mycodes.net/" target="_blank">源码之家</a></div>
				<li class="notification-dropdown hidden-phone">
					<a href="#" class="trigger">
						<i class="icon-envelope-alt"></i>
					</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="messages">
								<a href="#" class="item">
									<img src="<%=base%>/resources/detailAdmin/img/contact-img.png" class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">
										There are many variations of available, but the majority have suffered alterations.
									</div>
									<span class="time"><i class="icon-time"></i> 13 min.</span>
								</a>
								<a href="#" class="item">
									<img src="<%=base%>/resources/detailAdmin/img/contact-img2.png" class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">
										There are many variations of available, have suffered alterations.
									</div>
									<span class="time"><i class="icon-time"></i> 26 min.</span>
								</a>
								<a href="#" class="item last">
									<img src="<%=base%>/resources/detailAdmin/img/contact-img.png" class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">
										There are many variations of available, but the majority have suffered alterations.
									</div>
									<span class="time"><i class="icon-time"></i> 48 min.</span>
								</a>
								<div class="footer">
									<a href="#" class="logout">View all messages</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
						Your account
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="personal-info.html">Personal info</a></li>
						<li><a href="#">Account settings</a></li>
						<li><a href="#">Billing</a></li>
						<li><a href="#">Export your data</a></li>
						<li><a href="#">Send feedback</a></li>
					</ul>
				</li>
				<li class="settings hidden-phone">
					<a href="personal-info.html" role="button">
						<i class="icon-cog"></i>
					</a>
				</li>
				<li class="settings hidden-phone">
					<a href="logout" role="button">
						<i class="icon-share-alt"></i>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- end navbar -->

	<!-- sidebar -->
	<div id="sidebar-nav">
		<ul id="dashboard-menu">
			<li class="active">
				<div class="pointer">
					<div class="arrow"></div>
					<div class="arrow_border"></div>
				</div>
				<a href="index/">
					<i class="icon-home"></i>
					<span>主页</span>
				</a>
			</li>

			<li>
				<a class="dropdown-toggle" href="#">
					<i class="icon-group"></i>
					<span>房源</span>
					<i class="icon-chevron-down"></i>
				</a>
				<ul class="submenu">
					<li>
						<a href="houseInfoValid/list" target="iframe">有效房源</a>
					</li>
					<li>
						<a href="houseInfoValid/uploadPage" target="iframe">有效房源导入</a>
					</li>
					<%--<li>--%>
						<%--<a href="houseInfoCheckWait/edit" target="iframe">爬虫房源</a>--%>
					<%--</li>--%>
					<li>
						<a href="houseInfoNew/list" target="iframe">最新房源</a>
					</li>
					<li>
						<a href="houseInfoNew/uploadPage" target="iframe">最新房源导入</a>
					</li>
					<li>
						<a href="houseInfoProperty/list" target="iframe">物业房源</a>
					</li>
					<li>
						<a href="houseInfoProperty/uploadPage" target="iframe">物业房源导入</a>
					</li>
				</ul>
			</li>
			<li>
				<a class="dropdown-toggle" href="#">
					<i class="icon-edit"></i>
					<span>财务管理</span>
					<i class="icon-chevron-down"></i>
				</a>
				<ul class="submenu">
					<li>
						<a href="recharge/list" target="iframe">充值管理</a>
					</li>
				</ul>
			</li>

		</ul>
	</div>
	<!-- end sidebar -->


	<!-- main container -->
	<div class="content">


		<div class="container-fluid">
			<div id="pad-wrapper">
			<iframe id="iframe" name="iframe" src="" frameborder="0" style="width: 100%;height: 880px;"></iframe>
			</div>
		</div>
	</div>


	<!-- scripts -->
	<script src="<%=base%>/resources/detailAdmin/js/jquery-latest.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/bootstrap.min.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/jquery-ui-1.10.2.custom.min.js"></script>
	<!-- knob -->
	<script src="<%=base%>/resources/detailAdmin/js/jquery.knob.js"></script>
	<!-- flot charts -->
	<script src="<%=base%>/resources/detailAdmin/js/jquery.flot.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/jquery.flot.stack.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/jquery.flot.resize.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/theme.js"></script>

	<script type="text/javascript">
		$(function () {


			// jQuery UI Sliders
			$(".slider-sample1").slider({
				value: 100,
				min: 1,
				max: 500
			});
			$(".slider-sample2").slider({
				range: "min",
				value: 130,
				min: 1,
				max: 500
			});
			$(".slider-sample3").slider({
				range: true,
				min: 0,
				max: 500,
				values: [ 40, 170 ],
			});



			// jQuery Flot Chart
			var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];
			var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];

			var plot = $.plot($("#statsChart"),
					[ { data: visits, label: "Signups"},
						{ data: visitors, label: "Visits" }], {
						series: {
							lines: { show: true,
								lineWidth: 1,
								fill: true,
								fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
							},
							points: { show: true,
								lineWidth: 2,
								radius: 3
							},
							shadowSize: 0,
							stack: true
						},
						grid: { hoverable: true,
							clickable: true,
							tickColor: "#f9f9f9",
							borderWidth: 0
						},
						legend: {
							// show: false
							labelBoxBorderColor: "#fff"
						},
						colors: ["#a7b5c5", "#30a0eb"],
						xaxis: {
							ticks: [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"],
								[7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],
							font: {
								size: 12,
								family: "Open Sans, Arial",
								variant: "small-caps",
								color: "#697695"
							}
						},
						yaxis: {
							ticks:3,
							tickDecimals: 0,
							font: {size:12, color: "#9da3a9"}
						}
					});

			function showTooltip(x, y, contents) {
				$('<div id="tooltip">' + contents + '</div>').css( {
					position: 'absolute',
					display: 'none',
					top: y - 30,
					left: x - 50,
					color: "#fff",
					padding: '2px 5px',
					'border-radius': '6px',
					'background-color': '#000',
					opacity: 0.80
				}).appendTo("body").fadeIn(200);
			}

			var previousPoint = null;
			$("#statsChart").bind("plothover", function (event, pos, item) {
				if (item) {
					if (previousPoint != item.dataIndex) {
						previousPoint = item.dataIndex;

						$("#tooltip").remove();
						var x = item.datapoint[0].toFixed(0),
								y = item.datapoint[1].toFixed(0);

						var month = item.series.xaxis.ticks[item.dataIndex].label;

						showTooltip(item.pageX, item.pageY,
								item.series.label + " of " + month + ": " + y);
					}
				}
				else {
					$("#tooltip").remove();
					previousPoint = null;
				}
			});
		});
	</script>
</body>
</html>