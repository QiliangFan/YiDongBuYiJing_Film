package com.movie.web.controller;

import com.movie.biz.Impl.UserServiceImpl;
import com.movie.biz.UserService;
import com.movie.dao.ReplyMapper;
import com.movie.dao.UserMapper;
import com.movie.dao.UserPreferMapper;
import com.movie.domain.po.Reply;
import com.movie.domain.po.User;
import com.movie.domain.po.UserPrefer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.json.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;


/**
 * @class created by liang
 * 为了异步获取数据
 */
@RestController
public class RestfulController {
    @Autowired
    UserMapper userMapper;

    @Autowired
    ReplyMapper replyMapper;

    @Autowired
    HttpServletRequest request;

    @Autowired
    UserPreferMapper userPreferMapper;



    @RequestMapping("/getUserData")
    public void getUserData(@SessionAttribute(required = false) String userName ,HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
//        request.getSession().setAttribute("userName", "12");
//        userName="12";
        try {
            if (userName == null) return;
            else{
                User user=userMapper.selectByName(userName);
                JSONObject jsonObject = new JSONObject(user);
                PrintWriter out = response.getWriter();
                out.print(jsonObject.toString());
//                return jsonObject.toString();
            }
        }catch (Exception e) {
//            return null;
        }
    }

    @RequestMapping("/getMyReply")
    public String getMyReply(@SessionAttribute(required = false) String userName ){
//        request.getSession().setAttribute("userName", "12");
//        userName="12";
        try {
               BufferedReader bf = new BufferedReader(new InputStreamReader(request.getInputStream()));
               String temp=null;
               StringBuilder sb=new StringBuilder();
               while((temp=bf.readLine())!=null){
                   sb.append(temp);
               }
               JSONObject jo=new JSONObject(sb.toString());
               Integer offset=jo.getInt("offset");
                Integer limit = jo.getInt("limit");
                if(offset!=null&&limit!=null&&userName!=null) {
                    User user = userMapper.selectByName(userName);
                    Integer userid = user.getId();
                    if (userid != null) {
                        List<Reply> myReply = replyMapper.selectByUserId(userid, 0, 99999);
                        request.getSession().setAttribute("pageNum", Math.ceil(myReply.size() / 5.0));
                        myReply = replyMapper.selectByUserId(userid, offset, limit);
                        JSONArray ja = new JSONArray(myReply);
                        request.getSession().setAttribute("myReply", myReply);
//                        System.out.println(ja);
                        return ja.toString();
                    }
                }
        }catch (Exception e) {
            return null;
        }
        return null;
    }

    @RequestMapping("/getPrefer")
    public void getPrefer(@SessionAttribute(required = false) String userName,HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
//        request.getSession().setAttribute("userName", "12");
//        userName = "12";
        try {
            User user = userMapper.selectByName(userName);
            UserPrefer userPrefer=userPreferMapper.selectByUserId(user.getId());
            JSONObject jo = new JSONObject(userPrefer);
            String result = jo.toString();
            result = new String(result.getBytes("utf-8"),"utf-8");
            PrintWriter out= response.getWriter();
            out.print(result);
//            return result;
        }catch (Exception e){
            e.printStackTrace();
        }
//        return null;
    }


    @RequestMapping("/updatePrefer")
    public void updatePrefer(@SessionAttribute(required = false)String userName,HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
//        userName="12";
        User user=userMapper.selectByName(userName);
        try {
            request.setCharacterEncoding("utf-8");
            User user1=userMapper.selectByName(userName);
            BufferedReader bf=new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8"));
            String temp=null;
            StringBuilder sb=new StringBuilder();
            while((temp=bf.readLine())!=null){
                sb.append(temp);
            }
            JSONObject jo = new JSONObject(sb.toString());
            int id=jo.getInt("id");
            String director = jo.getString("director");
            String actor = jo.getString("actor");
            String movieType = jo.getString("movieType");

            userPreferMapper.update(new UserPrefer(
                id,movieType,director,actor,user1.getId()
            ));
            PrintWriter out = response.getWriter();
            out.print(jo.toString());
//            return jo.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        return null;
    }
}
