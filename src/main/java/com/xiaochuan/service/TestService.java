package com.xiaochuan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaochuan.common.service.BaseServiceImpl;
import com.xiaochuan.entity.TestEntity;
import com.xiaochuan.repository.TestDao;

@Service
@Transactional(readOnly = true)
public class TestService extends BaseServiceImpl{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private TestDao testDao;

	@Transactional(readOnly = false)
	public void add(TestEntity t) {
		  testDao.save(t);
	}

	public List<Object> getAll() {
		return (List<Object>) testDao.find("select a.id as id,a.content as content from TestEntity a");
//		return  null ;
	}

	@Transactional(readOnly = false)
	public void del(long id) {
//		testDao.delete(id);
	}
}
