package com.xiaochuan.service;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xiaochuan.entity.TestEntity;
import com.xiaochuan.repository.TestDao;

@Service
@Transactional(readOnly = true)
public class TestService {

    @Autowired
    private TestDao testDao;

    @Transactional(readOnly=false)
    public TestEntity add(TestEntity t){
        return testDao.save(t);
    }

    public List<TestEntity> getAll(){
        return (List<TestEntity>) testDao.findAll();
    }
    
    @Transactional(readOnly=false)
    public void del(long id){
        testDao.delete(id);
    }
}
