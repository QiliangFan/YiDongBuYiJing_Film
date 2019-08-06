//author:zyr
package com.movie.domain.po;

public class Reply {
    private Integer id;
    private String title;
    private String content;
    private String replyTime;
    private Integer userId;
    private FilmReview filmReview;

    public FilmReview getFilmReview() {
        return filmReview;
    }

    public void setFilmReview(FilmReview filmReview) {
        this.filmReview = filmReview;
    }


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


    public Reply() {
    }

    public Reply(Integer id, String title, String content, String replyTime, Integer userId, FilmReview filmReview) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.replyTime = replyTime;
        this.userId = userId;
        this.filmReview = filmReview;
    }

    public Reply(String title, String content, String replyTime, Integer userId, FilmReview filmReview) {
        this.title = title;
        this.content = content;
        this.replyTime = replyTime;
        this.userId = userId;
        this.filmReview = filmReview;
    }

    public Reply(String title, String content, String replyTime, Integer userId) {
        this.title = title;
        this.content = content;
        this.replyTime = replyTime;
        this.userId = userId;
    }
}
