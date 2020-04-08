package com.cykj.springbootweb.mapper;

import java.io.Serializable;

import org.apache.ibatis.annotations.Mapper;


/**
 * 基础数据库操作类
 * 
 */
@Mapper
public interface BaseDao<T> {
	
	/**
	 * 保存对象
	 * @param entity
	 * @return
	 */
    void save(T entity);
	
	/**
	 * 更新对象
	 * @param entity
	 * @return
	 */
    T update(T entity);
	
	/**
	 * 根据id获取对象
	 * @param id
	 * @return
	 */
    T get(Serializable id);
	
	/**
	 * 根据id删除对象
	 * @param id
	 */
    void delete(Serializable id);
	
	/**
	 * 删除对象
	 * @param entity
	 */
    void remove(T entity);
	


}