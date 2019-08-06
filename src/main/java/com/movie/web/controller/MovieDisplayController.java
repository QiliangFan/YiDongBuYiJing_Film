package com.movie.web.controller;

import com.movie.biz.MovieService;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.Movie;
import com.movie.domain.po.UserPrefer;
import com.movie.utils.Page;
import com.movie.utils.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@SessionAttributes(value ={"list","currentPage","totalPage","orderBy","selectType","sortType","value","userid"})
public class MovieDisplayController {
    @Autowired
    private MovieService movieService;

    @Autowired
    private UserPreferMapper userPreferMapper;

//    @RequestMapping(value = "/searchMovie",method = RequestMethod.POST)
//    public @ResponseBody HashMap<String, Object> searchMovie(Integer pageSize, Integer currentPage, String selectType, String orderBy, String sortType , Object value, HttpServletRequest request) {
//        HashMap<String, Object> map = new HashMap<>();
//        Page<Movie> page = movieService.select(Select.SelectType.valueOf(selectType),value,Select.SortType.valueOf(sortType),Select.OrderBy.valueOf(orderBy),currentPage,pageSize);
//
//        System.out.println(page.getCurrentPage());
//        System.out.println(page.getTotalPage());
//
//        request.setAttribute("list",page.getList());
//        request.setAttribute("currentPage",page.getCurrentPage());
//        request.setAttribute("totalPage",page.getTotalPage());
//
//        return map;
//    }

    @RequestMapping("/recommend")
    public ModelAndView recommend(Integer currentPage,Integer userid,HttpSession httpSession){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("movielist");

        UserPrefer userPrefer = userPreferMapper.selectByUserId(userid);

        Page<Movie> page1 = movieService.select(Select.SelectType.Actor,userPrefer.getActor(),Select.SortType.Time,Select.OrderBy.DESC,currentPage,200);

        Page<Movie> page2 = movieService.select(Select.SelectType.Director,userPrefer.getDirector(),Select.SortType.Time,Select.OrderBy.DESC,currentPage,200);

        Page<Movie> page3 = movieService.select(Select.SelectType.MovieKind,userPrefer.getMovieType(),Select.SortType.Time,Select.OrderBy.DESC,currentPage,200);

        List<Movie> list = new ArrayList<>();

        if(page1.getList()!=null && page1.getList().size()>0) {
            list.addAll(page1.getList());
        }
        if(page2.getList()!=null && page2.getList().size()>0) {
            list.addAll(page2.getList());
        }
        if(page3.getList()!=null && page3.getList().size()>0) {
            list.addAll(page3.getList());
        }

        list = list.stream().distinct().sorted((o1, o2) -> o2.getReleaseDate().compareTo(o1.getReleaseDate())
        ).collect(Collectors.toList());




        System.out.println(list.size());


        mv.addObject("list",list);
        return mv;
    }


    @RequestMapping(value = "/searchMovies",method = RequestMethod.GET)
    public ModelAndView init(String selectType,String orderBy,String sortType,String value){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("movielist2");
        mv.addObject("currentPage",1);
        Page<Movie> page = movieService.select(Select.SelectType.valueOf(selectType),value,Select.SortType.valueOf(sortType),Select.OrderBy.valueOf(orderBy),1,18);
        mv.addObject("totalPage",page.getTotalPage());
        mv.addObject("orderBy",orderBy);
        mv.addObject("list",page.getList());
        mv.addObject("selectType",selectType);
        mv.addObject("sortType",sortType);
        mv.addObject("value",value);

        return mv;
    }

    @RequestMapping(value = "/searchMovie",method = RequestMethod.GET)
    public ModelAndView searchMovie(Integer pageSize, Integer currentPage, String selectType, String orderBy, String sortType , String value) {
        ModelAndView mv = new ModelAndView();
        Page<Movie> page = movieService.select(Select.SelectType.valueOf(selectType),value,Select.SortType.valueOf(sortType),Select.OrderBy.valueOf(orderBy),currentPage,pageSize);

        mv.setViewName("movielist2");
        mv.addObject("list",page.getList());
        mv.addObject("currentPage",page.getCurrentPage());
        mv.addObject("totalPage",page.getTotalPage());
        return mv;
    }
}
