package com.movie.web.controller;

import com.movie.biz.Impl.HistoryServiceImpl;
import com.movie.biz.Impl.UserPreferServiceImpl;
import com.movie.biz.Impl.UserServiceImpl;
import com.movie.dao.MessageMapper;
import com.movie.dao.ReplyMapper;
import com.movie.dao.UserMapper;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class UserInfoController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ReplyMapper replyMapper;

    @Autowired
    MessageMapper messageMapper;

    @Autowired
    UserPreferMapper userPreferMapper;

    @Autowired
    HistoryServiceImpl historyService;

    @RequestMapping("/toUserInfo")
    public String toUserInfo(@SessionAttribute(required = false) String userName){
        try {
            User user = userMapper.selectByName("12");  //测试使用
            List<Reply> myReply = replyMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myReply",myReply);
            request.setAttribute("pageMax", myReply.size());

            List<Message> message= messageMapper.selectByUserId(user.getId(), 0,99999);
            request.setAttribute("myMessages", message);

            List<History> myHistory = historyService.selectByUserId2(user.getId());
            request.setAttribute("myHistory", myHistory);

            UserPrefer myPrefer = userPreferMapper.selectByUserId(user.getId());
            request.setAttribute("myPrefer", myPrefer);

            return "userInfo";
        }catch (Exception e){
            return "redirect:/";
        }
    }

    @RequestMapping("/modifyUserInfo")
    public String modifyUserInfo(User user, MultipartFile headimage, ModelMap map){
        try {
            System.out.println(user);
            try {
                String fileName = headimage.getOriginalFilename();
                fileName =user.getUserName()+fileName;
                String path = request.getRealPath(".");
                path += "/filesUpload/";
                File file = new File(path + fileName);
                FileUtils.copyInputStreamToFile(headimage.getInputStream(), file);
                System.out.println(path + fileName);
                userMapper.update(new User(user.getId(),
                        user.getUserName(),
                        user.getPassword(),
                        user.getEmail(),
                        user.getBirthday(),
                        user.getGender(),
                        user.getAuthority(),
                        "/Movies/filesUpload/" + fileName));
                map.put("modifyUserInfo", "success");
                return "userInfo";

            }catch (Exception e) {
                User originuser=userMapper.selectByName(user.getUserName());

                userMapper.update(new User(user.getId(),
                        user.getUserName(),
                        user.getPassword(),
                        user.getEmail(),
                        user.getBirthday(),
                        user.getGender(),
                        user.getAuthority(),
                        originuser.getImage()
                        ));
                map.put("modifyUserInfo", "success");
                return "userInfo";
            }
        }catch (Exception e){
            System.out.println("modifyUserInfo=>Exception");
            e.printStackTrace();
        }
        map.put("modifyUserInfo","fail");
        return "userInfo";
    }
}
