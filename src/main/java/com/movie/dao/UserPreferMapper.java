package com.movie.dao;

import com.movie.domain.po.UserPrefer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 * Created by sxj on 2019/8/02.
 * */
@Repository
public interface UserPreferMapper {
    int add(UserPrefer userPrefer);
    UserPrefer selectByUserId(Integer userId);
    List<UserPrefer> selectAll(@Param("offset") Integer offset, @Param("limit") Integer limit);
    int deleteByUserId(Integer userId);
    int update(UserPrefer userPrefer);
    int count();
}
