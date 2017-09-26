package com.xiaochuan.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.xiaochuan.entity.TestEntity;

public interface TestDao extends PagingAndSortingRepository<TestEntity, Long>,
		JpaSpecificationExecutor<TestEntity> {

}