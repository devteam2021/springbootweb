/*
 * 测试路径
 */
var ctx = "/";
//正式服务器
//var ctx_img = "http://47.88.157.33/upload";
//测试服务器
//var ctx_img = "http://192.168.0.201:8080/upload";
//本地服务器
var ctx_img = "http://localhost:8080/upload";
//拓展 - 获取URL参数
$.extend({
	getUrlVars :function(name){
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r!=null) 
			return unescape(r[2]); 
		return null;
	}
});
