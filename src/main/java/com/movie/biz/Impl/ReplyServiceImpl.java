package com.movie.biz.Impl;

import com.movie.biz.ReplyService;
import com.movie.dao.FilmReviewMapper;
import com.movie.dao.ReplyMapper;
import com.movie.domain.po.FilmReview;
import com.movie.domain.po.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author zyr
 * @Date 2019/8/2 23:20
 **/
@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;
    @Autowired
    private FilmReviewMapper filmReviewMapper;


    @Override
    public boolean addReply(String title,String content,Integer userId,Integer filmReviewId) {
        FilmReview filmReview=new FilmReview(filmReviewId,0,"","",0,0,0,0);
        //
        Date date=new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        Reply reply=new Reply(title,content,dateString,userId,filmReview);
        int a=replyMapper.add(reply);
        if(a>0) return true;
        else return false;
    }

    @Override
    public List<Reply> showRepliesByUserId(Integer userId,Integer currentPage ,Integer limit) {
      Integer offset=(currentPage-1)*limit;
        List<Reply> replies=replyMapper.selectByUserId(userId,offset,limit);
        return replies;
    }

    @Override
    public int totalPageForUserId(Integer userId,Integer limit) {
        int count=replyMapper.countByUserId(userId);
        Integer totalPage=(count-1)/limit+1;
        return totalPage;
    }

    @Override
    public List<Reply> showRepliesByFilmReviewId(Integer filmReviewId,Integer currentPage,Integer limit) {
        Integer offset=(currentPage-1)*limit;
        List<Reply> replies=replyMapper.selectByFilmReviewId(filmReviewId,offset,limit);
        return replies;
    }

    @Override
    public int totalPageForFilmReviewId(Integer filmReviewId,Integer limit) {

        int count= replyMapper.countByFilmReviewId(filmReviewId);
        int totalPage=count/limit;
        return count% totalPage ==0 ?totalPage:totalPage+1;

    }
    @Override
    public List<Reply> showAll() {
        return replyMapper.selectAll();
    }

    @Override
    public boolean delete(Integer replyId) {
        if(replyMapper.deleteById(replyId)>=0) return true;
        else return false;
    }
}
