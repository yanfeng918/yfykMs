<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>自发和批量房源统计</title>


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
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 自发和批量房源统计 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="channelList" method="get">
	
		
		<div class="bar">
			<div class="buttonWrap">
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
            <div style=" margin-left: 50%;">
                <select name="cityId" id="cityId">
                    <option value="">----请选择城市----</option>
				[#list cityList as city]
				${city.name}
                    <option value="${city.id}" [#if cityId?? &&cityId==city.id]selected="selected"[/#if]>
					${city.name}
                    </option>
				[/#list]
                </select>
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
                <th>
                    <a href="javascript:;" class="sort">序号</a>
                </th>
				<th>
					<a href="javascript:;" class="sort">日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">自发房源数</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">自发房源成功数</a>
				</th>
                <th>
                    <a href="javascript:;" class="sort">导入房源数</a>
                </th>
                <th>
                    <a href="javascript:;" class="sort">导入房源成功数</a>
                </th>
			</tr>
			[#list data as customChannel]
				<tr>
					<td width="2%">
						${customChannel_index+1}
					</td>
					<td>
						${customChannel.date}
					</td>
					<td>
						${customChannel.cusNum}
					</td>
					<td>
						${customChannel.cusSucNum}
					</td>
                    <td>
						${customChannel.chanNum}
                    </td>
                    <td>
						${customChannel.chanSucNum}
                    </td>
				</tr>
			[/#list]
		</table>
		
		[#if (data?size > 0)]
			[#include "/include/pager.ftl"]
		[#else]
			<div class="noRecord">
				没有找到任何记录!
			</div>
		[/#if]
	</form>

</body>
</html>