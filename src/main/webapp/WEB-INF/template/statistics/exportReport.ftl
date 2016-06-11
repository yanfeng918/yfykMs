<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>导出报表</title>
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript">
    var win_check;

	//前一天，电话，状态，备注
    function exportYesterday(){
        var cityId=$("#cityId").val();
        $("#exportYesterdaybut").attr('disabled', true);
        $("#exportMemberbut").attr('disabled', true);
        $("#exportTwoDaysCreatebut").attr('disabled', true);
        $("#exportTodayCheckbut").attr('disabled', true);
        $("#exportYesterdayCheckAndCreatebut").attr('disabled', true);
        location.href = "exportYesterday"+"?cityId="+cityId;
        win_check = window.setInterval(check, 1000);
    }
    //导出会员活跃情况
    function exportMember(){
        var cityId=$("#cityId").val();
        $("#exportYesterdaybut").attr('disabled', true);
        $("#exportMemberbut").attr('disabled', true);
        $("#exportTwoDaysCreatebut").attr('disabled', true);
        $("#exportTodayCheckbut").attr('disabled', true);
        $("#exportYesterdayCheckAndCreatebut").attr('disabled', true);
        location.href = "exportMember"+"?cityId="+cityId;
        win_check = window.setInterval(check, 1000);
    }
    //导出两天前发布房源状况
    function exportTwoDaysCreate(){
        var cityId=$("#cityId").val();
        $("#exportYesterdaybut").attr('disabled', true);
        $("#exportMemberbut").attr('disabled', true);
        $("#exportTwoDaysCreatebut").attr('disabled', true);
        $("#exportTodayCheckbut").attr('disabled', true);
        $("#exportYesterdayCheckAndCreatebut").attr('disabled', true);
        location.href = "exportTwoDaysCreate"+"?cityId="+cityId;
        win_check = window.setInterval(check, 1000);
    }
    //导出今日审核房源报表
    function exportTodayCheck(){
        var cityId=$("#cityId").val();
        $("#exportYesterdaybut").attr('disabled', true);
        $("#exportMemberbut").attr('disabled', true);
        $("#exportTwoDaysCreatebut").attr('disabled', true);
        $("#exportTodayCheckbut").attr('disabled', true);
        $("#exportYesterdayCheckAndCreatebut").attr('disabled', true);
        location.href = "exportTodayCheck"+"?cityId="+cityId;
        win_check = window.setInterval(check, 1000);
    }
    //导出今日审核房源报表
    function exportYesterdayCheckAndCreate(){
        var cityId=$("#cityId").val();
        $("#exportYesterdaybut").attr('disabled', true);
        $("#exportMemberbut").attr('disabled', true);
        $("#exportTwoDaysCreatebut").attr('disabled', true);
        $("#exportTodayCheckbut").attr('disabled', true);
        $("#exportYesterdayCheckAndCreatebut").attr('disabled', true);
        location.href = "exportYesterdayCheckAndCreate"+"?cityId="+cityId;
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
                    $("#exportYesterdaybut").attr('disabled', false);
                    $("#exportMemberbut").attr('disabled', false);
                    $("#exportTwoDaysCreatebut").attr('disabled', false);
                    $("#exportTodayCheckbut").attr('disabled', false);
                    $("#exportYesterdayCheckAndCreatebut").attr('disabled', false);
                }
            }
        });
    }
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/index/">${message("admin.path.index")}</a> &raquo; 导出报表
	</div>
	<form>
        <div>
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
        <input type="button" id="exportYesterdaybut" onclick="exportYesterday()" style="margin-top:25px" value="导出前一天房源状态"/><br/>
        <input type="button" id="exportMemberbut" onclick="exportMember()" style="margin-top:25px" value="导出会员活跃情况"/><br/>
        <input type="button" id="exportTwoDaysCreatebut" onclick="exportTwoDaysCreate()" style="margin-top:25px" value="导出两天前发布房源状况"/><br/>
        <input type="button" id="exportTodayCheckbut" onclick="exportTodayCheck()" style="margin-top:25px" value="导出今日审核房源报表"/><br/>
        <input type="button" id="exportYesterdayCheckAndCreatebut" onclick="exportYesterdayCheckAndCreate()" style="margin-top:25px" value="导出昨日审核和创建"/><br/>
        <br/>
        <h3>本月活跃数:${number}</h3><br/>
	</form>


</body>
</html>