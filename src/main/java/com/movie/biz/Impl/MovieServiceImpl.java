package com.movie.biz.Impl;

import com.movie.biz.MovieService;
import com.movie.dao.MovieMapper;
import com.movie.domain.po.Movie;
import com.movie.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
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
    public Page<Movie> select(Select.SelectType selectType, Object value, Select.SortType sortType, Select.OrderBy orderBy, Integer currentPage, Integer pageSize) {
        Page<Movie> page = new Page<>();
        if (selectType != null && sortType != null && currentPage != null && pageSize != null) {
            //获取所有电影
            List<Movie> list = movieMapper.selectAll();

            //根据排序类型对list进行排序
            switch (sortType) {
                case Time:{
                    list.sort((o1, o2) -> {
                        if(orderBy == Select.OrderBy.ASC)
                        {
                            return o1.getReleaseDate().compareTo(o2.getReleaseDate());
                        }
                        else
                        {
                            return o2.getReleaseDate().compareTo(o1.getReleaseDate());
                        }
                    });
                    break;
                }
                case Grade:{
                    list.sort((o1, o2) -> {
                        if(orderBy == Select.OrderBy.ASC)
                        {
                            return Double.compare(o1.getGrade()/o1.getNumOfPeople(),o2.getGrade()/o2.getNumOfPeople());
                        }
                        else
                        {
                            return Double.compare(o2.getGrade()/o2.getNumOfPeople(),o1.getGrade()/o1.getNumOfPeople());
                        }
                    });
                    break;
                }
                case numOfPeople:{
                    list.sort((o1, o2) -> {
                        if(orderBy == Select.OrderBy.ASC)
                        {
                            return Integer.compare(o1.getNumOfPeople(),o2.getNumOfPeople());
                        }
                        else
                        {
                            return Double.compare(o2.getNumOfPeople(),o1.getNumOfPeople());
                        }
                    });
                    break;
                }
            }

            //根据不同的查找类型对list进行筛选
            List<Movie> temp = new ArrayList<>();
            for (Movie m :
                    list) {

                switch (selectType) {
                    case All: {
                        temp.add(m);
                        break;
                    }
                    case Keyword: {
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getMovieName().contains(v)) {
                                temp.add(m);
                            }
                        }
                        break;
                    }
                    case Country: {
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getCountry().contains(v)) {
                                temp.add(m);
                            }
                        }
                        break;
                    }
                    case MovieKind: {
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getMovieKind().contains(v)) {
                                temp.add(m);
                            }
                        }
                        break;
                    }
                    case Actor:{
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getActor().contains(v) ){
                                temp.add(m);
                            }
                        }
                        break;
                    }
                    case Director:{
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getDirector().contains(v)) {
                                temp.add(m);
                            }
                        }
                        break;
                    }
                    case ScreenWriter:{
                        String[] values = ((String) value).split(" ");
                        for (String v:
                                values) {
                            if (m.getScreenWriter().contains(v)) {
                                temp.add(m);
                            }
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
