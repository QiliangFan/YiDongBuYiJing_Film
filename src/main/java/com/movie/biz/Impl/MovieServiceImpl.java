package com.movie.biz.Impl;

import com.movie.biz.MovieService;
import com.movie.dao.MovieMapper;
import com.movie.domain.po.Movie;
import com.movie.utils.Page;
import com.movie.utils.SelectType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
/**
 * @author hehe
 * @version 1.0
 * @date 2019/8/3
 */
@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieMapper movieMapper;

    @Override
    public Page<Movie> select(SelectType type, Object value, Integer currentPage, Integer pageSize) {
        Page<Movie> page = new Page<>();
        if (type != null && currentPage != null && pageSize != null) {
            //获取所有电影
            List<Movie> list = movieMapper.selectAll();

            //根据不同的查找类型对list进行筛选
            List<Movie> temp = new ArrayList<>();
            for (Movie m :
                    list) {

                switch (type) {
                    case All: {
                        temp.add(m);
                        break;
                    }
                    case Keyword: {
                        if (m.getMovieName().contains((String) value)) {
                            temp.add(m);
                        }
                        break;
                    }
                    case Country: {
                        if (m.getCountry().contains((String) value)) {
                            temp.add(m);
                        }
                        break;
                    }
                    case MovieKind: {
                        if (m.getMovieKind().contains((String) value)) {
                            temp.add(m);
                        }
                        break;
                    }
                }
            }
            list = temp;

            //分页
            page.setCurrentPage(currentPage);
            page.setTotalPage(Page.countPageNum(list.size(), pageSize));
            if (currentPage != page.getTotalPage()) {
                page.setList(list.subList(pageSize * (currentPage - 1), pageSize * currentPage));
            } else {
                page.setList(list.subList(pageSize * (currentPage - 1), list.size()));
            }

        }
        return page;
    }

    @Override
    public Boolean add(Movie movie) {
        return movieMapper.add(movie) == 1;
    }

    @Override
    public Boolean update(Movie movie) {
        return movieMapper.update(movie) == 1;
    }

    @Override
    public Boolean delete(Integer id) {
        return movieMapper.deleteById(id) == 1;
    }
}
