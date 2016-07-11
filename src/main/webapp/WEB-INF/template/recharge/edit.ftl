<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑</title>


[#--<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />--]
<link href="${base}/resources/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>

</head>
<body>

	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${recharge.id}" />

		<table class="table table-striped table-bordered table-hover">
			<tr style="color:red;">
				<th >
					账号:
				</th>
				<td>
					${recharge.rechargeNumber}
				</td>
			</tr>

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
					${recharge.member.username}
				</td>
			</tr>

			<tr>
				<th>
					${message("admin.common.createDate")}:
				</th>
				<td>
				[#if (recharge.createDate)??]
							${(recharge.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
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
				信息状态:
			</th>
			<td>
				<select name="status">
					<option value="APPLY">申请</option>
					<option value="CHECKING" [#if (recharge.status)?? &&(recharge.status)=="CHECKING"||(recharge.status)=="APPLY"] selected="selected"[#else][/#if]>审核中</option>
					<option value="FAIL" [#if (recharge.status)?? &&(recharge.status)=="FAIL"] selected="selected"[#else][/#if]>失败</option>
					<option value="SUCCESS" [#if (recharge.status)?? &&(recharge.status)=="SUCCESS"] selected="selected"[#else][/#if]>成功</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>
				信息审核的备注:
			</th>
			<td>
				<input type="text" name="checkContent" class="text" value="${recharge.checkContent}" maxlength="200" />
			</td>
		</tr>
		</table>


		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="btn btn-primary" value="${message("admin.common.submit")}" />
					<input type="button" class="btn btn-info" value="${message("admin.common.back")}" onclick="location.href='list'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>