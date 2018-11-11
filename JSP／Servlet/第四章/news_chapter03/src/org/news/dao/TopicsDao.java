package org.news.dao;

import java.util.List;
import org.news.entity.Topic;

public interface TopicsDao {
	/**
	 * 获取所有主题
	 * @return
	 */
    public List<Topic> getAllTopics();
   /**
    * 更新主题
    * @param topic
    * @return
    */
    public int updateTopic(Topic topic);
    /**
     * 根据名字查找主题
     * @param name
     * @return
     */
    public Topic findTopicByName(String name);
    /**
     * 添加主题
     * @param name
     * @return
     */
    public int addTopic(String name);
    /**
     * 通过tid删除主题
     * @param tid
     * @return
     */
    public int deleteTopic(int tid);
}