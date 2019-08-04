package com.movie.biz;

import com.movie.domain.po.History;

import java.util.List;

public interface HistoryService {

    List<History> selectByUserId(Integer id, int offset, int limit);

    boolean deleteById(Integer id);

<<<<<<< HEAD
    List<History> showAll(int offset, int limit);
=======
    List<History> showAll(int offset,int limit);

    List<History> selectByUserId2(Integer userId);
>>>>>>> 3d4a2df8581f325c2f61070cf3657ec6ac227a4a
}
