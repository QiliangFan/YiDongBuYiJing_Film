package com.movie.biz;

import com.movie.domain.po.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface UserService {
    /*返回true,登陆成功
    *返回false,密码验证失败
     */
    boolean login(User user);

    //返回true:注册成功
    //返回false:数据库中已有该用户
    boolean register(User user);

    /*返回false表明后台出现异常,应当进行下一步处理
    **
     */
    boolean update(User user);

    boolean uploadFile(MultipartFile file);


    /*
    * 根据username 获取邮箱进行验证,, 并与用户输入的邮箱验证码对比
    *
     */
    String forgetPwd(String username);


    /*
    ** 与用户输入邮箱验证码进行对比
     */
    boolean verifyCode(String code);

    User findUserById(Integer id);
    List<User> findAll();
    boolean add(User user);
    boolean delete(Integer userId);
}
