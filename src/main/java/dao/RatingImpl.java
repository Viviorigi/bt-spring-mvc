package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Product;
import entities.RatingProducts;
@Repository
public class RatingImpl implements RatingDao{
	@Autowired
	SessionFactory sessionFactory;
	@Override
	public void create(RatingProducts rating) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(rating);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public List<RatingProducts> getAllByProductId(String productId) {
	    Session session = null;
	    List<RatingProducts> ratings = null;
	    
	    try {
	        session = sessionFactory.openSession();
	        session.beginTransaction();
	        ratings = session.createQuery("FROM RatingProducts WHERE product_id = :productId order by rating_star  desc")
	                         .setParameter("productId", productId)
	                         .list();
	        
	        session.getTransaction().commit();
	    } catch (HibernateException e) {
	        if (session != null) {
	            session.getTransaction().rollback();
	        }
	        e.printStackTrace(); // Handle or log the exception appropriately
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    
	    return ratings;
	}

}
