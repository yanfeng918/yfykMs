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

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	// 地区选择
	$areaId.lSelect({
		url: "${base}/area/area"
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			
		},
		messages: {
			
		}
	})

})
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index">${message("admin.path.index")}</a> &raquo; 编辑房源
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${houseInfo.id}" />
		<input type="hidden" name="HouseInfo_SaleWay" value="${houseInfo.HouseInfo_SaleWay}" />
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
					<input type="text" name="name" class="text" value="${houseInfo.name}" maxlength="200" />
				</td>
                <th>
                    <span class="requiredField">*</span>房源业主手机:
                </th>
                <td>
                    <input type="text" name="mobile" class="text" value="${houseInfo.mobile}" maxlength="200"/>
                </td>
			</tr>


			<tr>
				<th>
					${message("admin.common.createDate")}:
				</th>
				<td>
				[#if (houseInfo.createDate)??]
						${(houseInfo.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
				</td>
                <th>
                    地区:
                </th>
                <td>
				${houseInfo.area.fullName}
                    <input type="hidden" id="areaId" name="areaId" value="${(houseInfo.area.id)!}"
                           treePath="${(houseInfo.area.treePath)!}"/>
                </td>
			</tr>

			<tr>
				<th>
					地址:
				</th>
				<td>
					<input type="text" name="address" class="text" value="${houseInfo.address}" maxlength="200" />
				</td>
                <th>
                    小区:
                </th>
                <td>
                    <input type="text" name="community" class="text" value="${houseInfo.community}" maxlength="200"/>
                </td>
			</tr>

		<tr>
			<th>
				面积:
			</th>
			<td>
				<input type="text" name="areaSize" class="text" value="${houseInfo.areaSize}" maxlength="200" />
			</td>
            <th>
                楼栋:
            </th>
            <td>
                <input type="text" name="ban" class="text" value="${houseInfo.ban}" maxlength="200"/>
            </td>
		</tr>

		<tr>
			<th>
				楼层:
			</th>
			<td>
				<input type="text" name="floor" class="text" value="${houseInfo.floor}" maxlength="200" />
			</td>
            <th>
                房间号:
            </th>
            <td>
                <input type="text" name="roomNumber" class="text" value="${houseInfo.roomNumber}" maxlength="200"/>
            </td>
		</tr>
		<tr>
			<th>
				房型:
			</th>
			<td>
				<input type="text" name="houseShape" class="text" value="${houseInfo.houseShape}" maxlength="200" />
			</td>
            <th>
                价格:
            </th>
            <td>
                <input type="text" name="salePrice" class="text" value="${houseInfo.salePrice}" maxlength="200"/>
            </td>
		</tr>

		<tr>
			<th>
				信息的价格:
			</th>
			<td>
				<input type="text" name="infoPrice" class="text" value="${houseInfo.infoPrice}" maxlength="200" />
			</td>
            <th>
                信息状态:
            </th>
            <td>
                <select name="status">
                    <option value="APPLY">申请</option>
                    <option value="CHECKING" [#if (houseInfo.status)?? &&(houseInfo.status)=="CHECKING"||(houseInfo.status)=="APPLY"]
                            selected="selected"[#else][/#if]>审核中
                    </option>
                    <option value="FAIL" [#if (houseInfo.status)?? &&(houseInfo.status)=="FAIL"]
                            selected="selected"[#else][/#if]>失败
                    </option>
                    <option value="SUCCESS" [#if (houseInfo.status)?? &&(houseInfo.status)=="SUCCESS"]
                            selected="selected"[#else][/#if]>成功
                    </option>
                </select>
            </td>
		</tr>

		<tr>
			<th>
				信息审核的备注:
			</th>
			<td>
				<input type="text" name="checkContent" class="text" value="${houseInfo.checkContent}" maxlength="200" />
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