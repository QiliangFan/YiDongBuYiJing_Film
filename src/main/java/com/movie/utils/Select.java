package com.movie.utils;

public interface Select {
    enum SelectType{
        All,Keyword,Country,MovieKind,Actor,Director,ScreenWriter
    };
    enum OrderBy{
        ASC,DESC
    };
    enum SortType{
        Time,Grade,numOfPeople
    };
}
