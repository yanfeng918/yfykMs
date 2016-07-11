<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>列表</title>


    <link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${base}/resources/css/pager.css"/>
    <script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${base}/resources/js/Calendar.js"></script>

    <script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
    <link rel="stylesheet" type="text/css" href="${base}/resources/dataTables/media/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="${base}/resources/dataTables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/finance/list.js"></script>


</head>
<body>

<form id="listForm" action="list" method="get">

    <table id="listTable" class="stripe cell-border" width="100%">
        <thead>
            <tr>
                <th>手机号码</th>
                <th>用户名</th>
                <th>余额</th>
                <th>充值日期</th>
                <th>充值金额</th>
                <th>充值账号</th>
                <th>审核备注</th>
                <th>信息状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

</form>

</body>
</html>