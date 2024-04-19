package dao;

import java.util.List;


import entities.Order;
import entities.OrderDetail;

public interface OrderDao {
	public List<Order> getAll();
	public boolean insert(Order o);
	public boolean insertOrderDetail(Order order, List<OrderDetail> details);
	public Order getOrder(String id);
	public void update(Order o); 
	public  List<OrderDetail> getOrderDetail();
	public List<OrderDetail> getByOrder(String id);
	public List<Order> getByAccount(int id);
}
