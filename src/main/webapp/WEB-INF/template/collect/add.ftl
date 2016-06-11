<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>系统征集房源</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $areaId = $("#areaId");
	// 地区选择
	$areaId.lSelect({
		url: "${base}/area/area"
	});
    var $inputForm = $("#inputForm");
    // 表单验证
    $inputForm.validate({
        rules: {
            community: {
                required: true
            },
            collectPrice: {
                required: true
            },
            areaId: {
                required: true
            },
            ban: {
                required: true
            },
            floor: {
                required: true
            },
            roomNumber: {
                required: true
            },
            houseShape: {
                required: true
            },
            description: {
                required: true
            },
            salePrice: {
                required: true
            },
            areaSize: {
                required: true
            },
            address: {
                required: true
            }
        }
    });
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/common/index/">${message("admin.path.index")}</a> &raquo; 系统征集房源
	</div>
	<form id="inputForm" action="save" method="post">
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
					<span class="requiredField">*</span>小区:
				</th>
				<td>
					<input type="text" name="community" class="text" maxlength="20" />
				</td>
                <th>
                    <span class="requiredField">*</span>楼栋:
                </th>
                <td>
                    <input type="text"  name="ban" class="text" maxlength="20"/>
                </td>
			</tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>楼层:
                </th>
                <td>
                    <input type="text" name="floor" class="text" maxlength="20"/>
                </td>
                <th>
                    <span class="requiredField">*</span>房间号:
                </th>
                <td>
                    <input type="text" name="roomNumber" class="text" maxlength="20"/>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>户型:
                </th>
                <td>
                    <input type="text" name="houseShape" class="text" maxlength="20"/>
                </td>
                <th>
                    <span class="requiredField">*</span>面积:
                </th>
                <td>
                    <input type="text" name="areaSize" class="text" maxlength="20"/>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>描述:
                </th>
                <td>
                    <input type="text" name="description" class="text" maxlength="20"/>
                </td>
                <th>
                    <span class="requiredField">*</span>地址:
                </th>
                <td>
                    <input type="text" name="address" class="text" maxlength="20"/>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>征集价格:
                </th>
                <td>
                    <input type="text" name="collectPrice" class="text" maxlength="20"/>
                </td>
                <th>
                    <span class="requiredField">*</span>地区:
                </th>
                <td>
                    <input type="hidden" id="areaId" name="areaId"/>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>售价:
                </th>
                <td>
                    <input type="text" name="salePrice" class="text" maxlength="20"/>
                </td>
                <th>
                </th>
                <td>
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
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>