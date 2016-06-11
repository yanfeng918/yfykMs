<script type="text/javascript">

	$(document).ready(function() {  
    	$("#pager").pager({ pagenumber: ${pager.pageNumber}, pagecount: ${pager.pageCount}, buttonClickCallback: PageClick });  
    });

	PageClick = function(pageclickednumber) {  
	
        var param='pageNumber='+pageclickednumber+'&';
        input = $("<input type='text'>").val(pageclickednumber).attr('name','pageNumber')
        $("#listForm").append(input);
        $("#listForm").submit();
         
        $("#pager").pager({ pagenumber: pageclickednumber, pagecount:${pager.pageCount}, buttonClickCallback: PageClick });  
   }
</script>
<span id="pager"></span>
<input type="hidden" id="pageSize" name="pageSize" value="${pager.pageSize}" />
<input type="hidden" name="orderBy" id="orderBy" value="${pager.orderBy}" />
<input type="hidden" name="orderType" id="order" value="${pager.orderType}" />