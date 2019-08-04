package com.movie.web.controller;

import com.movie.biz.MovieService;
import com.movie.biz.UserPreferService;
import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
@Controller
public class MovieController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private UserPreferService userPreferService;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;

    @RequestMapping("/welcome")
    public ModelAndView welcome(User user){
        ModelAndView mv = new ModelAndView();
        List<Movie> listScore = movieService.findMovieByScore();
        List<Movie>listShowScore = new ArrayList<Movie>();
        //首页展示10部电影
        for(int i =0;i<listScore.size()&&i<10;i++){
            listShowScore.add(listScore.get(i));
        }
        List<Movie> listNumOfPeople = movieService.findMovieByNumOfPeople();
        List<Movie> listShowNumOfPeople =  new ArrayList<Movie>();
        for(int j = 0; j<listNumOfPeople.size()&&j<10;j++){
            listShowNumOfPeople.add(listNumOfPeople.get(j));
        }
        mv.addObject("listShowScore",listShowScore);
        mv.addObject("listShowNumOfPeople",listShowNumOfPeople);
        mv.setViewName("forward:main.jsp");
        if(user.getId() !=null&&user.getUserName()!=null)
        {
            List<Movie> listPrefer = userPreferService.getUserPrefer(user);
            List<Movie> listShowPrefer =  new ArrayList<Movie>();
            for(int j = 0; j<listPrefer.size()&&j<10;j++){
                listShowPrefer.add(listPrefer.get(j));
            }
            mv.addObject("listShowPrefer",listShowPrefer);
        }
        return mv;
    }
}
