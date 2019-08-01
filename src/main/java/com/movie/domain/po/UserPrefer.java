package com.movie.domain.po;

public class UserPrefer {
    private Integer id;
    private String movieType;
    private String director;
    private String actor;
    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public UserPrefer() {
    }

    public UserPrefer(Integer id, String movieType, String director, String actor, Integer userId) {
        this.id = id;
        this.movieType = movieType;
        this.director = director;
        this.actor = actor;
        this.userId = userId;
    }

    public UserPrefer(String movieType, String director, String actor, Integer userId) {
        this.movieType = movieType;
        this.director = director;
        this.actor = actor;
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Userprefer{" +
                "id=" + id +
                ", movieType='" + movieType + '\'' +
                ", director='" + director + '\'' +
                ", actor='" + actor + '\'' +
                ", userId=" + userId +
                '}';
    }
}
