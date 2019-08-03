package com.movie.biz.Impl;

import com.movie.biz.HistoryService;
import com.movie.dao.HistoryMapper;
import com.movie.domain.po.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class HistoryServiceImpl implements HistoryService {
    @Autowired
    HistoryMapper historyMapper;

    @Override
    public List<History> selectByUserId(Integer id, int offset, int limit) {
        List<History> histories=historyMapper.selectByUserId(id, offset, limit);
        return histories;
    }

    @Override
    public boolean deleteById(Integer id) {
        int i = historyMapper.deleteById(id);
        return i > -1;
    }

    @Override
    public List<History> showAll(int offset, int limit) {
        List<History> histories=historyMapper.selectAll(offset, limit);
        return histories;
    }

    @Override
    public List<History> selectByUserId2(Integer userId) {
        return null;
    }
}
