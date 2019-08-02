package com.movie.domain.po;

public class Reply {
    private Integer id;
    private String title;
    private String content;
    private String replyTime;
    private Integer userId;
    private Integer filmReviewId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFilmReviewId() {
        return filmReviewId;
    }

    public void setFilmReviewId(Integer filmReviewId) {
        this.filmReviewId = filmReviewId;
    }

    public Reply() {
    }

    public Reply(Integer id, String title, String content, String replyTime, Integer userId, Integer filmReviewId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.replyTime = replyTime;
        this.userId = userId;
        this.filmReviewId = filmReviewId;
    }

    public Reply(String title, String content, String replyTime, Integer userId, Integer filmReviewId) {
        this.title = title;
        this.content = content;
        this.replyTime = replyTime;
        this.userId = userId;
        this.filmReviewId = filmReviewId;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", replyTime='" + replyTime + '\'' +
                ", userId=" + userId +
                ", filmReviewId=" + filmReviewId +
                '}';
    }
}
