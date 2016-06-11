<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>激活房源列表</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
 <link href="${base}/resources/css/date.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/resources/css/pager.css"/>
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
 <script type="text/javascript" src="${base}/resources/js/Calendar.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
    $().ready(function() {
        $("#statusfilter").mouseover( function() {
            var $this = $(this);
            var offset = $this.offset();
            var $menuWrap = $this.closest("div.menuWrap");
            var $popupMenu = $menuWrap.children("div.popupMenu");
            $popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
            $menuWrap.mouseleave(function() {
                $popupMenu.hide();
            });
        });


        $("#filterOption a").click( function() {
            var $this = $(this);
            $("#status").val($this.attr("val"));
            $("#listForm").submit();
            return false;
        });
    });
    $().ready(function() {
        var $areaId = $("#areaId");
        // 地区选择
        $areaId.lSelect({
            url: "${base}/area/area"
        });
    });
var win_check;
function exportExcel(){
    $("#exportbut").attr('disabled', true);
    location.href = "exportExcel" + "?beginDate=" + $("#beginDate").val()+"&endDate="+$("#endDate").val()+"&areaId="+$("#areaId").val();
    win_check = window.setInterval(check, 1000);
}
/**
 * 用于防止重复提交
 */
function check() {
    $.ajax({
        type: "get",
        async:false,
        url: 'check',
        success: function (response) {
            if (response == "true") {
                //清空定时器
                window.clearInterval(win_check);
                //启用按钮
                $("#exportbut").attr('disabled', false);
            }
        }
    });
}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 房源列表 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="list" method="get">
		<div class="bar">
			<a href="add" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if pager.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if pager.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if pager.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if pager.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
				<div style=" margin-left:50%;">
                    <input type="hidden" id="areaId" name="areaId" value="${(area.id)!}"
                           treePath="${(area.treePath)!}"/>
				</div>
		</div>
        <div class="demos">
                <span>起止时间▼<input name="beginDate" type="text" id="beginDate" size="10" maxlength="10"
                                  value="${beginDate}"
                                  onClick="new Calendar().show(this);" readonly="readonly"
                                  style="border:none; width:75px;height:20px; margin:0;"/>		</span>
                <span>至▼<input name="endDate" type="text" id="endDate" size="10" maxlength="10" value="${endDate}"
                               onClick="new Calendar().show(this);" readonly="readonly"
                               style="border:none; width:75px;height:20px; margin:0;"/></span>
        </div>
        <input type="submit" style="margin-top:-25px" value="搜索">
		<input type="button" id="exportbut" onclick="exportExcel()" style="margin-top:-25px" value="导出"/>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">创建日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">地区</a>
				</th>
				<th>
					<span>小区</span>
				</th>
                <th>
                    <span>楼栋</span>
                </th>
                <th>
                    <span>房间号</span>
                </th>
                <th>
                    <span>状态</span>
                </th>
			</tr>
			[#list pager.list as houseInfo]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${houseInfo.id}" />
					</td>
					<td>
						[#if (houseInfo.createDate)??]
							${(houseInfo.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
					</td>
					<td>
						${houseInfo.houseInfo.area.fullName}
					</td>
					<td>
						${houseInfo.houseInfo.community}
					</td>
                    <td>
						${houseInfo.houseInfo.ban}
                    </td>
                    <td>
						${houseInfo.houseInfo.roomNumber}
                    </td>
					<td>
                        [#if houseInfo.houseInfo.status=="FAIL"]
                            <span class="red">失败</span>
                        [#elseif houseInfo.houseInfo.status=="SUCCESS"]
                            <span class="red"> 成功 </span>
                        [#elseif houseInfo.houseInfo.status=="APPLY"]
                            <span class="green">待审核</span>
                        [#elseif houseInfo.houseInfo.status=="CHECKING"]
                            <span class="red">审核中</span>
                        [#elseif houseInfo.houseInfo.status=="FAIL_UNAVAILABLE"]
                            <span class="red">失败-房源失效</span>
                        [#elseif houseInfo.houseInfo.status=="CHECKING_DISCON1"]
                            <span class="green">审核中-未接通1次 </span>
                        [#elseif houseInfo.houseInfo.status=="CHECKING_DISCON2"]
                            <span class="green">审核中-未接通2次</span>
                        [#elseif houseInfo.houseInfo.status=="FAIL_DISCON3"]
                            <span class="red">多次未接通</span>
                        [#elseif houseInfo.houseInfo.status=="FAIL_SOLDOUT"]
                            <span class="red">失败-已出售</span>
                        [/#if]
					</td>
				</tr>
			[/#list]
		</table>
		
		[#if (pager.list?size > 0)]
			[#include "/include/pager.ftl"]
		[#else]
			<div class="noRecord">
				没有找到任何记录!
			</div>
		[/#if]
	</form>

</body>
</html>