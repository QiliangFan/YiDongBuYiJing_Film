package com.movie.biz;

import com.movie.domain.po.History;

import java.util.List;

public interface HistoryService {

    List<History> selectByUserId(Integer id, int offset, int limit);

    boolean deleteById(Integer id);

    List<History> showAll(int offset, int limit);
}
