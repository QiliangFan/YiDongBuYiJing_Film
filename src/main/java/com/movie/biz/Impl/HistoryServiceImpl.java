package com.movie.biz.Impl;

import com.movie.biz.HistoryService;
import com.movie.dao.HistoryMapper;
import com.movie.domain.po.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service("historyService")
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
        List<History> histories=historyMapper.selectByUserId2(userId);
        return histories;
    }

    @Override
    public boolean add(History history) {
        System.out.println(history);
        history.setTime(""+new Timestamp(System.currentTimeMillis()));
        int a = historyMapper.add(history);
        if(a==1)
            return true;
        else
            return  false;
    }
}
