package Dao;

import java.util.List;

import entity.Order;

public interface OrderDao {
    int InsertOrder(Order order);

	Order selectId(String serialNumber);

	List<Order> selectList(Object id);

	List<Order> selectList();
}
