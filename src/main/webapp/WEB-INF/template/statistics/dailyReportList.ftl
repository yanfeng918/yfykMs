<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>每日房源统计</title>


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
	function getView(dom){
		var name=$(dom).val();
		if(name=="详细"){
			$(dom).val("收起");
            var time = $(dom).parent().parent().children().eq(1).html();
            dom = $(dom).parent().parent();
			time=time.trim();
            var cityId=$("#cityId").val();
            data = {"time": time,"cityId":cityId};
            var url = "${base}/statistics/getdailyReportView";
            getAjax("GET", data, url, add, true, dom);
		}else{
			$(dom).val("详细");
            $(dom).parent().parent().next().remove();
		}
	}
	function add(data,dom){
        dom.after("<tr><td colspan='6' class='green'>"+data.test+"</td></tr>");
	}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 每日数据列表 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="dailyReportList" method="get">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
			</div>
		</div>
        <div class="demos">
            <select name="cityId" id="cityId" onChange="javaScript:document.getElementById('listForm').submit()">
                <option value="">----请选择城市----</option>
			[#list cityList as city]
			${city.name}
                <option value="${city.id}" [#if cityId?? &&cityId==city.id]selected="selected"[/#if]>
				${city.name}
                </option>
			[/#list]
            </select>
        </div>
		<table id="listTable" class="list">
			<tr>
                <th width="2%">
                    <a href="javascript:;" class="sort" name="name">序号</a>
                </th>
				<th>
					<a href="javascript:;" class="sort" name="name">日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="mobile">发布数量</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">审核数量</a>
				</th>
                <th>
                    <a href="javascript:;" class="sort" name="createDate">审核成功数量</a>
                </th>
                <th>
                    <a href="javascript:;" class="sort" name="createDate">成功详细</a>
                </th>
			</tr>
			[#list data as dailyReportList]
				<tr>
					<td>
						${dailyReportList_index+1}
					</td>
                    <td>
						${dailyReportList.time}
                    </td>
                    <td>
						${dailyReportList.createNum}
                    </td>
					<td>
						${dailyReportList.checkNum}
					</td>
					<td>
						${dailyReportList.successNum}
					</td>
                    <td>
                        <input type="button" value="详细" onclick="getView(this)"/>
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
<h1 class="red">待审核数:${waitCheckCount}</h1>
<h1 class="red">电话一次不通数:${disconList1Count}</h1>
<h1 class="red">电话两次不通数:${disconList2Count}</h1>
<h1 class="red">电话多次不通数:${disconList3Count}</h1>
<h1 class="green">当月审核成功总数:${countSuccessSqlCount}</h1>
</body>
</html>