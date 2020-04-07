<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
           
<table class="layui-hide" id="list" lay-filter="list"></table>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
  </div>
</script>
          
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
 
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#list'
    ,url:'${pageContext.request.contextPath}/departmentControl/list'
    ,dataType:'json'
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
      {field:'id', width:80, title: 'ID', sort: true}
      ,{field:'name', width:120, title: '部门', sort: true}
      ,{field:'remark',  title: '备注'}
    ]]
  });
  
//头工具栏事件
  table.on('toolbar(list)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'add':
    	  var $=layui.$;
    	  $.ajax({  
              type: 'post',  
              url: '${pageContext.request.contextPath}/departmentControl/save', // ajax请求路径  
              data: {  
                  name:'新部门',remark:'部门备注'
              },  
              success: function(data){ 
                if(data=="OK"){
                  layer.msg('添加成功');
                }else{
                  layer.msg(data);
                }
              }  
          });
      break;
      
    }
  });
  
  
});

</script>

</body>
</html>