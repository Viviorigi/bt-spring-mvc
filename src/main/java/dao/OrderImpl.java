package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Order;
import entities.OrderDetail;
import entities.Product;

@Repository
public class OrderImpl implements OrderDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Order> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order order by status asc ");
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public boolean insert(Order o) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(o);
		session.getTransaction().commit();
		session.close();
		return true;
	}
	

	@Override
	public boolean insertOrderDetail(Order order, List<OrderDetail> details) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(order);
			for (OrderDetail orderDetail : details) {
				session.save(orderDetail);
			}
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Order getOrder(String id) {
		Session session=sessionFactory.openSession();
		Order emp= session.find(Order.class, id);
		session.close();
		return emp;
	}

	@Override
	public void update(Order o) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(o);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<OrderDetail> getOrderDetail() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderDetail");
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public List<OrderDetail> getByOrder(String id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderDetail where orderId=:orderid").setParameter("orderid", id);
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public List<Order> getByAccount(int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order where accountId=:accountId order by status asc").setParameter("accountId", id);
		List data = query.getResultList();
		session.close();
		return data;
	}
	
	
}
