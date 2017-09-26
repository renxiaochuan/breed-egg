package com.xiaochuan.test;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by wiker on 2016/3/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// @PropertySource(name =
// AbstractEnvironment.DEFAULT_PROFILES_PROPERTY_NAME,value = "test")
@ActiveProfiles("production")
@ContextConfiguration(locations = { "classpath:applicationContext-service.xml" })
public class BaseProductionProfiles extends
		AbstractTransactionalJUnit4SpringContextTests {

	@Test
	@Ignore
	public void test() {
	}
}