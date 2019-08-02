package com.movie.dao;

import com.movie.domain.po.UserPrefer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
/*
* Created by sxj on 2019/8/02.
 * */
@ContextConfiguration(locations = {"classpath:spring/spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UserPreferMapperTest {
    @Autowired
    private UserPreferMapper userPreferMapper;
    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void add() {
        int a = userPreferMapper.add(new UserPrefer("喜剧","孙红雷","何炅",1));
        assertTrue(a==1);
    }

    @Test
    public void selectByUserId() {
        UserPrefer userPrefer = userPreferMapper.selectByUserId(2);
        assertTrue(userPrefer.getActor().equals("何炅"));
    }

    @Test
    public void deleteByUserId() {
        int a = userPreferMapper.deleteByUserId(3);
        assertTrue(a==1);
    }

    @Test
    public void update() {
        UserPrefer userPrefer = userPreferMapper.selectByUserId(2);
        userPrefer.setMovieType("爱情");
        int a = userPreferMapper.update(userPrefer);
        assertTrue(a==1);
    }

    @Test
    public void count() {
        int a = userPreferMapper.count();
        assertTrue(a==2);

    }
}