package com.movie.utils;

import java.util.List;

public class Page<T>{
    private Integer currentPage;
    private Integer totalPage;
    private List<T> list;

    public Page() {
    }

    public Page(Integer currentPage, Integer totalPage, List<T> list) {
        this.currentPage = currentPage;
        this.totalPage = totalPage;
        this.list = list;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Page{" +
                "currentPage=" + currentPage +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }

    static public Integer countPageNum(Integer num,Integer pageSize){
        return  (int) Math.ceil( num / (double) pageSize );
    }
}
