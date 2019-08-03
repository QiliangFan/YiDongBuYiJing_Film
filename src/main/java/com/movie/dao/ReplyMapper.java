package com.movie.dao;

import com.movie.domain.po.Reply;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zyr
 * @Date 2019/8/1 23:33
 **/
//author:zyr

@Repository
public interface ReplyMapper {

        public  int add(Reply reply);
        public List<Reply> selectByUserId(@Param("userId") Integer userId, @Param("offset") Integer offset, @Param("limit") Integer limit);
        public List<Reply> selectByFilmReviewId(@Param("filmReviewId") Integer filmReviewId, @Param("offset") Integer offset, @Param("limit") Integer limit);
        public int deleteById(Integer id);
        public int update(Reply reply);
        public int countByUserId(Integer userId);
        public int countByFilmReviewId(Integer filmReviewId);


}
