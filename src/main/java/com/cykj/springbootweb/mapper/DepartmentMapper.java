package com.cykj.springbootweb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cykj.springbootweb.entity.Department;

@Repository
public interface DepartmentMapper extends BaseDao<Department>{
    List<Department> query();
}