package com.cykj.springbootweb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cykj.springbootweb.entity.Department;

@Mapper
public interface DepartmentMapper extends BaseDao<Department>{
    List<Department> query();
}