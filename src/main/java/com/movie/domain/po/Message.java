package com.movie.domain.po;
/*
 * Created by sxj on 2019/8/02.
 * */
public class Message {
    private Integer id;
    private String content;
    private Integer userId;

    public Message(String content, Integer userId) {
        this.content = content;
        this.userId = userId;
    }

    public Message(Integer id, String content, Integer userId) {
        this.id = id;
        this.content = content;
        this.userId = userId;
    }

    public Message() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", userId=" + userId +
                '}';
    }
}
