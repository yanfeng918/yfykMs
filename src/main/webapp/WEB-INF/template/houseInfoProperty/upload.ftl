<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>上传房源</title>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.1.min.js"></script>
 <script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${base}/resources/js/Calendar.js"></script>
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
                    beginDate: {
                        required: true
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
                <div class="demos">
                    <span>房源获取日期</span>
                    <input name="beginDate" type="text" id="beginDate" size="10" maxlength="10" value="${beginDate}"
                           onClick="new Calendar().show(this);" readonly="readonly" style="border:solid; width:150px;height:20px; margin:0;"/>
                </div>
            </div><br/>
            <div>
                <input type="file" name="filFile" id="filFile"/><br/>
                <input type="submit" class="button" value="上传" onclick="getResult()"/>
                <label id="errInfo">${errInfo}</label>
                <br/>
                <textarea style="width:600px; height:400px" id="logArea">${log}</textarea>
            </div>
		</form>
        <label id="resultId">${result}</label>
</body>
</html>