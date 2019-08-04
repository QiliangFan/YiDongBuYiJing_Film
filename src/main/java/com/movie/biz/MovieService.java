package com.movie.biz;

import com.movie.domain.po.Movie;
import com.movie.utils.Page;

import com.movie.utils.SelectType;

import java.util.List;
import com.movie.utils.Select;

/**
 * @author hehe
 * @version 1.0
 * @date 2019/8/3
 */
public interface MovieService {
    /**
     * 查询
     * @param selectType
     * @param sortType
     * @param value
     * @param currentPage
     * @param pageSize
     * @return
     */
    Page<Movie> select(SelectType type, Object value, Integer currentPage, Integer pageSize);

    Page<Movie> select(Select.SelectType selectType, Object value, Select.SortType sortType, Select.OrderBy orderBy, Integer currentPage, Integer pageSize);


    /**
     * 增加电影
     * @param movie
     * @return
     */
    Boolean add(Movie movie);

    /**
     * 更新电影
     * @param movie
     * @return
     */
    Boolean update(Movie movie);

    /**
     * 删除电影
     * @param id
     * @return
     */
    Boolean delete(Integer id);

    List<Movie> findMovieByScore();
    List<Movie> findMovieByNumOfPeople();
    Movie findMovieById(Integer id);

}
