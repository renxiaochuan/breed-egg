package com.xiaochuan.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaochuan.common.service.BaseServiceImpl;
import com.xiaochuan.entity.User;
import com.xiaochuan.repository.UserMapper;
import com.xiaochuan.service.IUserService;

@Service("userService")  
public class UserServiceImpl  extends BaseServiceImpl implements IUserService {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource  
    private UserMapper userDao;  
    
    public User getUserById(int userId) {  
        // TODO Auto-generated method stub  
        return this.userDao.selectByPrimaryKey(userId);  
    }
}
