package com.cykj.springbootweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cykj.springbootweb.entity.Department;
import com.cykj.springbootweb.entity.LayUIData;
import com.cykj.springbootweb.mapper.DepartmentMapper;
import com.cykj.springbootweb.services.DepartmentService;

@Controller
@RequestMapping("/departmentControl")
public class DepartmentController {

	//账号B修改内容
	@Autowired
	public DepartmentService departmentService;
	//添加问题测试git
	//dfdf
	//DFDFD
	
    @RequestMapping("list")
    @ResponseBody
	public Object getDepartment() {
    	List<Department> data=departmentService.query();
		LayUIData<Department> list=new LayUIData<Department>();
		list.setCode("0");
		list.setCount(data.size()+"");
		list.setData(data);
		list.setMsg("");
		return list;
	}
    @RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public Object save(HttpServletRequest request) {
		String name=request.getParameter("name");
		String remark=request.getParameter("remark");
		Department data=new Department();
		data.setName(name);
		data.setRemark(remark);
		departmentService.save(data);
		return "OK";
	}
    /**
     * 返回页面
     * @return
     */
    @RequestMapping("/departmentList")
    public String departmentList() {
        return "departmentList";
    }
    /**
     * 返回页面
     * @return
     */
    @RequestMapping("/showView")
    public ModelAndView showView() {
        return new ModelAndView("departmentList");
    }
}
