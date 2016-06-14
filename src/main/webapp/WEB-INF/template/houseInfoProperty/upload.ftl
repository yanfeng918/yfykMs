<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>上传房源</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
 <script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
    <script type="text/javascript">
        var isSubmit = false;
        $().ready(function () {
            var $inputForm = $("#inputForm");
            // 表单验证
            $inputForm.validate({
                errorPlacement: function () {
                    isSubmit = false;
                },
                rules: {
                    filFile: {
                        required: true
                    },
                    startIndex: {
                        required: false
                    },
                    endIndex: {
                        required: false
                    }
                }
            });
        });
        var win_check;
        function getResult(){
            $("#resultId").html("");
            $("#logArea").val("");
            win_check = window.setInterval(check, 1000);
            return true;

        }
      /**
 * 用于防止重复提交
 */
function check() {
    $.ajax({
        type: "get",
        async:false,
        url: 'getBuffer',
        success: function (data) {
        if(data.status=="true"){
        	window.clearInterval(win_check);
        	$("#filFile").val("");
        }
        	$("#logArea").val(data.result);
            var psconsole = $('#logArea');
            if(psconsole.length)
                psconsole.scrollTop(psconsole[0].scrollHeight - psconsole.height());
        	}
        
  
    });
}
    </script>
</head>
<body>
        <form id="inputForm" action="upload.do" method="post" enctype="multipart/form-data">
            <div>
                [#--<select name="cityId" id="cityId">--]
                    [#--<option value="">----请选择城市----</option>--]
                [#--[#list cityList as city]--]
                [#--${city.name}--]
                    [#--<option value="${city.id}" [#if cityId?? &&cityId==city.id]selected="selected"[/#if]>--]
                    [#--${city.name}--]
                    [#--</option>--]
                [#--[/#list]--]
                [#--</select>--]
                [#--<br/>--]
                [#--<label>开始行</label><input type="text" name="startIndex" id="startIndex"/><br/>--]
                [#--<label>结束行</label><input type="text" name="endIndex" id="endIndex"/><br/>--]
            </div><br/>
            <div>
                <input type="file" name="filFile" id="filFile"/><br/>
                <input type="submit" class="button" value="上传" onclick="getResult()"/>
                <label id="errInfo">${errInfo}</label>
                <br/>
                <textarea style="width:600px; height:400px" id="logArea">${log}
                </textarea>
            </div>
		</form>
        <label id="resultId">${result}</label>
</body>
</html>