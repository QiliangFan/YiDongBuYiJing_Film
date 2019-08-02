package com.movie.biz;

import com.movie.domain.po.Message;

import java.util.List;

/**
 * @author chentaijie
 * @version 1.0
 * @date 2019/8/2 23:54
 */
public interface MessageService {

    /**
     * 用户增加留言
     * @param message
     * @return
     */
    Integer addMessage(Message message);

    /**
     * 获取全部留言
     * @return
     */
    List<Message> selectAllMessage(Integer currentPage,Integer limit);

    /**
     * 通过用户ID删除留言
     * @param id
     * @return
     */
    Integer deleteMessageById(Integer id);

    /**
     * 更新留言
     * @param message
     * @return
     */
    Integer updateMessage(Message message);

    /**
     * 获取某用户全部留言
     * @param userId
     * @param offset
     * @param limit
     * @return
     */
    List<Message> getOwnMessage(Integer userId,Integer currentPage,Integer limit);
}
