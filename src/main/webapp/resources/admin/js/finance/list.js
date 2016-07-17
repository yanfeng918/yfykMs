/*
 * JavaScript - List
 */

var postUrl ="../recharge/getList";
$(function () {

	var _table = createDateTables();

	$("#searchHouseInfo").click(function () {
		_table.draw();
	});
})


var createDateTables = function () {

	var table = $('#listTable').DataTable({
		language: {
			url: '../resources/dataTables/Chinese.json'
		},
		//responsive: true,
		colReorder: true,
		searching: false,
		ordering: false,
		"processing": true,
		"serverSide": true,
		"paging": true,
		"aLengthMenu": [[20, 50, -1], [20, 50, "显示所有"]], //这个是允许用户自定义每页数量的时候,下拉菜单的选项
		"bPaginate": true,      //显示分页器
		"bLengthChange": false, // 用户不可改变每页显示数量
		"iDisplayLength": 20,   //一页显示条数
		"ajax": {
			data: function (data) {
				return getQueryCondition(data)
			},
			url: postUrl,
			type: "GET",
			dataSrc: function (data) {
				data.recordsTotal = data.totalCount;
				data.recordsFiltered = data.totalCount;
				return data.data;
			}
		},
		"columns": [
			{"data": "mobile"},
			{"data": "username"},
			{"data": "balance"},
			{"data": "createDate",
				"render" : function(data,type, row, meta) {
							return new Date(parseInt(data)).format("yyyy-MM-dd hh:mm");
						}
			},
			{"data": "amount"},
			{"data": "zhifubaoAccount"},
			{"data": "checkContent"},
			{"data": "status",
                "render" : function(data,type, row, meta) {
                    if(data=="FAIL"){
                        return '<span class="red">失败</span>';
                    }else if(data=="SUCCESS"){
                        return '<span class="green"> 成功 </span>';
                    }else if(data=="APPLY"){
                        return '<span>待审核</span>';
                    }else{
                        return '<span class="green">审核中</span>';
                    }
                }},
            {"data": null, className: "td-operation  text-center", orderable: false, width: "15%", defaultContent: ""}
		],
		"createdRow": function (row, data, index) {
			//不使用【render】，改用jquery文档操作呈现单元格  data.id
			var $btnEdit = $('<button type="button" class="btn btn-small btn-primary btn-edit" onclick="jump(' + data.id + ')">审核</button>');
            //var $btnEdit = $('<a href="edit?id="' + (data.id-0) + ')">[审核]</a>');
			$('td', row).eq(8).append($btnEdit);
		}
	});
	return table;
}

function getQueryCondition(data) {
	var param = {};
	//组装排序参数
	if (data.order && data.order.length && data.order[0]) {
		switch (data.order[0].column) {
			case 1:
				param.orderColumn = "name";
				break;
			case 2:
				param.orderColumn = "position";
				break;
			case 3:
				param.orderColumn = "status";
				break;
			case 4:
				param.orderColumn = "start_date";
				break;
			default:
				param.orderColumn = "name";
				break;
		}
		param.orderDir = data.order[0].dir;
	}
	//组装查询参数
	if ($("#salePrice").val())
		param.salePrice = $("#salePrice").val();
	if ($("#areaSize").val())
		param.areaSize = $("#areaSize").val();
	if ($("#searchCommunity").val())
		param.community = $("#searchCommunity").val();
	if ($("#area_id").val())
		param.area_id = $("#area_id").val();

	//组装分页参数
	param.pageOffset = data.start;
	param.pageSize = data.length;
	return param;
}

function jump(id){
    window.location.href="edit?id="+id;
}


	

