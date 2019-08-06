package com.movie.biz;

import com.movie.domain.po.FilmReview;

import java.util.List;

public interface FilmReviewService {
    boolean writeFilmReview(String review,Integer userId,Integer movieId);
    List<FilmReview> findAllFilmReviews(Integer currentPage,Integer limit);
    List<FilmReview> findFilmReviewsByMovie(Integer movieId,Integer currentPage,Integer limit);
    List<FilmReview> findFilmReviewsByUser(Integer userId,Integer currentPage,Integer limit);
    boolean deleteFilmReviewById(Integer filmReviewId);
    boolean updateFilmReviewById(FilmReview filmReview);
    Integer totalPage(Integer limit);
    Integer totalPageByUser(Integer limit,Integer userId);
    Integer totalPageByMovie(Integer limit,Integer movieId);
}
