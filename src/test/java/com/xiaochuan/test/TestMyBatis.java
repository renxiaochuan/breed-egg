package com.xiaochuan.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.xiaochuan.entity.User;
import com.xiaochuan.service.IUserService;

  
public class TestMyBatis  extends BaseProductionProfiles{  
    private static Logger logger = Logger.getLogger(TestMyBatis.class);  
 
    @Autowired
	private IUserService userService;

	@Test
	public void testDao() {
		User user = userService.getUserById(1);  
		logger.info(JSON.toJSONString(user));  
	}
}  