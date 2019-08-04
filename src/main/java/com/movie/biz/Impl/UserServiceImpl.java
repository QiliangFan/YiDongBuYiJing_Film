package com.movie.biz.Impl;

import com.movie.biz.UserService;
import com.movie.domain.po.User;
import com.movie.dao.*;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.stereotype.Component;
=======
>>>>>>> 3d4a2df8581f325c2f61070cf3657ec6ac227a4a
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

<<<<<<< HEAD
@Service("userService")
=======
@Service
>>>>>>> 3d4a2df8581f325c2f61070cf3657ec6ac227a4a
public class UserServiceImpl  implements UserService {
    public static String verifyCode=null;


    @Autowired
    UserMapper userMapper;

    HttpServletRequest request;

    @Override
    public boolean login(User user) {
        try {
            if (user != null && user.getUserName() != null) {
                User newuser = userMapper.selectByName(user.getUserName());
                if (newuser.getUserName().equals(user.getUserName())
                        && newuser.getPassword().equals(user.getPassword())) {
                    return true;
                } else {
                    return false;
                }
            } else
                return false;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean register(User user) {
        try{
            User newuser=userMapper.selectByName(user.getUserName());
            if(newuser!=null){
                return false;
            }else{
                int i=userMapper.add(user);
                if(i>0){
                    return true;
                }else{
                    return false;
                }
            }
        }catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean update(User user) {
        try {
            int i=userMapper.update(user);
            if(i>0){
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean verifyCode(String code) {
        if(code==null||code==""||verifyCode==null) return false;
        return code.equals(verifyCode);
    }

    @Override
    public User findUserById(Integer id) {
        User user = userMapper.selectById(id);
        return user;
    }

    @Override
    public String forgetPwd(String username) {
//        User user = userMapper.selectByName(username);
//        String email = user.getEmail();
        Properties properties=new Properties();
        properties.put("mail.smtp.host", "smtp.163.com");
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable","true");
        properties.setProperty("mail.debug", "true");
        Session session = Session.getInstance(properties);
        MimeMessage mimeMessage=new MimeMessage(session);
        try {
            Address fromAddr =  new InternetAddress("yidongbuyijing@163.com");
            mimeMessage.addHeader("X-Mailer","Microsoft Outlook Express 6.00.2900.2869");
            mimeMessage.setFrom(fromAddr);
            Address toAddr = new InternetAddress("1035847702@qq.com");
            mimeMessage.setRecipient(Message.RecipientType.TO,toAddr);
            mimeMessage.setSubject("移动不宜静");
            mimeMessage.setText("请在10分钟内输入验证字串,否则验证将失效.");
            Transport transport = session.getTransport();
            transport.connect("smtp.163.com", "yidongbuyijing@163.com", "FQLfql123456");
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
            System.out.println("close mail server");
        } catch (MessagingException e) {
            e.printStackTrace();
        }


        return "";
    }

    @Override
    public boolean uploadFile(MultipartFile file)  {
        if(file==null){
            return false;
        }
        String path = request.getRealPath(".");
        path+="/filesUpload/";
        File file1= new File(path+file.getOriginalFilename());
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), file1);

            //如果未生成文件,这有另一种实现,更为底层,容易生成文件
//            InputStream inputStream=file.getInputStream();
//            FileOutputStream fo=new FileOutputStream(file1);
//            byte[] bytes=new byte[1024];
//            while((inputStream.read(bytes))!=-1){
//                fo.write(bytes);
//            }
//            fo.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(path);
        return false;
    }

    @Override
    public List<User> findAll() {
        return userMapper.selectAll(0,100);
    }



    @Override
    public boolean delete(Integer userId) {
        if(userMapper.deleteById(userId)>=0) return true;
        else return false;
    }
}
