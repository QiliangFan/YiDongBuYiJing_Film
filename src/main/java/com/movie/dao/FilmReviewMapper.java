package com.movie.dao;

import com.movie.domain.po.FilmReview;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/*
 * Created by sxj on 2019/8/02.
 * */
@Repository
public interface FilmReviewMapper {
    int add(FilmReview filmReview);
    List<FilmReview> selectAll(@Param("offset") Integer offset, @Param("limit") Integer limit);
    List<FilmReview> selectByMovieId(@Param("offset") Integer offset, @Param("limit") Integer limit, @Param("movieId") Integer movieId);
    List<FilmReview> selectByUserId(@Param("offset") Integer offset, @Param("limit") Integer limit, @Param("userId") Integer userId);
    int update(FilmReview filmReview);
    int deleteById(Integer id);
    int count();
}
