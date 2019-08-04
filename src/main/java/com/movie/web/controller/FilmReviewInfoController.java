package com.movie.web.controller;

import com.movie.biz.FilmReviewService;
import com.movie.biz.Impl.UserServiceImpl;
import com.movie.biz.MovieService;
import com.movie.biz.UserService;
import com.movie.domain.po.FilmReview;
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

    @RequestMapping("/findReviewByMovie")
    public ModelAndView findFilmReviewByMovie(Movie movie){
        movie = movieService.findMovieById(100);
        ModelAndView mv = new ModelAndView();
        List<FilmReview> filmReviewsByMovie = new ArrayList<FilmReview>();
        filmReviewsByMovie = filmReviewService.findFilmReviewsByMovie(movie.getId(),1,100000000);
        Movie moviesByMovie = new Movie();
        List<User> usersByUser = new ArrayList<>();
        for(int i=0;i<filmReviewsByMovie.size();i++){
            Movie movie1 = movieService.findMovieById(filmReviewsByMovie.get(i).getMovieId());
            moviesByMovie = movie1;
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
        if(a==true){
            System.out.println("发表影评成功");
            mv.setViewName("FilmReviewInfo");
        }
        else{
            System.out.println("发表影评失败");
            mv.setViewName("FilmReviewInfo");
        }
        return mv;
    }

}
