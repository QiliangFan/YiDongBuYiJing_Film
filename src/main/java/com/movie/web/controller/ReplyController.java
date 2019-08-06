package com.movie.web.controller;

import com.movie.biz.*;
import com.movie.dao.FilmReviewMapper;
import com.movie.domain.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ReplyController {
    @Autowired
    private ReplyService replyService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private UserService userService;
    @Autowired
    private FilmReviewService filmReviewService;
    @Autowired
    private FilmReviewMapper filmReviewMapper;
    @Autowired
    private HistoryService historyService;

    @RequestMapping("/GetAllReplyBy")
    private ModelAndView getAllReply(Integer filmReviewId){
        ModelAndView mv = new ModelAndView();
        List<Reply> replies = replyService.showRepliesByFilmReviewId(filmReviewId,1,10000000);
        List<User> users = new ArrayList<>();
        FilmReview filmReview = filmReviewMapper.selectFilmReviewById(filmReviewId);
        Movie movie = movieService.findMovieById(filmReview.getMovieId());
        for(int i = 0;i<replies.size();i++){
            User user = userService.findUserById(replies.get(i).getFilmReview().getUserId());
            users.add(user);
        }
        mv.addObject("movie",movie);
        mv.addObject("users",users);
        mv.addObject("replies",replies);
        mv.addObject("filmReviewId",filmReviewId);
        mv.setViewName("ReplyInfo");
        return mv;
    }

    @RequestMapping("/writeReply")
    public ModelAndView writeReply(String title, String content, Integer userId, Integer filmReviewId){
        FilmReview filmReview = filmReviewMapper.selectFilmReviewById(filmReviewId);
        ModelAndView mv = new ModelAndView();
        String msg;
        if(replyService.addReply(title,content,userId,filmReviewId)==true) {
            boolean x = historyService.add(new History("评论","1",userId,filmReview.getMovieId()));
            if(x==true)
                System.out.println("评价历史记录成功");
            mv.addObject("msg", "评论成功");
            System.out.println("评论成功");
        }
        else{
            msg = "评论失败";
            mv.addObject("msg",msg);
            System.out.println("评论失败");
        }
        mv.addObject("filmReviewId",filmReviewId);
        mv.setViewName("forward:GetAllReplyBy");
        return  mv;
    }

}
