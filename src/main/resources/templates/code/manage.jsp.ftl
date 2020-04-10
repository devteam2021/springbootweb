
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/commons/meta.jsp"%>
<%@ include file="/pages/commons/taglibs.jsp"%>

<style>
.table td {
	text-align: center;
}

.dataTables_scrollBody {
	height: auto !important;
}
</style>
<script type="text/javascript"
	src="<#noparse>${</#noparse>pageContext.request.contextPath<#noparse>}</#noparse>/lib/laydate/laydate.js"></script>
<script type="text/javascript"
	src="<#noparse>${</#noparse>pageContext.request.contextPath<#noparse>}</#noparse>/lib/jquery/1.9.1/jquery.form.js"></script>
<script type="text/javascript" src="${entity}Manage.js"></script>
<title>project</title>
</head>
<body>
	<div class="page-container">
		<div>
			名称 ：<input type="text" class="input-text" style="width: 250px"
				id="searchName" name="searchName">
		</div>

		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="#" class="btn btn-success radius"
				id="btnSearch"><i class="Hui-iconfont">&#xe665;</i> 查询</a> <a
				href="#" class="btn btn-secondary radius" onclick="add()"><i
					class="Hui-iconfont">&#xe600;</i> 新增</a> <a href="#"
				class="btn btn-primary radius" onclick="edit()"> <i
					class="Hui-iconfont">&#xe6df;</i> 修改
			</a> <a href="#" class="btn btn-danger radius" onclick="del()"><i
					class="Hui-iconfont">&#xe6e2;</i> 删除</a> <!--<a href="#" class="btn btn-warning radius"><i class="Hui-iconfont">&#xe644;</i> 导出</a> 
				<a href="#" class="btn btn-secondary radius"><i class="Hui-iconfont">&#xe645;</i> 导入</a> -->
			</span> <span class="r"><a class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a></span>
		</div>

		<div class="mt-20">
			<table id="example"
				class="table table-border table-bordered table-bg table-hover table-sort">
				
				<tbody>

				</tbody>
			</table>
		</div>
	</div>


	<!-- ---------------------------------------------------------新增修改模版---------------------------------------------------- -->
	<div id="layer_add" style="display: none;">
		<div class="page-container">
			<form action="" method="post" enctype="multipart/form-data"
				class="form form-horizontal" id="layer_form">
					<input type="hidden" id="id" name="id" value="0">
				<#list table.fields as field>
				<#if field.keyFlag>
			
			
				<#else>
				<div class="row cl">
					<label class="form-label col-xs-3 col-sm-3"><span
						class="c-red">*</span>${field.comment}:</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" id="${field.name}" name="${field.name}">
					</div>
				</div>
				</#if>
				</#list>
				

				<div class="row cl page-bottom">
					<div class="col-xs-offset-4" style="margin-top: 50px">
						<input class="btn btn-primary radius" type="button"
							onclick="save();" id="saveOrUpdate"
							value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- ---------------------------------------------------------结束模版---------------------------------------------------- -->
</body>

</html>
