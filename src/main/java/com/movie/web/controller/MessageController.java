package com.movie.web.controller;

import com.movie.biz.HistoryService;
import com.movie.biz.MessageService;
import com.movie.domain.po.History;
import com.movie.domain.po.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;
    @RequestMapping("/writeMessage")
    public ModelAndView writeMessage(Message message){
        ModelAndView mv = new ModelAndView();
        String msg;
        if(messageService.addMessage(message)==1){
            //留言成功
            msg="留言成功";
        }
        else{
            //留言失败
            msg="留言失败";
        }
        mv.addObject("msg",msg);
        mv.setViewName("forward:welcome");
        return mv;
    }
}
