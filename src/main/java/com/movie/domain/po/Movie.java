package com.movie.domain.po;
public class Movie {
    private Integer id;
    private String movieName;
    private String releaseDate;
    private String country;
    private String screenWriter;
    private String movieKind;
    private String director;
    private double grade;
    private Integer numOfPeople;
    private Integer price;
    private String actor;
    private String description;
    private String img;



    public Movie(String movieName, String releaseDate, String country, String screenWriter, String movieKind, String director, double grade, Integer numOfPeople, Integer price, String actor, String description, String img) {
        this.movieName = movieName;
        this.releaseDate = releaseDate;
        this.country = country;
        this.screenWriter = screenWriter;
        this.movieKind = movieKind;
        this.director = director;
        this.grade = grade;
        this.numOfPeople = numOfPeople;
        this.price = price;
        this.actor = actor;
        this.description = description;
        this.img = img;
    }

    public Movie(Integer id, String movieName, String releaseDate, String country, String screenWriter, String movieKind, String director, double grade, Integer numOfPeople, Integer price, String actor, String description, String img) {
        this.id = id;
        this.movieName = movieName;
        this.releaseDate = releaseDate;
        this.country = country;
        this.screenWriter = screenWriter;
        this.movieKind = movieKind;
        this.director = director;
        this.grade = grade;
        this.numOfPeople = numOfPeople;
        this.price = price;
        this.actor = actor;
        this.description = description;
        this.img = img;
    }





    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getScreenWriter() {
        return screenWriter;
    }

    public void setScreenWriter(String screenWriter) {
        this.screenWriter = screenWriter;
    }

    public String getMovieKind() {
        return movieKind;
    }

    public void setMovieKind(String movieKind) {
        this.movieKind = movieKind;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public Integer getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(Integer numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", movieName='" + movieName + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", country='" + country + '\'' +
                ", screenWriter='" + screenWriter + '\'' +
                ", movieKind='" + movieKind + '\'' +
                ", director='" + director + '\'' +
                ", grade=" + grade +
                ", numOfPeople=" + numOfPeople +
                ", price=" + price +
                ", actor='" + actor + '\'' +
                ", description='" + description + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
