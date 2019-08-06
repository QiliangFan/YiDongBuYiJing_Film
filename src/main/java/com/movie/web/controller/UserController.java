package com.movie.web.controller;

import com.movie.biz.UserService;
import com.movie.dao.UserMapper;
import com.movie.domain.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/3 11:53
 */
@Controller
@SessionAttributes(value={"user"})
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录
     * @param user
     * @param VerifyCode
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(User user, String VerifyCode, String authority,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String verifycode = (String)request.getSession().getAttribute("vCode");
        if(verifycode.equalsIgnoreCase(VerifyCode)){
            if(userService.login(user)){
                User user1 = userMapper.selectByName(user.getUserName());
                mv.addObject("msg","登陆成功");
                request.getSession().setAttribute("user",user1);
                request.getSession().setAttribute("userName",user.getUserName());
                request.getSession().setAttribute("userid",user.getId());
                mv.addObject("user",user1);
                if(user1.getAuthority().equals(authority)&&authority.equals("1")){
                    mv.setViewName("redirect:manager");//这里跳转到管理员端
                }else{
                    mv.setViewName("redirect:welcome");
                }
            }else{
                mv.addObject("msg","用户名或密码错误");
                mv.setViewName("admin");
            }
        }else{
            mv.addObject("msg","验证码错误");
            mv.setViewName("admin");
        }
        return mv;
    }

    /**
     * 注册
     * @param user
     * @param VerifyCode
     * @return
     */
    @RequestMapping("/register")
    public ModelAndView register(User user,String VerifyCode,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String verifycode = (String)request.getSession().getAttribute("vCode");
        if(verifycode.equalsIgnoreCase(VerifyCode)){
            if(userService.register(user)){
                User user1 = userMapper.selectByName(user.getUserName());
                mv.addObject("msg","注册成功");
                request.getSession().setAttribute("user",user1);
                request.getSession().setAttribute("userName",user.getUserName());
                request.getSession().setAttribute("userid",user.getId());
                mv.setViewName("prefer");
            }else{
                mv.addObject("msg","注册失败");
                mv.setViewName("register");
            }
        }else{
            mv.addObject("msg","验证码错误");
            mv.setViewName("register");
        }
        return mv;
    }

    @RequestMapping("/jump")
    public String  jump(){
        return "admin" ;
    }

    @RequestMapping("/jump2")
    public String jump2(){
        return "register" ;
    }

    /**
     * Controller用来跳转到登陆成功后的主页面并且改变地址栏参数
     * @return
     */


    @RequestMapping("/findpwdPage")
    public String findpwdPage(){
        return "findpwd";
    }

    @RequestMapping("/findpwd")
    public ModelAndView findpwd(String userName,String password,String confirmpassword,String VerifyCode){
        ModelAndView mv = new ModelAndView();
        if(userService.verifyCode(VerifyCode)){
            if(!password.equals(confirmpassword)){
                mv.addObject("msg","两次输入密码不同");
                mv.setViewName("findpwd2");
            }else{
                User theUser=userMapper.selectByName(userName);
                theUser.setPassword((password));
                userService.update(theUser);
                mv.setViewName("forward:welcome");
            }
        }else{
            mv.setViewName("forward:welcome");
        }
        return mv;
    }

    @RequestMapping("/getVerificode")
    public ModelAndView getVerifyCode(String userName){
        ModelAndView mv = new ModelAndView();
        if(userName==null){
            mv.setViewName("redirect:welcome");
        }else{
            userService.forgetPwd(userName);
            mv.setViewName("findpwd2");
        }
        return mv;
    }
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("userName");
        request.getSession().removeAttribute("userid");
        mv.addObject("user",null);
        mv.setViewName("redirect:welcome");
        return mv;
    }
}