package com.wanghong.test.junit;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * 请设置好要装载的spring配置文件,一般开发数据库与测试数据库分开
 * 所以你要装载的资源文件应改为"classpath:/spring/*-test-resource.xml"
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)  //让测试运行与spring环境
//@ContextConfiguration(locations = {"classpath:spring/test-applicationContext.xml", "classpath:spring-mybatis.xml"})
//【别忘了在test/resource下放置test-applicationContext】
@ContextConfiguration(locations = {"classpath:spring/test-applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = false)  // true：回滚数据
public abstract class BaseTest {
}
