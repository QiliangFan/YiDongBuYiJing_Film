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
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping(value = {"/toUserInfo/historynext"})
    public String toUserInfoHistoryNext(@SessionAttribute(required = false) String userName) {
        try {
            Integer page = (Integer) request.getSession().getAttribute("page");

            User user = userMapper.selectByName(userName);  //测试使用
            List<Reply> myReply = replyMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myReply", myReply);
            request.setAttribute("pageMax", myReply.size());


            List<Message> message = messageMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myMessages", message);

            List<History> myHistory = historyService.selectByUserId2(user.getId());
            request.setAttribute("myHistory", myHistory);
            request.setAttribute("historyNum", myHistory.size());
            request.setAttribute("pageNum", (int) Math.ceil(myHistory.size() / 10.0));
            if (page == (int) Math.ceil(myHistory.size() / 10.0)) {
                page = 1;
            } else {
                page += 1;
            }

            UserPrefer myPrefer = userPreferMapper.selectByUserId(user.getId());
            request.setAttribute("myPrefer", myPrefer);

            request.getSession().setAttribute("page", page);
            System.out.println(page);
            return "userInfo";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = {"/toUserInfo/historypre"})
    public String toUserInfoHistoryPre(@SessionAttribute(required = false) String userName) {
        try {
            Integer page = (Integer) request.getSession().getAttribute("page");

            User user = userMapper.selectByName(userName);  //测试使用
            List<Reply> myReply = replyMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myReply", myReply);
            request.setAttribute("pageMax", myReply.size());

            List<Message> message = messageMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myMessages", message);

            List<History> myHistory = historyService.selectByUserId2(user.getId());
            request.setAttribute("myHistory", myHistory);
            request.setAttribute("historyNum", myHistory.size());
            request.setAttribute("pageNum", (int) Math.ceil(myHistory.size() / 10.0));
            if (page == 1) {
                page = (int) Math.ceil(myHistory.size() / 10.0);
            } else {
                page -= 1;
            }


            UserPrefer myPrefer = userPreferMapper.selectByUserId(user.getId());
            request.setAttribute("myPrefer", myPrefer);


            request.getSession().setAttribute("page", page);
            System.out.println(page);
            return "userInfo";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = {"/toUserInfo"})
    public String toUserInfoMain(@SessionAttribute(required = false) String  userName) {
        try {
            User user = userMapper.selectByName(userName);  //测试使用
//            User user = userMapper.selectById(userid);
            List<Reply> myReply = replyMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myReply", myReply);
            request.setAttribute("pageMax", myReply.size());

            List<Message> message = messageMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myMessages", message);

            List<History> myHistory = historyService.selectByUserId2(user.getId());
            request.setAttribute("myHistory", myHistory);
            request.setAttribute("historyNum", myHistory.size());

            UserPrefer myPrefer = userPreferMapper.selectByUserId(user.getId());
            request.setAttribute("myPrefer", myPrefer);
            request.setAttribute("pageNum", Math.ceil(myHistory.size() / 10.0));

            request.getSession().setAttribute("page", 1);
                return "userInfo";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = {"/history{page}p"})
    public String toUserInfo(@SessionAttribute(required = false) String userName, @PathVariable Integer page) {
        try {
            if (page == null) page = 1;
            User user = userMapper.selectByName(userName);  //测试使用
            List<Reply> myReply = replyMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myReply", myReply);
            request.setAttribute("pageMax", myReply.size());

            List<Message> message = messageMapper.selectByUserId(user.getId(), 0, 99999);
            request.setAttribute("myMessages", message);

            List<History> myHistory = historyService.selectByUserId2(user.getId());
            request.setAttribute("myHistory", myHistory);
            request.setAttribute("historyNum", myHistory.size());

            UserPrefer myPrefer = userPreferMapper.selectByUserId(user.getId());
            request.setAttribute("myPrefer", myPrefer);
            request.setAttribute("pageNum", Math.ceil(myHistory.size() / 10.0));

            request.getSession().setAttribute("page", page);
            System.out.println(page);
            return "userInfo";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

    @RequestMapping("/modifyUserInfo")
    public String modifyUserInfo(User user, MultipartFile headimage, ModelMap map) {

        try {
            System.out.println(user);
            try {
                String fileName = headimage.getOriginalFilename();
                if (fileName == null || fileName == "") {
                    throw new Exception();
                }
                String type = headimage.getContentType();
                if (!type.equals("image/jpeg") && !type.equals("image/png") && !type.equals("image/gif")) {
                    throw new Exception();
                }
                System.out.println(type);
                fileName = user.getUserName() + fileName;
                String path = request.getRealPath(".");
                path += "/filesUpload/";
                File file = new File(path + fileName);
                FileUtils.copyInputStreamToFile(headimage.getInputStream(), file);
                System.out.println(path + fileName);
                userMapper.update(new User(user.getId(),
                        user.getUserName(),
                        user.getPassword().toUpperCase(),
                        user.getEmail(),
                        user.getBirthday(),
                        user.getGender(),
                        user.getAuthority(),
                        "/Movies/filesUpload/" + fileName));
                map.put("modifyUserInfo", "success");
                return "redirect:/toUserInfo";

            } catch (Exception e) {
                User originuser = userMapper.selectByName(user.getUserName());

                userMapper.update(new User(user.getId(),
                        user.getUserName(),
                        user.getPassword().toUpperCase(),
                        user.getEmail(),
                        user.getBirthday(),
                        user.getGender(),
                        user.getAuthority(),
                        originuser.getImage()
                ));
                map.put("modifyUserInfo", "success");
                return "userInfo";
            }
        } catch (Exception e) {
            System.out.println("modifyUserInfo=>Exception");
        }
        map.put("modifyUserInfo", "fail");
        return "userInfo";
    }
}
