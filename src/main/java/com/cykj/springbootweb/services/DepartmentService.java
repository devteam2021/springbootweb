package com.cykj.springbootweb.services;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cykj.springbootweb.entity.Department;


public interface DepartmentService extends BaseService<Department>{
	List<Department> query();
}


