package com.movie.biz.Impl;

import com.movie.biz.FilmReviewService;
import com.movie.dao.FilmReviewMapper;
import com.movie.domain.po.FilmReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service("filmReviewService")
public class FilmReviewServiceImpl implements FilmReviewService {

    @Autowired
    private FilmReviewMapper filmReviewMapper;


    @Override
    public boolean writeFilmReview(String review, Integer userId, Integer movieId) {
        FilmReview filmReview = new FilmReview(0,""+new Timestamp(System.currentTimeMillis()),review,0,0,userId,movieId);
        int a = filmReviewMapper.add(filmReview);
        if(a==1){
            System.out.println("发表影评成功");
            return true;
        }else{
            System.out.println("发表影评失败");
            return false;
        }
    }

    @Override
    public List<FilmReview> findAllFilmReviews(Integer currentPage,Integer limit) {
        Integer offset = (currentPage - 1)*limit;
        List<FilmReview> filmReviews = filmReviewMapper.selectAll(offset,limit);
        return filmReviews;
    }

    @Override
    public List<FilmReview> findFilmReviewsByMovie(Integer movieId,Integer currentPage,Integer limit) {
        Integer offset = (currentPage - 1)*limit;
        List<FilmReview> filmReviews = filmReviewMapper.selectByMovieId(offset,limit,movieId);
        return filmReviews;
    }

    @Override
    public List<FilmReview> findFilmReviewsByUser(Integer userId,Integer currentPage,Integer limit) {
        Integer offset = (currentPage - 1)*limit;
        List<FilmReview> filmReviews = filmReviewMapper.selectByUserId(offset,limit,userId);
        return filmReviews;
    }

    @Override
    public boolean deleteFilmReviewById(Integer filmReviewId) {
        int a = filmReviewMapper.deleteById(filmReviewId);
        if(a==1){
            System.out.println("删除影评成功");
            return true;
        }
        System.out.println("删除影评失败");
        return false;
    }

    @Override
    public boolean updateFilmReviewById(FilmReview filmReview) {
        int a = filmReviewMapper.update(filmReview);
        if(a==1){
            return true;
        }
        return false;
    }

    @Override
    public Integer totalPage(Integer limit) {
        int totalCount = filmReviewMapper.count();
        Integer totalPage = (totalCount-1)/limit+1;
        return totalPage;
    }

    @Override
    public Integer totalPageByUser(Integer limit,Integer userId) {
        int totalCount = filmReviewMapper.countByUserId(userId);
        Integer totalPage = (totalCount-1)/limit+1;
        return totalPage;
    }

    @Override
    public Integer totalPageByMovie(Integer limit,Integer movieId) {
        int totalCount = filmReviewMapper.countByMovieId(movieId);
        Integer totalPage = (totalCount-1)/limit+1;
        return totalPage;
    }
}
