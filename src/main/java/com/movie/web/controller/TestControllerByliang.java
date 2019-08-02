package com.movie.web.controller;

import com.movie.biz.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TestControllerByliang {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/test")
    public String test(){
        userService.forgetPwd("");
        return "redirect:/";
    }
}
