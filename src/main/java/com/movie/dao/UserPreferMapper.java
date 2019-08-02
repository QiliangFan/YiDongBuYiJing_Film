package com.movie.dao;

import com.movie.domain.po.UserPrefer;
import org.springframework.stereotype.Repository;
/*
 * Created by sxj on 2019/8/02.
 * */
@Repository
public interface UserPreferMapper {
    int add(UserPrefer userPrefer);
    UserPrefer selectByUserId(Integer userId);
    int deleteByUserId(Integer userId);
    int update(UserPrefer userPrefer);
    int count();
}
