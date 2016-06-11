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
		<input type="hidden" name="id" value="${report.id}" />
        <input type="hidden" name="status" id="status" value=""/>
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
					${report.houseInfo.name}
				</td>
                <th>
                    <span class="requiredField">*</span>房源业主手机:
                </th>
                <td>
				${report.houseInfo.mobile}
                </td>
			</tr>

			<tr>
				<th>
					${message("admin.common.createDate")}:
				</th>
				<td>
				[#if (report.createDate)??]
							${(report.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
				</td>
                <th>
                    地区:
                </th>
                <td>
				${report.houseInfo.area.fullName}
					[#--<input type="hidden" id="areaId" name="areaId" value="${(report.houseInfo.area.id)!}" treePath="${(report.houseInfo.area.treePath)!}" />--]
                </td>
			</tr>

			<tr>
				<th>
					地址:
				</th>
				<td>
					${report.houseInfo.address}
				</td>
                <th>
                    小区:
                </th>
                <td>
				${report.houseInfo.community}
                </td>
			</tr>

		<tr>
			<th>
				面积:
			</th>
			<td>
				${report.houseInfo.areaSize}
			</td>
            <th>
                楼栋:
            </th>
            <td>
			${report.houseInfo.ban}
            </td>
		</tr>


		<tr>
			<th>
				楼层:
			</th>
			<td>
				${report.houseInfo.floor}
			</td>
            <th>
                房间号:
            </th>
            <td>
                <input type="text" name="roomNumber" class="text" value="${report.houseInfo.roomNumber}"
                       maxlength="200"/>
            </td>
		</tr>

		<tr>
			<th>
				房型:
			</th>
			<td>
				${report.houseInfo.houseShape}
			</td>
            <th>
                价格:
            </th>
            <td>
			${report.houseInfo.salePrice}
            </td>
		</tr>

		<tr>
			<th>
				信息的价格:
			</th>
			<td>
				${report.houseInfo.infoPrice}
			</td>
            <th>
                举报原因:
            </th>
            <td>
			${report.reportReason}
            </td>
		</tr>
		<tr>
			<th>
				信息审核的备注:
			</th>
			<td>
				<input type="text" name="checkContent" class="text" value="${report.checkContent}" maxlength="200" />
			</td>
            <th>
                &nbsp;
            </th>
            <td>
                <input type="button" class="button" value="通过" onclick="pass()"/>
                <input type="button" class="button" value="不通过" onclick="fail()"/>
                <input type="button" class="button" value="返回" onclick="backEdit()"/>
                <input type="button" class="button" value="未接通待审" onclick="discon()"/>
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
        function discon() {
            $("#status").val("APPLY");
            document.getElementById("inputForm").submit();
        }
    </script>
</body>
</html>