package com.movie.domain.po;
public class History {
    private Integer id;
    private String event;
    private String time;
    private Integer userId;
    private  Integer movieId;

    private Movie movie;

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public History() {
    }

    public History(Integer id, String event, String time, Integer userId, Integer movieId) {
        this.id = id;
        this.event = event;
        this.time = time;
        this.userId = userId;
        this.movieId = movieId;
    }

    public History(String event, String time, Integer userId, Integer movieId) {
        this.event = event;
        this.time = time;
        this.userId = userId;
        this.movieId = movieId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    @Override
    public String toString() {
        return "History{" +
                "id=" + id +
                ", event='" + event + '\'' +
                ", time='" + time + '\'' +
                ", userId=" + userId +
                ", movieId=" + movieId +
                '}';
    }
}
