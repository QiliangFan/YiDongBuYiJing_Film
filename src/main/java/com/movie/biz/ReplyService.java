package com.movie.biz;

import com.movie.domain.po.Reply;

import java.util.List;

/**
 * @author zyr
 * @Date 2019/8/2 23:10
 **/
public interface ReplyService {
    //用户对影评进行回复
    public boolean addReply(String title,String content,Integer userId,Integer filmReviewId);
//    用户中心：展示某用户的回复记录 (分页）
    public List<Reply>showRepliesByUserId(Integer userId,Integer currentPage,Integer limit);
    //判断显示页数（按用户查找）
    public int totalPageForUserId(Integer userId,Integer limit);
    //按影评进行查找
    public List<Reply>showRepliesByFilmReviewId(Integer filmReviewId,Integer currentPage,Integer limit);
    //判断显示页数（按影评查找）
    public int  totalPageForFilmReviewId(Integer filmReviewId,Integer limit);

}
