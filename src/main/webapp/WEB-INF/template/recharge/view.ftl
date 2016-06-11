<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.view")}</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin//index">${message("admin.path.index")}</a> &raquo; ${message("admin.member.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("admin.member.base")}" />
		</li>
		[#if memberAttributes?has_content]
			<li>
				<input type="button" value="${message("admin.member.profile")}" />
			</li>
		[/#if]
	</ul>
	<table class="input tabContent">
		<tr>
			<th>
				会员姓名:
			</th>
			<td>
				${recharge.member.name}
			</td>
		</tr>
		<tr>
			<th>
				会员账户:
			</th>
			<td>
				${recharge.bankAccount.accountNum}
			</td>
		</tr>
		<tr>
			<th>
				充值日期:
			</th>
			<td>
				${recharge.createDate}
			</td>
		</tr>

		<tr>
			<th>
				充值金额:
			</th>
			<td>
				${recharge.amount}
			</td>
		</tr>

		<tr>
			<th>
				充值单号:
			</th>
			<td>
				${recharge.rechargeNumber}
			</td>
		</tr>

		<tr>
			<th>
				信息状态:
			</th>
			<td>
				[#if recharge.status=="FAIL"]
					<span class="red">${recharge.status}</span>
				[#elseif recharge.status=="SUCCESS"]
					<span class="red"> ${recharge.status} </span>
				[#else]
					<span class="green">${recharge.status}</span>
				[/#if]
			</td>
		</tr>
	</table>

	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>