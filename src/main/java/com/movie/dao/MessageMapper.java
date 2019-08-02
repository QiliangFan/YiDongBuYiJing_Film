package com.movie.dao;

import com.movie.domain.po.Message;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * @author hehe
 * @version 1.0
 * @date 2019/8/2
 */
@Repository
public interface MessageMapper {

    /**
     * 增加留言
     * @param message
     * @return
     */
    Integer add(Message message);

    /**
     * 获取全部留言
     * @param offset
     * @param limit
     * @return
     */
    List<Message> selectAll(@Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 通过用户名获取留言
     * @param userId
     * @param offset
     * @param limit
     * @return
     */
    List<Message> selectByUserId(@Param("userId") Integer userId,@Param("offset") Integer offset,@Param("limit") Integer limit);

    /**
     * 通过ID删除留言
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 更新留言
     * @param message
     * @return
     */
    Integer update(Message message);

    /**
     * 获取留言数量
     * @return
     */
    Integer count();
}
