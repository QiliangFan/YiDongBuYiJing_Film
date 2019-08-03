package com.movie.web.controller;

import com.movie.biz.MovieService;
import com.movie.domain.po.Movie;
import com.movie.utils.Page;
import com.movie.utils.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MovieDisplayController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/searchMovie",method = RequestMethod.POST)
    public @ResponseBody
    HashMap<String, Object> searchMovie(Integer pageSize,Integer currentPage,String selectType, String orderBy,String sortType ,Object value) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Movie> page = movieService.select(Select.SelectType.valueOf(selectType),value,Select.SortType.valueOf(sortType),Select.OrderBy.valueOf(orderBy),currentPage,pageSize);

        if(page != null)
        {
            map.put("code",0);
            map.put("page",page);
        }else{
            map.put("code",1);
        }

        return map;
    }
}
