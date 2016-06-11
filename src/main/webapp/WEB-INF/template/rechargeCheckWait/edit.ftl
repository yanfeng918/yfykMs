<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑</title>


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
		<a href="${base}/index">${message("admin.path.index")}</a> &raquo; 编辑
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${recharge.id}" />
        <input type="hidden" name="status" id="status" value=""/>
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.member.base")}" />
			</li>
		</ul>


		<table class="input tabContent">
			<tr style="color:red;">
                <th>
                    微信账号:
                </th>
                <td>
                    ${recharge.rechargeNumber}
                </td>
                <th>
                    充值金额:
                </th>
                <td>
                    ${recharge.amount}
                </td>
			</tr>

			<tr>
				<th>
                    会员姓名:
                </th>
                
                <td>
                    ${recharge.member.name}
                </td>
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
                        ${(recharge.createDate)?string("yyyy-MM-dd HH:mm")}
                    [/#if]
            </td>
            <th>
                信息审核的备注:
            </th>
            <td>
                <input type="text" name="checkContent" class="text" value="${recharge.checkContent}" maxlength="200"/>
            </td>
		</tr>
		<tr>
            <th>
                &nbsp;
            </th>
            <td>
            </td>
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