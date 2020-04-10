/**
 * 字典表下拉控件填充数据
 * 
 * @param group-key
 *            字典分类
 * @param frist-null
 *            第一行填充“请选择”空行
 * @param default-value
 *            默认选择值
 * @demo <select group-key='COMM_SEX' frist-null default-value='0'></select>
 * @Author yinyi
 */
(function() {
	$(document).ready(function() {
		$("select[group-key]").each(function(index, element) {
			var self = $(this);
			var df_val = self.attr("default-value") != undefined ? self.attr("default-value") : "";

			if (self.attr("frist-null") != undefined) {
				self.append("<option value='-1'>--请选择--</option>");
			}
			;
			$.ajax({
				type : 'POST',
				dateType : 'JSON',
				url : ctx+'dictController/getListByTypes',
				data : {
					type : self.attr("group-key")
				},
				success : function(json) {
					if (json.code == "00" && json.resultData.length > 0) {
						var selected = "";
						for (var i = 0; i < json.resultData.length; i++) {
							if (df_val == json.resultData[i].valuefield) {
								selected = "selected";
							} else {
								selected = "-1";
							}
							self.append("<option value='" + json.resultData[i].valuefield + "' " + selected + ">" + json.resultData[i].displayfield + "</option>");
						}
					}
				},
				error : function(ex) {
					/*
					layer.msg("获取下拉列表[" + index + "]异常", {
						icon : 5,
						time : 2000
					});*/
				}
			});
		});
	});
})();