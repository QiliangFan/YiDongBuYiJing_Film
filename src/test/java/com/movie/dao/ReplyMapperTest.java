package com.movie.dao;

import com.movie.domain.po.Reply;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

//author:zyr


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-config.xml")
public class ReplyMapperTest {

    @Autowired
 private ReplyMapper replyMapper;
    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void add() {
       Reply reply=new Reply("ff","","",1,2);
       int a=replyMapper.add(reply);
       assertTrue(a==1);

    }

    @Test
    public void selectByUserId() {
       List<Reply> replies=replyMapper.selectByUserId(1,0,2);
       assertTrue(replies.size()==2);
    }

    @Test
    public void selectByFilmReviewId() {
       List<Reply> replies=replyMapper.selectByFilmReviewId(2,0,2);
       assertTrue(replies.size()==2);
    }

    @Test
    public void deleteById() {
       int a=replyMapper.deleteById(6);
       assertTrue(a>=0);

    }

    @Test
    public void update() {
       Reply reply=new Reply(6,"ff","1","1",1,2);
       int a=replyMapper.update(reply);
       assertTrue(a==1);

    }

    @Test
    public void countByUserId() {
       int a=replyMapper.countByUserId(1);
       assertTrue(a==3);
    }

    @Test
    public void countByFilmReviewId() {
       int a=replyMapper.countByFilmReviewId(2);
       assertTrue(a==3);
    }
}