package com.movie.web.controller;

import com.movie.biz.FilmReviewService;
import com.movie.biz.MovieService;
import com.movie.biz.ReplyService;
import com.movie.biz.UserService;
import com.movie.domain.po.FilmReview;
import com.movie.domain.po.Movie;
import com.movie.domain.po.Reply;
import com.movie.domain.po.User;
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

    @RequestMapping("/GetAllReplyBy")
    private ModelAndView getAllReply(Integer filmReviewId){
        ModelAndView mv = new ModelAndView();
        List<Reply> replies = replyService.showRepliesByFilmReviewId(filmReviewId,1,10000000);
        List<User> users = new ArrayList<>();
        List<Movie>movies = new ArrayList<>();
        for(int i = 0;i<replies.size();i++){
            Movie movie = movieService.findMovieById(replies.get(i).getFilmReview().getMovieId());
            User user = userService.findUserById(replies.get(i).getFilmReview().getUserId());
            movies.add(movie);
            users.add(user);
        }
        mv.addObject("movie",movies.get(0));
        mv.addObject("users",users);
        mv.addObject("replies",replies);
        mv.setViewName("ReplyInfo");
        return mv;
    }

    @RequestMapping("/writeReply")
    public ModelAndView writeReply(String title, String content, Integer userId, Integer filmReviewId){
        ModelAndView mv = new ModelAndView();
        if(replyService.addReply(title,content,userId,filmReviewId)==true)
            System.out.println("写评论成功");
        else
            System.out.println("写评论失败");
        mv.setViewName("ReplyInfo");
        return  mv;
    }

}
