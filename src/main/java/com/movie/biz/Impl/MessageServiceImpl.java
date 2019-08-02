package com.movie.biz.Impl;

import com.movie.biz.MessageService;
import com.movie.dao.MessageMapper;
import com.movie.domain.po.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 23:55
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;
    @Override
    public Integer addMessage(Message message) {
        return messageMapper.add(message);
    }

    @Override
    public List<Message> selectAllMessage(Integer currentPage,Integer limit) {
        Integer offset = (currentPage-1)*limit;
        return messageMapper.selectAll(offset,limit);
    }

    @Override
    public Integer deleteMessageById(Integer id) {
        return messageMapper.deleteById(id);
    }

    @Override
    public Integer updateMessage(Message message) {
        return messageMapper.update(message);
    }

    @Override
    public List<Message> getOwnMessage(Integer userId, Integer currentPage, Integer limit) {
        Integer offset = (currentPage-1)*limit;
        return messageMapper.selectByUserId(userId, offset, limit);
    }
}
