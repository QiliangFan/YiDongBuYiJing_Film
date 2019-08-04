package com.movie.web.controller;

import com.movie.biz.MovieService;
import com.movie.domain.po.Movie;
import com.movie.utils.Page;
import com.movie.utils.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@SessionAttributes(value ={"list","currentPage","totalPage"})
public class MovieDisplayController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/searchMovie",method = RequestMethod.POST)
    public void searchMovie(Integer pageSize, Integer currentPage, String selectType, String orderBy, String sortType , Object value, Model model) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Movie> page = movieService.select(Select.SelectType.valueOf(selectType),value,Select.SortType.valueOf(sortType),Select.OrderBy.valueOf(orderBy),currentPage,pageSize);

        if(page != null)
        {
            model.addAttribute("list",page.getList());
            model.addAttribute("currentPage",page.getCurrentPage());
            model.addAttribute("totalPage",page.getTotalPage());
        }
    }
}
