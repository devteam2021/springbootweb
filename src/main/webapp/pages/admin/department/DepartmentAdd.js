
	var table = null;
	$(document).ready(function() {
		initTable();
	    $("#btnSearch").on('click',function(){
	    	table.draw();
	    });
	    selected();
	  
	} );
	
	
	/*新增弹框*/
	function add(){
		
		$("#id").val(0);
	
		$('#layer_form')[0].reset();
		$("#saveOrUpdate").attr("onclick","save('save');")
		layer_html('新增','#layer_add','600','520');
	}
	
	/*新增弹框*/
	function save(type){
		
		if (!validate()) {

			return;
		}
		
		var url=null;
		if(type=='save')
			url = '../../../departmentControl/save';
		else
			url = '../../../departmentControl/update';
		$('#layer_form').ajaxSubmit({   
			type: 'POST',
			dateType: 'JSON',
			data : $("#layer_form").serialize(),
			url: url,
			beforeSend:function(){
				layer_wait();
			},
			success: function(json){
				table.draw(false);
				layer.msg(json.message, {icon : 6,time : 500},function(){
					if(json.code=="00"){
		        		layer.closeAll();
		        		layer.closeAll('loading');
		        	}
					
				});
				
			},
			error: function(){
				layer.alert("提交出错！");
				layer.closeAll('loading');
			}
		});
		
	}
	
	/*删除*/
	function del(){
		var ids="";  
		if($("[name='checkitems']:checked").length>0){
			 $("[name='checkitems']:checked").each(function (){
				 ids+=$(this).val()+",";
			 })
		}else{
			return layer.msg('请至少选中一行进行删除!',{icon:5,time:2000});
		}
		layer.confirm('确认要删除吗？',function(index){
			 $.ajax({
					type: 'POST',
					dateType: 'JSON',
					data :{
						ids : ids
					},
					url: '../../../departmentControl/delete',
					beforeSend:function(){
						layer_wait();
					},
					success: function(json){
						layer_close();
						layer.msg(json.message,{icon:6,time:2000});
						table.draw(false);
					},
					error: function(){
						layer_close();
					}
			});
		});
	}
	/*编辑*/
	function edit(){
		
		$('#layer_form')[0].reset();
		$("#saveOrUpdate").attr("onclick","save('update');")
		var data = table.row('.selected').data();
		if(typeof(data)=="undefined"){
			return layer.msg('请至少选中一行进行修改!',{icon:5,time:2000});
		}
		layer_html('修改','#layer_add','600','520');
			
			$("#id").val(data.id);
			$("#name").val(data.name);
			$("#remark").val(data.remark);
			
	}
	
	function initTable(){
		var columns = [
			{   
        	sClass : "text-c",title:"选择",
            data: "ID",
            render: function (data, type, full, meta) {
                return '<input type="checkbox" name="checkitems" value="' + data + '" class="checkchild" />';
            },
            orderable: false 
			},
			{sClass : "text-c",data: "id",title:"ID"},
			{sClass : "text-c",data: "name",title:"名称"},
			{sClass : "text-c",data: "remark",title:"备注"}
	 ];
		table = $('#example').DataTable( {
	        ajax: {
	        	url:"../../../departmentControl/list",
	        	type:"POST",
	            data:function(d){
	            	 d.f_code = $("#f_code").val();
		             d.f_name = $("#f_name").val();
	            }
	        },
	        columns: columns,
	        serverSide: true,//服务器查询数据分页
	        searching: false,
	        dom: 'rt<"bottom"ilp><"clear">',
	        filter: false,    //去掉搜索框
	        scrollY: "600px",
	        scrollCollapse: "true",
	        paginationType: 'full_numbers',
	        sorting: [[ 1, "desc" ]]//默认第几个排序
	    });
		
	}
	
	/*全选/反选*/
    function checkedClean(){
    	if($("[name='checkAll']").is(":checked")){
    		$("[name='checkitems']").prop("checked",true);
    	}else{
    		$("[name='checkitems']").prop("checked",false);
    	}
    	
	}
	function selected(){
	    $('#example tbody').on( 'click', 'tr', function () {
	    	$(this).children().first().children().attr("checked", true);
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	    } );
	}
	
	function validate(){
		return $("#layer_form").validate({
			rules:{
				colCode : {
					required : true,
					rangelength:[2,20]
				},
				colName : {
					required : true,
					rangelength:[2,20]
				},
				colPassword : {
					required : true,
					rangelength:[6,20]
				},
				colPhone : {
					required : true,
					rangelength:[11,11],
					digits:true
				},
				colEmail : {
					//required : true,
					email:true
				},
				
				colSex : {
					required : true
				},colStatus : {
					required : true
				}									
			}
		}).form();
	}

	
