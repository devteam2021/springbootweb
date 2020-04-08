package com.cykj.springbootweb.services.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.cykj.springbootweb.mapper.BaseDao;
import com.cykj.springbootweb.services.BaseService;


@Transactional
public class BaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	private BaseDao<T> baseDao;
	

	public T get(Serializable id) {		
		return baseDao.get(id);
	}

	public void save(T entity) {
		baseDao.save(entity);
	}
	
	public void delete(Serializable id){
		baseDao.delete(id);
	}
	
	public void remove(T entity){
		baseDao.remove(entity);
	}
	
	public T update(T entity) {
		return baseDao.update(entity);
	}
	

}
