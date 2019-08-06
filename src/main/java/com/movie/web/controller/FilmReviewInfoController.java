package com.movie.web.controller;

import com.movie.biz.FilmReviewService;
import com.movie.biz.HistoryService;
import com.movie.biz.Impl.UserServiceImpl;
import com.movie.biz.MovieService;
import com.movie.biz.UserService;
import com.movie.domain.po.FilmReview;
import com.movie.domain.po.History;
import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FilmReviewInfoController {
    @Autowired
    private FilmReviewService filmReviewService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private UserService userService;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;
    @Autowired
    private HistoryService historyService;

    @RequestMapping("/findReviewByMovie")
    public ModelAndView findFilmReviewByMovie(Integer movieid ){
//        movie = movieService.findMovieById(100);
        ModelAndView mv = new ModelAndView();
        List<FilmReview> filmReviewsByMovie = new ArrayList<FilmReview>();
        filmReviewsByMovie = filmReviewService.findFilmReviewsByMovie(movieid,1,100000000);
        Movie moviesByMovie = movieService.findMovieById(movieid);
        List<User> usersByUser = new ArrayList<>();
        for(int i=0;i<filmReviewsByMovie.size();i++){
            User user = userService.findUserById(filmReviewsByMovie.get(i).getUserId());
            usersByUser.add(user);
        }
        mv.addObject("filmReviewsByMovie",filmReviewsByMovie);
        mv.addObject("moviesByMovie",moviesByMovie);
        mv.addObject("usersByUser",usersByUser);
        mv.setViewName("ReviewInfo");
        return mv;
    }

    @RequestMapping("/mytop")
    public String tomytop(){
        return "mytop";
    }

    @RequestMapping("/writeFilmReview")
    public ModelAndView writeFilmReview(FilmReview filmReview){
        ModelAndView mv = new ModelAndView();
        boolean a = filmReviewService.writeFilmReview(filmReview.getReview(),filmReview.getUserId(),filmReview.getMovieId());
        String msg;
        if(a==true){
            mv.addObject("filmReview",filmReview);
            mv.addObject("id",filmReview.getMovieId());

            msg = "发表影评成功";
            System.out.println("发表影评成功");
            boolean x = historyService.add(new History("写影评","1",filmReview.getUserId(),filmReview.getMovieId()));
            if(x==true)
                System.out.println("影评历史记录成功");
            mv.setViewName("forward:findMovieInfo");
        }
        else{
            msg = "发表影评失败";
            System.out.println("发表影评失败");
            mv.addObject("id",filmReview.getMovieId());
            mv.setViewName("forward:findMovieInfo");
        }
        mv.addObject("msg",msg);
        return mv;
    }
    @RequestMapping("/findMovieInfo")
    public ModelAndView findFilmReviewByMovie1(Integer id){
        if(id==null){
            id = (Integer)(request.getAttribute("id"));
        }
        ModelAndView mv = new ModelAndView();
        List<FilmReview> filmReviewsByMovie = new ArrayList<FilmReview>();
        filmReviewsByMovie = filmReviewService.findFilmReviewsByMovie(id,1,5);
        Movie moviesByMovie = new Movie();
        List<User> usersByUser = new ArrayList<>();
        moviesByMovie = movieService.findMovieById(id);
        for(int i=0;i<filmReviewsByMovie.size();i++){
            User user = userService.findUserById(filmReviewsByMovie.get(i).getUserId());
            usersByUser.add(user);
        }
        mv.addObject("filmReviewsByMovie",filmReviewsByMovie);
        mv.addObject("moviesByMovie",moviesByMovie);
        mv.addObject("usersByUser",usersByUser);
        mv.setViewName("MovieInfo");
        return mv;
    }
    @RequestMapping("/score")
    public ModelAndView score(Integer movieId,String scoreinput,Integer userid){
        ModelAndView mv = new ModelAndView();
        Movie movie = movieService.findMovieById(movieId);
        movie.setGrade(movie.getGrade()+Integer.valueOf(scoreinput));
        movie.setNumOfPeople(movie.getNumOfPeople()+1);
        boolean a = movieService.update(movie);
        String msg;
        if(a==true)
        {
            msg = "评分成功";
            boolean x = historyService.add(new History("评分","1",userid,movieId));
            if(x==true)
                System.out.println("评分历史记录成功");
        }else{
            msg="评分失败";
        }
        mv.addObject("msg",msg);
        mv.addObject("id",movieId);

        mv.setViewName("forward:findMovieInfo");
        return mv;
    }
}
