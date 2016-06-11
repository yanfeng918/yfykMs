<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑房源</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

})
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index">${message("admin.path.index")}</a> &raquo; 编辑房源
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${withDraw.id}" />
        <input type="hidden" name="status" id="status" value=""/>
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.member.base")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.member.point")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.member.deposit")}" />
			</li>
		</ul>


		<table class="input tabContent">
			<tr>
				<th>
					会员姓名:
				</th>
				
				<td>
					${withDraw.member.name}
				</td> 
			</tr>

			<tr>
                <th>
                    会员账户:
                </th>
				<td>
					${withDraw.member.username}
				</td>
			</tr>

			<tr>
				<th>
					${message("admin.common.createDate")}:
				</th>
				<td>
				[#if (withDraw.createDate)??]
							${(withDraw.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
				</td>
			</tr>

			
		<tr>
			<th>
				充值金额:
			</th>
			<td>
				${withDraw.amount}
			</td>
		</tr>

		<tr>
			<th>
				提现账号:
			</th>
			<td>
				${withDraw.bankAccount.accountNum}
			</td>
		</tr>
		<tr>
			<th>
				信息审核的备注:
			</th>
			<td>
				<input type="text" name="checkContent" class="text" value="${withDraw.checkContent}" maxlength="200" />
			</td>
		</tr>
		</table>


		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
                    <input type="button" class="button" value="通过" onclick="pass()"/>
                    <input type="button" class="button" value="不通过" onclick="fail()"/>
                    <input type="button" class="button" value="返回" onclick="backEdit()"/>
				</td>
			</tr>
		</table>
	</form>
    <script type="text/javascript">
        function pass() {
            $("#status").val("SUCCESS");
            document.getElementById("inputForm").submit();
        }
        function fail() {
            $("#status").val("FAIL");
            document.getElementById("inputForm").submit();
        }
        function backEdit() {
            $("#status").val("CHECKING");
            document.getElementById("inputForm").submit();
        }
    </script>
</body>
</html>