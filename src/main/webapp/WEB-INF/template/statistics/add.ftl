<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.add")}</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/css/date.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/js/Calendar.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	// 表单验证
	$inputForm.validate({
		rules: {
            amount: {
                required: true,
                digits: true,
                min:10
            },
            createDate:{
				required:true
			}
        },
		messages: {
            amount: {
                pattern: "${message("admin.validate.illegal")}",
                remote: "${message("admin.validate.exist")}"
            }
        }
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/common/index/">${message("admin.path.index")}</a> &raquo; ${message("admin.member.add")}
	</div>
	<form id="inputForm" action="save" method="post">
        <table class="input tabContent">
            <tr>
                <th>
                    <span class="requiredField">*</span>添加金额
                </th>
                <td>
                    <input type="input" id="amount" name="amount" class="text" maxlength="20"/>
                </td>
            </tr>
			<tr>
				<th>
                    <span class="requiredField">*</span>充值时间
				</th>
				<td>
                <input name="createDate" type="input" id="createDate" class="text"
                                  onClick="new Calendar().show(this);" readonly="readonly"/>
				</td>
			</tr>
        </table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='dayReport'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>