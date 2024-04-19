package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.CategoryPage;

@Repository
public class CategoryImpl  implements CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Category> getAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Category> result=session.createQuery("from Category").list();
		session.getTransaction().commit();
		session.close();
		return result;
	}

	@Override
	public void create(Category c) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void update(Category c) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(c);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(int id) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Category c= session.find(Category.class, id);
		session.remove(c);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Category getById(int id) {
		Session session=sessionFactory.openSession();
		Category emp= session.find(Category.class, id);
		session.close();
		return emp;
	}

	@Override
	public CategoryPage paging(int pageno, int pagesize) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int records=0;
	    Query query=session.createQuery("from Category");
		records=query.getResultList().size();
		query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		List result=query.getResultList();
		CategoryPage c=new CategoryPage();
		c.setCategories(result);
		c.setCurrentPage(pageno);
		c.setPageSize(pagesize);
		int totalpage=records%pagesize==0?records/pagesize:(records/pagesize)+1;
		c.setTotalPages(totalpage);
		session.close();
		return c;
	}

}
