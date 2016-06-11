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
				房源业主姓名:
			</th>
			<td>
				${houseInfo.username}
			</td>
		</tr>
		<tr>
			<th>
				房源业主手机:
			</th>
			<td>
				${houseInfo.mobile}
			</td>
		</tr>
		<tr>
			<th>
				创建日期:
			</th>
			<td>
				${houseInfo.createDate}
			</td>
		</tr>

		<tr>
			<th>
				地区:
			</th>
			<td>
				${houseInfo.area.fullName}
			</td>
		</tr>

		<tr>
			<th>
				地址:
			</th>
			<td>
				${houseInfo.address}
			</td>
		</tr>

		<tr>
			<th>
				小区:
			</th>
			<td>
				${houseInfo.community}
			</td>
		</tr>

		<tr>
			<th>
				面积:
			</th>
			<td>
				${houseInfo.areaSize}
			</td>
		</tr>

		<tr>
			<th>
				楼栋:
			</th>
			<td>
				${houseInfo.ban}
			</td>
		</tr>

		<tr>
			<th>
				楼层:
			</th>
			<td>
				${houseInfo.floor}
			</td>
		</tr>

		<tr>
			<th>
				房间号:
			</th>
			<td>
				${houseInfo.roomNumber}
			</td>
		</tr>
		<tr>
			<th>
				房型:
			</th>
			<td>
				${houseInfo.houseShape}
			</td>
		</tr>

		<tr>
			<th>
				价格:
			</th>
			<td>
				${houseInfo.salePrice}
			</td>
		</tr>
		<tr>
			<th>
				信息的价格:
			</th>
			<td>
				${houseInfo.infoPrice}
			</td>
		</tr>

		<tr>
			<th>
				信息状态:
			</th>
			<td>
				[#if houseInfo.status=="FAIL"]
					<span class="red">${houseInfo.status}</span>
				[#elseif houseInfo.status=="SUCCESS"]
					<span class="red"> ${houseInfo.status} </span>
				[#else]
					<span class="green">${houseInfo.status}</span>
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