<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>房源列表</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
 <link href="${base}/resources/css/date.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/resources/css/pager.css"/>
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/js/jquery.pager.js"></script>
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
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 房源列表 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="listCollection" method="get">
	
		
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
				
				<div class="menuWrap">
					<a href="javascript:;" id="statusfilter" class="button">
						筛选条件<span class="arrow">&nbsp;</span>
					</a>
					<input type="hidden" name="status" id="status" value="${status}" />
					<div class="popupMenu">
						<ul id="filterOption">
							<li>
								<a href="javascript:;"[#if status== ''] class="current"[/#if] val="">全部</a>
							</li>
							<li>
								<a href="javascript:;"[#if status== 'APPLY'] class="current"[/#if] val="APPLY">待审核</a>
							</li>
                            <li>
                                <a href="javascript:;"[#if status== 'CHECKING_DISCON1'] class="current"[/#if] val="CHECKING_DISCON1">电话一次未通</a>
                            </li>
                            <li>
                                <a href="javascript:;"[#if status== 'CHECKING_DISCON2'] class="current"[/#if] val="CHECKING_DISCON2">电话两次未通</a>
                            </li>
							<li>
								<a href="javascript:;"[#if status== 'CHECKING'] class="current"[/#if] val="CHECKING">审核中</a>
							</li>
							<li>
								<a href="javascript:;"[#if status == 'SUCCESS'] class="current"[/#if] val="SUCCESS">审核成功</a>
							</li>
							<li>
								<a href="javascript:;"[#if status == 'FAIL'] class="current"[/#if] val="FAIL">审核失败</a>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
            <div style=" margin-left: 50%;">
                <input style="height:28px;" type="text" id="mobile" name="mobile" placeholder="电话"/>
                <input style="height:28px;" type="text" id="community" name="community" placeholder="征集小区"/>
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
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>

				<th>
					<a href="javascript:;" class="sort" name="name">房源业主姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">创建日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">地区</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">地址</a>
				</th>

				<th>
					<span>小区</span>
				</th>
				<th>
					<span>面积</span>
				</th>
				<th>
					<span>楼栋</span>
				</th>
				<th>
					<span>楼层</span>
				</th>
				<th>
					<span>价格</span>
				</th>
				<th>
					<span>信息的价格</span>
				</th>
                <th>
                    <span>审核备注</span>
                </th>
				<th>
					<span>信息状态</span>
				</th>
                <th>
                    <span>审核人</span>
                </th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list pager.list as houseInfo]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${houseInfo.id}" />
					</td>
					<td>
						${houseInfo.houseInfo.name}
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
						${houseInfo.houseInfo.address}
					</td>
					<td>
						${houseInfo.houseInfo.community}
					</td>
					<td>
						${houseInfo.houseInfo.areaSize}
					</td>
					<td>
						${houseInfo.houseInfo.ban}
					</td>
					<td>
						${houseInfo.houseInfo.floor}
					</td>
					<td>
						${houseInfo.houseInfo.salePrice}
					</td>

					<td>
						${houseInfo.houseInfo.infoPrice}
					</td>
                    <td>
						${houseInfo.houseInfo.checkContent}
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
                            <span class="red">未接通多次</span>
                        [#elseif houseInfo.houseInfo.status=="FAIL_SOLDOUT"]
                            <span class="red">失败-已出售</span>
                        [/#if]
					</td>
					<td>
						${houseInfo.houseInfo.admin.username}
					</td>
					<td>
						[#--<a href="view?id=${houseInfo.id}">[${message("admin.common.view")}]</a>--]
						<a href="editCollection?id=${houseInfo.houseInfo.id}">[审核]</a>
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