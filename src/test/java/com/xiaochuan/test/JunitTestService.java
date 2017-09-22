package com.xiaochuan.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.xiaochuan.entity.TestEntity;
import com.xiaochuan.service.TestService;

public class JunitTestService extends BaseProductionProfiles {

    @Autowired
    private TestService testService;

    @Test
    public void testDao(){
        TestEntity test = new TestEntity();
        test.setContent("测试的内容");
        //插入数据
        testService.add(test);

        //查询数据
        List<TestEntity> list = (List<TestEntity>) testService.getAll();
        for(TestEntity t:list){
            System.out.println("Content:"+t.getContent());
        }

    }
}