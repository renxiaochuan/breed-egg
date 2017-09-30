package com.xiaochuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaochuan.entity.TestEntity;
import com.xiaochuan.service.TestService;

//要使用Controller 必须加@Controller注解也可以用@Controller("path")这里面的path相当于本Controller的根路径
//如果配置成@Controller("path"),那么访问的地址应该是：http://localhost:8080/path/test
@Controller
public class TestController {
	// 和Service结合，实现数据库操作。这里是注入的Service，其实直接注入Dao也是可以的
	// TIPS：Service使用了事务，所以不要直接try catch，不然事务会失效
	@Autowired
	private TestService testService;
	
	// 映射JSP测试
	@RequestMapping(value = "test", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String test(Model model, String name) {
		model.addAttribute("name", name);
		return "index";
	}

	// rest风格测试 @PathVariable 用于REST风格
	// 那么访问的url就是：http://localhost:8080/test/wiker
	@RequestMapping(value = "testRest/{name}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String testRest(Model model, @PathVariable String name) {
		model.addAttribute("name", name);
		return "index";
	}

	// @RequestParam 用于参数绑定
	// 那么访问URL就必须改成：http://localhost:8080/test?testName=test
	@RequestMapping(value = "testRequestParam", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String testRequestParam(Model model,
			@RequestParam("testName") String name) {
		model.addAttribute("name", name);
		return "index";
	}

	// 测试自动转JSON
	@RequestMapping(value = "test.json", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> testJson(Model model, String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		return map;
	}



	// 获取列表
	@RequestMapping(value = "testGetAll", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String testGetAll(Model model, String name) {
//		List<TestEntity> list = testService.getAll();
//		model.addAttribute("list", list);
		return "testList";
	}

	// 添加操作，添加后返回列表页面，这里为了简单演示就直接通过redirect的方式
	// 真实情况应该是根据业务需求来是重定向还是直接刷新页面等
	@RequestMapping(value = "testAdd", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String testGetAll(Model model, TestEntity entity) {
		testService.add(entity);
//		List<TestEntity> list = testService.getAll();
//		model.addAttribute("list", list);
		return "redirect:/testGetAll";
	}

	// 添加操作，添加后返回列表页面，这里为了简单演示就直接通过redirect的方式
	// 真实情况应该是根据业务需求来是重定向还是直接刷新页面等
	@RequestMapping(value = "testDel", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String testDel(Model model, long id) {
		testService.del(id);
		return "redirect:/testGetAll";
	}
}
