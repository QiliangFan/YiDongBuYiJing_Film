package com.movie.dao;

import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/1 22:59
 */
@Repository
public interface UserMapper {
    /**
     * 添加User
     * @param user
     * @return
     */
    Integer add(User user);

    /**
     * 根据用户名查询用户
     * @param uname
     * @return
     */
    User selectByName(String uname);

    /**
     * 分页查询所有用户
     * @param offset
     * @param limit
     * @return
     */
    List<User> selectAll(@Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 根据用户ID删除用户
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    Integer update(User user);

    /**
     * 返回用户所喜爱的电影    需要根据用户名
     * @return
     */
    List<Movie> selectAllPreferMovie(User user);

    /**
     * 获取用户总量
     * @return
     */
    Integer count();
    User selectById(Integer id);
}
