<%@page import="com.yfyk.common.service.RSAService"%>
<%@page import="com.yfyk.bean.Setting.AccountLockType"%>
<%@page import="com.yfyk.bean.Setting.CaptchaType"%>
<%@page import="com.yfyk.utils.SpringUtils"%>
<%@page import="com.yfyk.bean.Setting"%>
<%@page import="com.yfyk.utils.SettingUtils"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="org.springframework.context.ApplicationContext"%>

<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String base = request.getContextPath();
String captchaId = UUID.randomUUID().toString();
ApplicationContext applicationContext = SpringUtils.getApplicationContext();
Setting setting = SettingUtils.get();

if (applicationContext != null) {
%>
<shiro:authenticated>
<%
response.sendRedirect(base + "/index/test");
%>
</shiro:authenticated>
<%
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Detail Admin - Sign in</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- bootstrap -->
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap.css" rel="stylesheet" />
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
	<link href="<%=base%>/resources/detailAdmin/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

	<!-- global styles -->
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/elements.css" />
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/icons.css" />

	<!-- libraries -->
	<link rel="stylesheet" type="text/css" href="<%=base%>/resources/detailAdmin/css/lib/font-awesome.css" />

	<!-- this page specific styles -->
	<link rel="stylesheet" href="<%=base%>/resources/detailAdmin/css/compiled/signin.css" type="text/css" media="screen" />

	<!-- open sans font -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<%
if (applicationContext != null) {
	
	RSAService rsaService = SpringUtils.getBean("rsaServiceImpl", RSAService.class);
	RSAPublicKey publicKey = rsaService.generateKey(request);
	String modulus = Base64.encodeBase64String(publicKey.getModulus().toByteArray());
	String exponent = Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray());
	
	String message = null;
	String loginFailure = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	System.out.println(loginFailure);
	if (loginFailure != null) {
		if (loginFailure.equals("org.apache.shiro.authc.pam.UnsupportedTokenException")) {
			message = "admin.captcha.invalid";
		} else if (loginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
			message = "admin.login.unknownAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.DisabledAccountException")) {
			message = "admin.login.disabledAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.LockedAccountException")) {
			message = "admin.login.lockedAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
				message = "admin.login.accountLockCount";
			} else {
				message = "admin.login.incorrectCredentials";
			}
		} else if (loginFailure.equals("org.apache.shiro.authc.AuthenticationException")) {
			message = "admin.login.authentication";
		}
	}
%>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />


<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=base%>/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/jsbn.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/prng4.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rng.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rsa.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/base64.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/common.js"></script>
<script type="text/javascript">
	$().ready( function() {
		
		var $loginForm = $("#loginForm");
		var $enPassword = $("#enPassword");
		var $username = $("#username");
		var $password = $("#password");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $isRememberUsername = $("#isRememberUsername");
		
		// 记住用户名
		if(getCookie("adminUsername") != null) {
			$isRememberUsername.prop("checked", true);
			$username.val(getCookie("adminUsername"));
			$password.focus();
		} else {
			$isRememberUsername.prop("checked", false);
			$username.focus();
		}
		

		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if ($username.val() == "") {
				$.message("warn", "admin.login.usernameRequired");
				return false;
			}
			if ($password.val() == "") {
				$.message("warn", "admin.login.passwordRequired");
				return false;
			}
			if ($captcha.val() == "") {
				$.message("warn", "admin.login.captchaRequired");
				return false;
			}
			
			if ($isRememberUsername.prop("checked")) {
				addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("adminUsername");
			}
			
			var rsaKey = new RSAKey();
			rsaKey.setPublic(b64tohex("<%=modulus%>"), b64tohex("<%=exponent%>"));
			var enPassword = hex2b64(rsaKey.encrypt($password.val()));
			$enPassword.val(enPassword);
		});

	});
</script>
<%} else {%>
<title>提示信息</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />


<%--<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />--%>
<%--<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />--%>


<%}%>
</head>
<body>

	<!-- background switcher -->
	<div class="bg-switch visible-desktop">
		<div class="bgs">
			<%--<a href="#" data-img="landscape.jpg" class="bg ">--%>
				<%--<img src="<%=base%>/resources/detailAdmin/img/bgs/landscape.jpg" />--%>
			<%--</a>--%>
			<%--<a href="#" data-img="blueish.jpg" class="bg">--%>
				<%--<img src="<%=base%>/resources/detailAdmin/img/bgs/blueish.jpg" />--%>
			<%--</a>--%>
			<a href="#" data-img="7.jpg" class="bg ">
				<img src="<%=base%>/resources/detailAdmin/img/bgs/7.jpg" />
			</a>
			<a href="#" data-img="8.jpg" class="bg active">
				<img src="<%=base%>/resources/detailAdmin/img/bgs/8.jpg" />
			</a>
			<a href="#" data-img="9.jpg" class="bg">
				<img src="<%=base%>/resources/detailAdmin/img/bgs/9.jpg" />
			</a>
			<a href="#" data-img="10.jpg" class="bg">
				<img src="<%=base%>/resources/detailAdmin/img/bgs/10.jpg" />
			</a>
			<a href="#" data-img="11.jpg" class="bg">
				<img src="<%=base%>/resources/detailAdmin/img/bgs/11.jpg" />
			</a>
		</div>
	</div>


	<%if (applicationContext != null) {%>

		<div>
			<form id="loginForm" action="login.jsp" method="post">
				<input type="hidden" id="enPassword" name="enPassword" />

				<div class="row-fluid login-wrapper">
					<a href="index.html">
						<img class="logo" src="<%=base%>/resources/detailAdmin/img/logo-white.png" />
					</a>

					<div class="span4 box">
						<div class="content-wrap">
							<h6>Log in</h6>
							<input class="span12" type="text" placeholder="E-mail address"
								   id="username" name="username" maxlength="20" />

							<input class="span12" type="password" placeholder="Your password" id="password" maxlength="20"/>

							<a href="#" class="forgot">Forgot password?</a>
							<div class="remember">
								<input id="remember-me" type="checkbox" />
								<label for="remember-me">Remember me</label>
							</div>
							<%--<a class="btn-glow primary login" href="index.html">Log in</a>--%>
							<%--<input type="button" class="homeButton" value="" onclick="location.href='<%=base%>/'" />--%>
							<input class="btn-glow primary login" type="submit" class="loginButton" value="login" />



						</div>
					</div>

					<div class="span4 no-account">
						<p>Don't have an account?</p>
						<a href="signup.html">Sign up</a>
					</div>
				</div>

			</form>
		</div>



	<%} %>

	<!-- scripts -->
	<script src="<%=base%>/resources/detailAdmin/js/jquery-latest.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/bootstrap.min.js"></script>
	<script src="<%=base%>/resources/detailAdmin/js/theme.js"></script>

	<!-- pre load bg imgs -->
	<script type="text/javascript">
		$(function () {

			$("html").css("background-image", "url('<%=base%>/resources/detailAdmin/img/bgs/7.jpg')");
			// bg switcher
			var $btns = $(".bg-switch .bg");
			$btns.click(function (e) {
				e.preventDefault();
				$btns.removeClass("active");
				$(this).addClass("active");
				var bg = $(this).data("img");

				$("html").css("background-image", "url('<%=base%>/resources/detailAdmin/img/bgs/" + bg + "')");
			});

		});
	</script>


</body>
</html>