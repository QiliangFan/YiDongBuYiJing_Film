package com.movie.domain.po;

//import java.sql.Blob;

/*
 * Created by sxj on 2019/8/02.
 * */

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/1 21:43
 */
public class User {
    private Integer id;
    private String userName;
    private String password;
    private String email;
    private String birthday;
    private String gender;
    private String authority;
    private byte[] image;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", birthday='" + birthday + '\'' +
                ", gender='" + gender + '\'' +
                ", authority='" + authority + '\'' +
                ", image='" + image + '\'' +
                '}';
    }



    public User(String userName, String password, String email, String birthday, String gender, String authority, byte[] image) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.birthday = birthday;
        this.gender = gender;
        this.authority = authority;
        this.image = image;
    }

    public User(Integer id, String userName, String password, String email, String birthday, String gender, String authority, byte[] image) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.birthday = birthday;
        this.gender = gender;
        this.authority = authority;
        this.image = image;
    }

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public byte[] getImage() {
        return image;
    }


    public void setImage(byte[] image) {
        this.image = image;
    }
}