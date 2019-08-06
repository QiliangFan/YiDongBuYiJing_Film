package com.movie.web.controller;

import com.movie.biz.UserPreferService;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.UserPrefer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/4 0:14
 */
@Controller
public class UserPreferController {

    @Autowired
    private UserPreferMapper userPreferMapper;

    @RequestMapping(value = "/adduserprefer" , method = RequestMethod.POST)
    public ModelAndView AddUserPrefer(UserPrefer userPrefer,Integer userId) {
        ModelAndView mv = new ModelAndView();
        System.out.println(121212);
        if (userPrefer.getMovieType() == "") {
            userPrefer.setMovieType("%");
        }
        if (userPrefer.getActor() == "") {
            userPrefer.setActor("%");
        }
        if(userPrefer.getDirector()==""){
            userPrefer.setDirector("%");
        }
        userPrefer.setUserId(userId);
       userPreferMapper.add(userPrefer);
        mv.setViewName("forward:welcome");
        return mv;
    }
}
