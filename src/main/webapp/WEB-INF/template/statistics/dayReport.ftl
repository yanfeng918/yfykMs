<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>备用金报表</title>


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
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 备用金统计 <span>(${message("admin.page.total", pager.totalCount)})</span>
	</div>
	<form id="listForm" action="dayReport" method="get">
	
		
		<div class="bar">
			<a href="add" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="statusfilter" class="button">
						筛选条件<span class="arrow">&nbsp;</span>
					</a>
					<input type="hidden" name="status" id="status" value="${status}" />
					<div class="popupMenu">
						<ul id="filterOption">
							<li>
								<a href="javascript:;"[#if status== 'recharge'] class="current"[/#if] val="recharge">充值记录</a>
							</li>
							<li>
								<a href="javascript:;"[#if status == 'withdraw'] class="current"[/#if] val="withdraw">提现记录</a>
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
				[#if type=='withDraw']
                    <a href="javascript:;" class="sort" name="">提现记录</a>
				[#else]
                    <a href="javascript:;" class="sort" name="">充值记录</a>
				[/#if]
                </th>
				<th>
					<a href="javascript:;" class="sort" name="mobile">会员账户</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">交易日期</a>
				</th>
                <th>
                    <a href="javascript:;" class="sort" name="name">会员姓名</a>
                </th>
			</tr>
		[#list pager.list as recharge]
            <tr>
                <td>
                    <input type="checkbox" name="ids" value="${recharge.id}"/>
                </td>
                <td class="red">
					[#if type=='withDraw']
                        -
					[#else]
                        +
					[/#if]
				${recharge.amount}
                </td>
                <td>
				${recharge.member.username}
                </td>
                <td>
					[#if (recharge.createDate)??]
							${(recharge.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
                </td>
                <td>
				${recharge.member.name}
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
	</br>

    <h3 class="red">用户充值：${recharge?string("0.#")}</h3>
    </br>
    <h3 class="red">总提现：${withDraw?string("0.#")}</h3>
    </br>
    <h3 class="red">用户余额：${memberBalanceCount?string("0.#")}</h3>
    </br>
    <h3 class="red">系统余额：${sysBalanceCount?string("0.#")}</h3>
    </br>
    <h3 class="red">备用金充值：${pettyCashCount?string("0.#")}</h3>
    <br/>
    <h3 class="red">系统支出：${sysExpensesCount?string("0.#")}</h3>
    </br>
	<h3 class="red">公司欠备用金：${companyExpensesCount?string("0.#")}</h3>
    </br>
    <h3 class="red">平台余额(手机)：${systemBalance?string("0.#")}</h3>
    </br>
</body>
</html>