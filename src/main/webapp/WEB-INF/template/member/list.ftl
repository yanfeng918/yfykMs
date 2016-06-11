<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.list")}</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/css/date.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/resources/css/pager.css"/>
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/resources/js/Calendar.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.list")} <span>(${message("admin.page.total", pager.totalCount)})</span>
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
            <div style=" margin-left: 50%;">
                <input style="height:28px;" type="text" id="username" name="username" placeholder="用户名"/>
                <input style="height:28px;" type="text" id="email" name="email" placeholder="邮箱"/>
                <input style="height:28px;" type="text" id="mobile" name="mobile" placeholder="电话"/>
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
                <th width="2%">
                    <a href="javascript:;" class="sort" name="name">序号</a>
                </th>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="username">${message("Member.username")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="memberRank">邀请人</a>
				</th>
                <th>
                    <a href="javascript:;" class="sort" name="memberRank">电话</a>
                </th>
				<th>
					<a href="javascript:;" class="sort" name="email">${message("Member.email")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.member.status")}</span>
				</th>
                <th>
                    <span>是否员工</span>
                </th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list pager.list as member]
				<tr>
					<td width="2%">
						${member_index+1}
					</td>
					<td>
						<input type="checkbox" name="ids" value="${member.id}" />
					</td>
					<td>
						${member.username}
					</td>
					<td>

						${member.promoterMember.username}

					</td>
					<td>
						${member.mobile}
					</td>
					<td>
						${member.email}
					</td>
					<td>
						[#if (member.createDate)??]
							${(member.createDate)?string("yyyy-MM-dd HH:mm:ss")}
						[/#if]
					</td>
					<td>
						[#if !member.isEnabled]
							<span class="red">${message("admin.member.disabled")}</span>
						[#elseif member.isLocked]
							<span class="red"> ${message("admin.member.locked")} </span>
						[#else]
							<span class="green">${message("admin.member.normal")}</span>
						[/#if]
					</td>
                    <td>
						[#if member.isEmployee]
                            <span class="red">是</span>
						[#else]
                            <span class="green">否</span>
						[/#if]
                    </td>
					<td>
						<a href="view?id=${member.id}">[${message("admin.common.view")}]</a>
						<a href="edit?id=${member.id}">[${message("admin.common.edit")}]</a>
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