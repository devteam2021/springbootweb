package com.cykj.springbootweb.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cykj.springbootweb.entity.Department;
import com.cykj.springbootweb.entity.LayUIData;
import com.cykj.springbootweb.services.DepartmentService;
import com.cykj.springbootweb.utils.ResultData;

@Controller
@RequestMapping("/departmentControl")
public class DepartmentController {
	@Autowired
	public DepartmentService departmentService;

	@RequestMapping("list")
	@ResponseBody
	public Object getDepartment() {
		List<Department> data = departmentService.query();
		LayUIData<Department> list = new LayUIData<Department>();
		list.setCode("0");
		list.setCount(data.size() + "");
		list.setData(data);
		list.setMsg("");
		return list;
	}

	/**
	 * 添加及保存操作
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Map<String, Object> save(HttpServletRequest request,HttpServletResponse response,
			Department department){
		try {
			
			
			
			
			departmentService.save(department);
		}catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			return ResultData.resultData("08","违反唯一性约束,帐号已存在");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultData.resultData("01");
		}
		return ResultData.resultData("00");
		
	}

	/**
	 * 返回页面
	 * 
	 * @return
	 */
	@RequestMapping("/departmentList")
	public String departmentList() {
		return "departmentList";
	}

	/**
	 * 返回页面
	 * 
	 * @return
	 */
	@RequestMapping("/showView")
	public ModelAndView showView() {
		return new ModelAndView("departmentList");
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFile(HttpServletRequest request, HttpServletRequest response) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		MultipartFile multipartFile = multipartRequest.getFile("image");// file是form-data中二进制字段对应的name
		
		System.out.println(multipartFile.getSize());
		return "服务器接收到图片";
	}

}
