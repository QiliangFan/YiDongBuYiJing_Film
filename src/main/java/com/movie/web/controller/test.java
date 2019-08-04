package com.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(value ={"currentPage","totalPage","orderBy","selectType","sortType","value"})
public class test {

        @RequestMapping("/jump")
        public String jump(Model model){
            model.addAttribute("currentPage",1);
            model.addAttribute("totalPage",27);
            model.addAttribute("orderBy","ASC");
            model.addAttribute("selectType","All");
            model.addAttribute("sortType","Time");
            model.addAttribute("value","");
            return "movielist2" ;
        }


}
