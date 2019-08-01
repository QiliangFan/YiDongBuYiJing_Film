package com.movie.domain.po;

public class FilmReview {
    private Integer id;
    private Integer readNum;
    private String commentTime;
    private String review;
    private Integer goodNum;
    private Integer badNum;
    private Integer userId;
    private Integer movieId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Integer getBadNum() {
        return badNum;
    }

    public void setBadNum(Integer badNum) {
        this.badNum = badNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public FilmReview() {
    }

    public FilmReview(Integer id, Integer readNum, String commentTime, String review, Integer goodNum, Integer badNum, Integer userId, Integer movieId) {
        this.id = id;
        this.readNum = readNum;
        this.commentTime = commentTime;
        this.review = review;
        this.goodNum = goodNum;
        this.badNum = badNum;
        this.userId = userId;
        this.movieId = movieId;
    }

    public FilmReview(Integer readNum, String commentTime, String review, Integer goodNum, Integer badNum, Integer userId, Integer movieId) {
        this.readNum = readNum;
        this.commentTime = commentTime;
        this.review = review;
        this.goodNum = goodNum;
        this.badNum = badNum;
        this.userId = userId;
        this.movieId = movieId;
    }

    @Override
    public String toString() {
        return "Filmreview{" +
                "id=" + id +
                ", readNum=" + readNum +
                ", commentTime='" + commentTime + '\'' +
                ", review='" + review + '\'' +
                ", goodNum=" + goodNum +
                ", badNum=" + badNum +
                ", userId=" + userId +
                ", movieId=" + movieId +
                '}';
    }
}
