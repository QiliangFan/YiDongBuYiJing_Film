package com.movie.dao;

import com.movie.domain.po.FilmReview;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.Reader;
import java.util.List;

import static org.junit.Assert.*;
/*
 * Created by sxj on 2019/8/02.
 * */
@ContextConfiguration(locations= {"classpath:spring/spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class FilmReviewMapperTest {
    @Autowired
    private FilmReviewMapper filmReviewMapper;

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }
    @Test
    public void add() {
        int a = filmReviewMapper.add(new FilmReview(100,""+System.currentTimeMillis(),"yingping3",10,10,2,3));
        assertTrue(a==1);
    }

    @Test
    public void selectAll() {
        List<FilmReview> filmReviews = filmReviewMapper.selectAll(0,5);
        assertTrue(filmReviews.size()==3);
    }

    @Test
    public void selectByMovieId() {
        List<FilmReview> filmReviews = filmReviewMapper.selectByMovieId(0,5,3);
        assertTrue(filmReviews.size()==2);
    }

    @Test
    public void selectByUserId() {
        List<FilmReview> filmReviews = filmReviewMapper.selectByUserId(0,5,1);
        assertTrue(filmReviews.size()==2);

    }

    @Test
    public void update() {
        List<FilmReview> filmReviews = filmReviewMapper.selectByMovieId(0,5,4);
        FilmReview filmReview = filmReviews.get(0);
        filmReview.setReadNum(10000000);
        int a = filmReviewMapper.update(filmReview);
        assertTrue(a==1);
    }

    @Test
    public void deleteById() {
        int a = filmReviewMapper.deleteById(4);
        assertTrue(a==1);
    }

    @Test
    public void count() {
        int a = filmReviewMapper.count();
        assertTrue(a==3);
    }
}