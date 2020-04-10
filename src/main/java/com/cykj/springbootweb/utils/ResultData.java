package com.cykj.springbootweb.utils;

import java.util.HashMap;
import java.util.Map;

public class ResultData {

	public static final Map<String, String> MESSAGE_MAP = new HashMap<String, String>();
	static {
		MESSAGE_MAP.put("00", "操作成功");
		MESSAGE_MAP.put("01", "操作失败");
		MESSAGE_MAP.put("02", "验证码输入错误");
		MESSAGE_MAP.put("03", "该帐号已经注册");
		MESSAGE_MAP.put("04", "该帐号不存在");
		MESSAGE_MAP.put("05", "用户名或者密码错误");
		MESSAGE_MAP.put("06", "用户名不能为空");
		MESSAGE_MAP.put("07", "密码不能为空");
		MESSAGE_MAP.put("08", "未登录或已超时");
		MESSAGE_MAP.put("09", "未查询到有效数据");
		MESSAGE_MAP.put("10", "系统异常");
		MESSAGE_MAP.put("11", "无权限访问");
		MESSAGE_MAP.put("12", "验证码错误");
		MESSAGE_MAP.put("13", "验证码不能为空");
		MESSAGE_MAP.put("14", "请输入正确漫币值");
		MESSAGE_MAP.put("15", "token失效，请重新登录");
		MESSAGE_MAP.put("16", "token为空，请重新登录");
	}

	/**
	 * 返回带数据集的消息对象 适合查询 ("00", "操作成功"); ("01", "操作失败"); ("02", "验证码输入错误"); ("03",
	 * "该帐号已经注册"); ("04", "该帐号不存在"); ("05", "用户名或者密码错误"); ("06", "用户名不能为空"); ("07",
	 * "密码不能为空"); ("08", "未登录或已超时"); ("09", "未查询到有效数据"); ("10", "系统异常"); ("11",
	 * "无权限访问");
	 */
	public static Map<String, Object> resultData(Object resultData, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("message", MESSAGE_MAP.get(code));
		map.put("resultData", resultData);
		return map;
	}

	/**
	 * 返回带数据集的消息对象 适合查询成功后
	 */
	public static Map<String, Object> resultData(Object resultData) {
		return resultData(resultData, "00");
	}

	public static Map<String, Object> resultData(String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("message", MESSAGE_MAP.get(code));
		map.put("resultData", "");
		return map;
	}

	/**
	 * 返回自定义提示消息 不包含数据集
	 */
	public static Map<String, Object> resultData(String code, String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("message", msg);
		map.put("resultData", "");
		return map;
	}

	/**
	 * 返回自定义提示消息 包含数据集
	 */
	public static Map<String, Object> resultData(String code, String msg, String resultData) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("message", msg);
		map.put("resultData", resultData);
		return map;
	}
}
