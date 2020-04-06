package com.cykj.springbootweb.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cykj.springbootweb.entity.Department;
import com.cykj.springbootweb.mapper.DepartmentMapper;
import com.cykj.springbootweb.services.DepartmentService;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements DepartmentService {

	@Autowired
	public DepartmentMapper departmentMapper;
	
	public List<Department> query(){
		return departmentMapper.query();
	}
}