
/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
	      type: 2,
	      title: title,
	      shadeClose: true,
	      fix: false, //不固定
	      hade:0.4,
	      maxmin: true, //开启最大化最小化按钮
	      area: [w+'px', h +'px'],
	      content: url
	});
}
/*全屏显示*/
function layer_show(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_html(title,id,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer_index = layer.open({
	      type: 1,
	      title: title,
	      shadeClose: true,
	      fix: false, //不固定
	      hade:0.4,
	      maxmin: true, //开启最大化最小化按钮
	      area: [w+'px', h +'px'],
	      content: $(id)
	});
}


/*全局变量  弹出加载层的序列*/
var layer_index = null;
/*
 *加载层 type传值0~2图标变化 也可不传 
 * */
function layer_wait(type){
	if(typeof(type)=="undefined"){
		type=1;
	}
	layer_index = layer.load(type, {
		shade: [0.1,'#fff'] 
	});
};


/*关闭弹出框口*/
function layer_close(){
	layer.close(layer_index);
}

/**
页面的code
*/
//function setBtn( parentId,userCode,systemFlag){
//	
//	$.ajax({
//		type: 'POST',
//		dateType: 'JSON',
//		url :ctx+'SysModuleController/getModuleBtnByCode',
//		data :{parentId:parentId,userCode:userCode,systemFlag:systemFlag},
//		success: function(json){
//		    for(var i  = 0 ; i<json.length;i++){
//		    	if(json[i].name == '新增'){
//		    		$("#btnAdd").show();
//		    	}else if(json[i].name=='修改'){
//		    		$("#btnEdit").show();
//		    	}else if(json[i].name=='删除'){
//		    		$("#btnDelete").show();
//		    	}else if(json[i].name=='查询'){
//		    		$("#btnSearch").show();
//		    	}
//		    }
//		},
//		error: function(){
//		}
//	});
//}
/*上传*/
$(document).on("change",".input-file",function(){
	var uploadVal=$(this).val();
	$(this).parent().find(".upload-url").val(uploadVal).focus().blur();
});

/**
 * ajaxSetup 可以设置未来(全局)的AJAX请求默认选项
 * 主要设置了AJAX请求遇到Session过期的情况
 */
$.ajaxSetup({
	contentType:"application/x-www-form-urlencoded;charset=utf-8", 
    complete: function(xhr,status) {
    	 //alert("quanju:"+JSON.stringify(xhr));
        var responseText = xhr.responseText;
        var responseJson = JSON.parse(responseText);
        var code = responseJson.code;
        var message = responseJson.message;
       // alert("code:"+code);
        if(code == 'timeout') {
            var top = getTopWinow();
            layer.msg(message, {
				icon : 5,
				time : 3000
			});
            top.location.href = ctx+'pages/yylogin.jsp';
        }
    }
});

/**
 * 在页面中任何嵌套层次的窗口中获取顶层窗口
 * @return 当前页面的顶层窗口对象
 */
function getTopWinow(){
    var p = window;
    while(p != p.parent){
        p = p.parent;
    }
    return p;
}

