<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>系统支出列表</title>


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
var win_check;
function exportExcel() {
    $("#exportbut").attr('disabled', true);
    location.href = "exportExcel" + "?beginDate=" + $("#beginDate").val() + "&endDate=" + $("#endDate").val() + "&status=" + $("#status").val();
    win_check = window.setInterval(check, 1000);
}
/**
 * 用于防止重复提交
 */
function check() {
    $.ajax({
        type: "get",
        async: false,
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
var win_check;
function exportExcel(){
    $("#exportbut").attr('disabled', true);
    location.href = "exportExcel" + "?beginDate=" + $("#beginDate").val()+"&endDate="+$("#endDate").val()+"&status="+$("#status").val()+"&cityId="+$("#cityId").val();
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
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 系统支出列表 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="list" method="get">
	
		
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
								<a href="javascript:;"[#if status== 'refund'] class="current"[/#if] val="refund">系统扣款</a>
							</li>
							<li>
								<a href="javascript:;"[#if status== 'dealExpense'] class="current"[/#if] val="dealExpense">交易支出</a>
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
        <input type="button" id="exportbut" onclick="exportExcel()" style="margin-top:-25px" value="导出"/>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">支出日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">支出金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">支出对象</a>
				</th>
				<th>
					<span>支出类型</span>
				</th>
			</tr>
			[#list pager.list as expenses]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${expenses.id}" />
					</td>
					<td>
						[#if (expenses.createDate)??]
						${(expenses.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
					</td>

					<td>
						${expenses.amount}
					</td>
					

					<td>
						${expenses.expensesTo.username}
					</td>

					<td>
                        [#if expenses.expensesType=="refund"]
                            <span class="red">系统扣款</span>
                        [#elseif expenses.expensesType=="dealExpense"]
                            <span class="red">交易支出</span>
						[#elseif expenses.expensesType=="extraAward"]
                            <span class="red">额外奖励</span>
                        [#elseif expenses.expensesType=="promoteWelfare"]
                            <span class="red">推广福利</span>
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
    <h3 class="red">总支出：${count?string("0.#")}</h3>
    <br/>
</body>
</html>