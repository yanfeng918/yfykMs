<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>列表</title>


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

	<form id="listForm" action="list" method="get">
	
		

		<table id="listTable" class="list">
			<tr>
				[#--<th class="check">--]
					[#--<input type="checkbox" id="selectAll" />--]
				[#--</th>--]

				<th>
					<a href="javascript:;" class="sort" name="name">手机号码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="mobile">用户名</a>
				</th>
                <th>
                    <a href="javascript:;" class="sort" name="mobile">余额</a>
                </th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">充值日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">充值金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="">充值账号</a>
				</th>

                <th>
                    <a href="javascript:;" class="sort" name="">审核备注</a>
                </th>
				<th>
					<span>信息状态</span>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list pager.list as recharge]
				<tr>
					[#--<td>--]
						[#--<input type="checkbox" name="ids" value="${recharge.id}" />--]
					[#--</td>--]
					<td>
						${recharge.mobile}
					</td>
					<td>
						${recharge.username}
					</td>
                    <td>
						${recharge.balance}
                    </td>
					<td>
						[#if (recharge.createDate)??]
							${(recharge.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
					</td>

					<td>
						${recharge.amount}
					</td>
					

					<td>
						${recharge.zhifubaoAccount}
					</td>
					<td>
						${recharge.checkContent}
					</td>

					<td>
                        [#if recharge.status=="FAIL"]
                            <span class="red">失败</span>
                        [#elseif recharge.status=="SUCCESS"]
                            <span class="red"> 成功 </span>
                        [#elseif recharge.status=="APPLY"]
                            <span class="green">待审核</span>
                        [#else]
                            <span class="green">审核中</span>
                        [/#if]
					</td>

					<td>
						[#--<a href="view?id=${recharge.id}">[${message("admin.common.view")}]</a>--]
						<a href="edit?id=${recharge.id}">[审核]</a>
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