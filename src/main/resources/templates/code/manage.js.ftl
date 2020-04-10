
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
			url = '/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>Controller/save';
		else
			url = '/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>Controller/update';
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
					url: '/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>Controller/delete',
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
			
			<#list table.fields as field>
		<#noparse>$("#</#noparse>${field.name}").val(data.${field.name});
				</#list>
			
			
			
	}
	
	function initTable(){
		var columns = [
			<#list table.fields as field>
				<#if field.keyFlag>		
			{   
        	sClass : "text-c",title:"选择",
            data: "${field.name}",
            render: function (data, type, full, meta) {
                return '<input type="checkbox" name="checkitems" value="' + data + '" class="checkchild" />';
            },
            orderable: false 
			}
			,{sClass : "text-c",data: "${field.name}",title:"ID"}
			<#else>
			,{sClass : "text-c",data: "${field.name}",title:"${field.comment}"}
			</#if>
			</#list>
	 ];
		table = $('#example').DataTable( {
	        ajax: {
	        	url:"/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>Controller/list",
	        	type:"POST",
	            data:function(d){
		             d.searchName = $("#searchName").val();
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
			
			
			}
		}).form();
	}

	
