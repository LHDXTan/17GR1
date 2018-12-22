package Dao;

import entity.Order;

public interface OrderDao {
    int InsertOrder(Order order);

	Order selectId(String serialNumber);
}
