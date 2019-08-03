package com.movie.biz.Impl;

import com.movie.biz.UserPreferService;
import com.movie.dao.MovieMapper;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import com.movie.domain.po.UserPrefer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 22:36
 */
@Service
public class UserPreferServiceImpl implements UserPreferService {

    @Autowired
    private UserPreferMapper userPreferMapper;

    @Autowired
    private MovieMapper movieMapper;
    @Override
    public List<Movie> getUserPrefer(User user) {
        return movieMapper.selectPrefer(userPreferMapper.selectByUserId(user.getId()));
    }

    @Override
    public List<UserPrefer> getAllPrefer(Integer currentPage,Integer limit) {
        Integer offset = (currentPage-1)*limit;
        return userPreferMapper.selectAll(offset,limit);
    }

    @Override
    public Integer deletePreferByUserId(Integer id) {
        return userPreferMapper.deleteByUserId(id);
    }

    @Override
    public Integer updatePrefer(UserPrefer userPrefer) {
        return userPreferMapper.update(userPrefer);
    }
}
