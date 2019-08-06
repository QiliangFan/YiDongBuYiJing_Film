package com.movie.dao;

import com.movie.domain.po.Movie;
import com.movie.domain.po.UserPrefer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/1 23:03
 */
@Repository
public interface MovieMapper {

    /**
     * 插入电影
     * @return
     */
    Integer add(Movie movie);

    /**
     * 查询所有电影
     * @return
     */
    List<Movie> selectAll();

    /**
     *根据电影名称查询
     * @param movieName
     * @return
     */
    List<Movie> selectByName(@Param("movieName") String movieName, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 根据电影ID删除电影
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 更新电影
     * @param movie
     * @return
     */
    Integer update(Movie movie);

    /**
     * 返回所有电影的总数
     * @return
     */
    Integer count();

    /**
     * 返回用户所喜爱的所有电影
     * @param userPrefer
     * @return
     */
    List<Movie> selectPrefer(UserPrefer userPrefer);

    List<Movie> selectAllSortByScore();
    List<Movie> selectAllSortByNumOfPeople();
    Movie selectMovieById(@Param("id") Integer id);

}
