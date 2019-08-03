package com.movie.dao;

import com.movie.domain.po.History;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * @author hehe
 * @version 1.0
 * @date 2019/8/2
 */
@Repository
public interface HistoryMapper {

    /**
     * 插入历史
     * @param history
     * @return
     */
    Integer add(History history);

    /**
     * 获取全部历史
     * @param offset
     * @param limit
     * @return
     */
    List<History> selectAll(@Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 通过用户ID获取历史
     * @param userId
     * @return
     */
    List<History> selectByUserId(@Param("userId") Integer userId, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 通过电影ID获取历史
     * @param movieId
     * @param offset
     * @param limit
     * @return
     */
    List<History> selectByMovieId(@Param("movieId") Integer movieId, @Param("offset") Integer offset, @Param("limit") Integer limit);


    List<History> selectByUserId2(@Param("userId") Integer userId);
    /**
     * 通过id删除历史
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 更新历史
     * @param history
     * @return
     */
    Integer update(History history);

    /**
     * 获取历史数量
     * @return
     */
    Integer count();
}
