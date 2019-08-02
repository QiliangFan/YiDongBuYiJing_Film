package com.movie.biz;

import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import com.movie.domain.po.UserPrefer;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 22:42
 */
public interface UserPreferService {

    /**
     * 推荐用户喜好
     * @return
     */
    List<Movie> getUserPrefer(User user);

    /**
     * 查看所有用户偏好
     * @return
     */
    List<UserPrefer> getAllPrefer(Integer currentPage,Integer limit);

    /**
     * 删除个人喜好
     * @param id
     * @return
     */
    Integer deletePreferByUserId(Integer id);

    /**
     * 修改个人喜好
     * @param userPrefer
     * @return
     */
    Integer updatePrefer(UserPrefer userPrefer);
}
