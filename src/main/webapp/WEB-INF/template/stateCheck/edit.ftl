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
            checkContent: {
                required: true
            }
        }
    });

})
</script>

</head>
<body">

	<div class="path">
		<a href="${base}/admin/index">${message("admin.path.index")}</a> &raquo; 编辑房源
	</div>
	<form id="inputForm" action="update" method="post">
		<input type="hidden" name="id" value="${houseInfo.id}" />
		
        <input type="hidden" name="status" id="status" value=""/>
        <input type="hidden" name="currentStatus" id="currentStatus" value="${houseInfo.status}"/>
        <input type="hidden" name="HouseInfo_SaleWay" value="${houseInfo.HouseInfo_SaleWay}" />
        <input type="hidden" name="stateId" id="stateId" value="${stateId}"/>
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
                    当前状态:
                </th>
                <td colspan="3">
                [#if houseInfo.status=="FAIL"]
                    <span class="red">失败</span>
                [#elseif houseInfo.status=="SUCCESS"]
                    <span class="red"> 成功 </span>
                [#elseif houseInfo.status=="APPLY"]
                    <span class="green">待审核</span>
                [#elseif houseInfo.status=="CHECKING"]
                    <span class="red">审核中</span>
                [#elseif houseInfo.status=="FAIL_UNAVAILABLE"]
                    <span class="red">失败-房源失效</span>
                [#elseif houseInfo.status=="CHECKING_DISCON1"]
                    <span class="green">审核中-未接通1次 </span>
                [#elseif houseInfo.status=="CHECKING_DISCON2"]
                    <span class="green">审核中-未接通2次</span>
                [#elseif houseInfo.status=="FAIL_DISCON3"]
                    <span class="red">未接通多次</span>
                [#elseif houseInfo.status=="FAIL_SOLDOUT"]
                    <span class="red">失败-已出售</span>
                [/#if]
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
                售价:
            </th>
            <td>
                <input type="text" name="salePrice" class="text" value="${houseInfo.salePrice}" maxlength="200"/>
            </td>
		</tr>
		<tr>
			<th>
				房源描述：
			</th>
			<td>
				<input type="text" name="description" class="text" value="${houseInfo.description}" maxlength="200" />
				<input type="hidden" name="infoPrice" class="text" value="${houseInfo.infoPrice}" maxlength="200" />
			</td>
            <th>
                信息审核的备注:
            </th>
            <td>
            [#--<input type="text" id="content" name="checkContent" class="text" value="${houseInfo.checkContent}" maxlength="200"/>--]
                <select name="checkContent" style="font-weight:900;height:30px">
                    <option value="">------请选择------</option>
                    <option value="成功"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="成功"]selected="selected"[/#if]>
                        成功
                    </option>
                    <option value="已售"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="已售"]selected="selected"[/#if]>
                        已售
                    </option>
                    <option value="不售"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="不售"]selected="selected"[/#if]>
                        不售
                    </option>
                    <option value="业主拒绝"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="业主拒绝"]selected="selected"[/#if]>
                        业主拒绝
                    </option>
                    <option value="无效号码"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="无效号码"]selected="selected"[/#if]>
                        无效号码
                    </option>
                    <option value="无效区域"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="无效区域"]selected="selected"[/#if]>
                        无效区域
                    </option>
                    <option value="重复房源"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="重复房源"]selected="selected"[/#if]>
                        重复房源
                    </option>
                    <option value="无此房源"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="无此房源"]selected="selected"[/#if]>
                        无此房源
                    </option>
                    <option value="中介"
                            [#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="中介"]selected="selected"[/#if]>
                        中介
                    </option>
                    [#--<option value="同意上门"--]
                            [#--[#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="同意上门"]selected="selected"[/#if]>--]
                        [#--同意上门--]
                    [#--</option>--]
                    [#--<option value="拒绝上门"--]
                            [#--[#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="拒绝上门"]selected="selected"[/#if]>--]
                        [#--拒绝上门--]
                    [#--</option>--]
                    [#--<option value="待定"--]
                            [#--[#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="待定"]selected="selected"[/#if]>--]
                        [#--待定--]
                    [#--</option>--]
                    [#--<option value="非战区"--]
                            [#--[#if (houseInfo.checkContent)?? &&(houseInfo.checkContent)=="非战区"]selected="selected"[/#if]>--]
                        [#--非战区--]
                    [#--</option>--]
                </select>
            </td>
        </td>
		</tr>
            <tr bgcolor="#fffbe5">
                <th>
                    <span class="requiredField">*</span>房源业主手机:
                </th>
                <td>
                    <input type="text" name="mobile" class="text" value="${houseInfo.mobile}" maxlength="200" style="font-weight:900;height:30px;color:red" />
                </td>
                <th>申诉原因:</th>
                <td>${stateReason}</td>
            </tr>
            <tr bgcolor="#fffbe5">
                <th>
                    <span class="requiredField">*</span>申述失败原因:
                </th>
                <td>
                    <input type="text" name="stateContent" class="text" value="" maxlength="200"/>
                </td>
                <th></th>
                <td></td>
            </tr>
            <tr>
                <th>
                    &nbsp;
                </th>
                <td colspan="5">
                [#if houseInfo.status=="CHECKING"]
                            <input type="image" src="../resources/admin/images/disCon1.png" id="disConnect" onclick="disConnect1()"/>
                        [#elseif houseInfo.status=="CHECKING_DISCON1"]
                            <input type="image" src="../resources/admin/images/disCon2.png" id="disConnect" onclick="disConnect1()"/>
                        [#elseif houseInfo.status=="CHECKING_DISCON2"||houseInfo.status=="FAIL_DISCON3"]
                            <input type="image" src="../resources/admin/images/fail-disCon3.png" id="disConnect" onclick="disConnect1()"/>
                [/#if]
                
                <input type="image" src="../resources/admin/images/unavailable.png" value="失败-无效房源" onclick="unAvailable()"/>
                [#--<input type="image"src="../resources/admin/images/fail-soldout.png" value="失败-已出售" onclick="soldOut()"/>--]
                [#--<input type="image" src="../resources/admin/images/back.png" value="返回" onclick="backEdit()"/>--]
                <input type="image" src="../resources/admin/images/success.png" value="通过" onclick="pass()"/>
                </td>
            </tr>
		</table>
		<table class="input">

		</table>
	</form>
    <script type="text/javascript">
    
    	function disConnect1(){
    		if(document.getElementById("currentStatus").value=="CHECKING"){
    			$("#status").val("CHECKING_DISCON1");
    		}else if(document.getElementById("currentStatus").value=="CHECKING_DISCON1"){
    			$("#status").val("CHECKING_DISCON2");
    		}else if(document.getElementById("currentStatus").value=="CHECKING_DISCON2"|| document.getElementById("currentStatus").value == "FAIL_DISCON3"){
    			$("#status").val("FAIL_DISCON3");
    		}
            $("#inputForm").submit();
        }
    	function unAvailable(){
            $("#status").val("FAIL_UNAVAILABLE");
            $("#inputForm").submit();
        }
        function pass(){
            $("#status").val("SUCCESS");
            $("#inputForm").submit();
        }
		function soldOut(){
            $("#status").val("FAIL_SOLDOUT");
            $("#inputForm").submit();
		}
		function backEdit(){
            $("#status").val("CHECKING");
            $("#inputForm").submit();
		}
    </script>
</body>
</html>