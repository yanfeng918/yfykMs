<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>房源列表</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="${base}/resources/css/pager.css"/>
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/js/jquery.pager.js"></script>

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
			
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "username"] class="current"[/#if] val="username">${message("Member.username")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "email"] class="current"[/#if] val="email">${message("Member.email")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
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
                    <span>举报原因</span>
                </th>
                <th>
                    <span>审核备注</span>
                </th>
                <th>
                    <span>审核状态</span>
                </th>
				[#--<th>--]
					[#--<span>${message("admin.common.handle")}</span>--]
				[#--</th>--]
			</tr>
			[#list pager.list as report]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${report.id}" />
					</td>
					<td>
						${report.houseInfo.name}
					</td>

					<td>
						[#if (report.createDate)??]
							${(report.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
					</td>
					<td>
						${report.houseInfo.area.fullName}
					</td>
					<td>
						${report.houseInfo.address}
					</td>
					<td>
						${report.houseInfo.community}
					</td>
					<td>
						${report.houseInfo.areaSize}
					</td>
					<td>
						${report.houseInfo.ban}
					</td>
					<td>
						${report.houseInfo.floor}
					</td>
					<td>
						${report.houseInfo.salePrice}
					</td>

					<td>
						${report.houseInfo.infoPrice}
					</td>
                    <td>
						${report.reportReason}
                    </td>
                    <td>
						${report.checkContent}
                    </td>
					<td>
                        [#if report.status=="FAIL"]
                            <span class="red">失败</span>
                        [#elseif report.status=="SUCCESS"]
                            <span class="red">通过</span>
                        [#elseif report.status=="APPLY"]
                            <span class="green">申请</span>
                        [#else]
                            <span class="green">审核中</span>
                        [/#if]
					</td>
					[#--<td>--]
						[#--<a href="edit?id=${report.id}">[审核]</a>--]
					[#--</td>--]
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