package com.movie.web.controller;

import com.movie.biz.MovieService;
import com.movie.biz.UserPreferService;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.Movie;
import com.movie.domain.po.User;
import com.movie.domain.po.UserPrefer;
import com.movie.utils.Page;
import com.movie.utils.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MovieController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private UserPreferService userPreferService;

    @Autowired
    private UserPreferMapper userPreferMapper;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;

    @RequestMapping("/welcome")
    public ModelAndView welcome(@SessionAttribute(required = false) User user/*HttpServletRequest request*/,String msg){
//        String  msg = request.getParameter("msg");
        System.out.println(user);
        System.out.println("welcome"+msg);
        if(msg!=null){
            if(!msg.equals("1")&&!msg.equals("0")){
                msg = "3";
            }
        }
        else
            msg="3";

        ModelAndView mv = new ModelAndView();
        mv.addObject("msg",msg);
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
        if(user!=null&&user.getId() !=null)
        {
//            List<Movie> listPrefer = userPreferService.getUserPrefer(user);

            UserPrefer userPrefer = userPreferMapper.selectByUserId(user.getId());
            System.out.println(userPrefer);
            Page<Movie> page1 = movieService.select(Select.SelectType.Actor,userPrefer.getActor(),Select.SortType.Time,Select.OrderBy.DESC,1,18);
            Page<Movie> page2 = movieService.select(Select.SelectType.Director,userPrefer.getDirector(),Select.SortType.Time,Select.OrderBy.DESC,1,18);
            Page<Movie> page3 = movieService.select(Select.SelectType.MovieKind,userPrefer.getMovieType(),Select.SortType.Time,Select.OrderBy.DESC,1,18);

            List<Movie> listPrefer = new ArrayList<>();
            if(page1.getList()!=null && page1.getList().size()>0) {
                listPrefer.addAll(page1.getList());
            }
            if(page2.getList()!=null && page2.getList().size()>0) {
                listPrefer.addAll(page2.getList());
            }
            if(page3.getList()!=null && page3.getList().size()>0) {
                listPrefer.addAll(page3.getList());
            }

            listPrefer = listPrefer.stream().distinct().sorted((o1, o2) -> o2.getReleaseDate().compareTo(o1.getReleaseDate())
            ).collect(Collectors.toList());

            List<Movie> listShowPrefer =  new ArrayList<Movie>();
            for(int j = 0; j<listPrefer.size()&&j<10;j++){
                listShowPrefer.add(listPrefer.get(j));
            }
            mv.addObject("listShowPrefer",listShowPrefer);
        }
        HttpSession session = request.getSession(true);
        User user2 = (User)session.getAttribute("user");
        return mv;
    }

    @RequestMapping("/welcome1")
    public ModelAndView welcome1(/*HttpServletRequest request*/String msg){
//        String  msg = request.getParameter("msg");

        System.out.println("welcome"+msg);
        if(msg!=null){
            if(!msg.equals("1")&&!msg.equals("0")){
                msg = "3";
            }
        }
        else
            msg="3";

        ModelAndView mv = new ModelAndView();
        mv.addObject("msg",msg);
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

        //HttpSession session = request.getSession(true);
        //  User user2 = (User)session.getAttribute("user");
        return mv;
    }


}
