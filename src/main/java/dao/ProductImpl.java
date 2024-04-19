package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.CategoryPage;
import entities.ImgProduct;
import entities.Product;
import entities.ProductPage;

@Repository
public class ProductImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Product> getAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Product> result=session.createQuery("from Product").list();
		session.getTransaction().commit();
		session.close();
		return result;
	}

	@Override
	public void create(Product p) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void update(Product p) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(p);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(String id) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Product p= session.find(Product.class, id);
		session.remove(p);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Product getById(String id) {
		Session session=sessionFactory.openSession();
		Product emp= session.find(Product.class, id);
		session.close();
		return emp;
	}

	@Override
	public ProductPage  paging(int cateId, int pageno, int pagesize) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int records=0;
		Query query=null;
		if(cateId==0) {
			query=session.createQuery("from Product");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else
		{
			query=session.createQuery("from Product where category_id=:cateid").setParameter("cateid", cateId);
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize);
		}
		List result=query.getResultList();
		ProductPage p=new ProductPage();
		p.setProducts(result);
		p.setCurrentPage(pageno);
		p.setPageSize(pagesize);
		int totalpage=records%pagesize==0?records/pagesize:(records/pagesize)+1;
		p.setTotalPages(totalpage);
		session.close();
		return p;
	}

	@Override
	public void create(ImgProduct img) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(img);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<ImgProduct> getAllImg() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<ImgProduct> result=session.createQuery("from ImgProduct").list();
		session.getTransaction().commit();
		session.close();
		return result;
	}

	@Override
	public void deleteImg(String id) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from ImgProduct where productId =:productid").setParameter("productid", id);
		List<ImgProduct> imgs= query.getResultList();
		for (ImgProduct img : imgs) {
			session.remove(img);	
		}
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Product getBySlug(String slug) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Product result = session.createQuery("from Product where slug =:slug",Product.class).setParameter("slug", slug).getSingleResult() ;
		System.out.println(result);
		return result;
	}

	@Override
	public List<Product> getLastProduct() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Product> result=session.createQuery("from Product ORDER BY createdate DESC").setMaxResults(8).getResultList();
		session.getTransaction().commit();
		session.close();
		return result;
	}

	@Override
	public List<Product> getComingProduct() {	
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Product> result=session.createQuery("from Product ORDER BY createdate ").setMaxResults(8).list();
		session.getTransaction().commit();
		session.close();
		return result;
	}

	@Override
	public ProductPage  getSort(String sort,int pageno, int pagesize,float pricefrom,float priceto,String seacrhName) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int records=0;
		Query query=null;
		if(sort==null || sort =="") {
			query=session.createQuery("from Product where price between :pricefrom and :priceto and name like :search ").setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("A-Z")) {
			query=session.createQuery("from Product where price between :pricefrom and :priceto and name like :search ORDER BY name ").setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("Z-A")) {
			query=session.createQuery("from Product where price between :pricefrom and :priceto and name like :search ORDER BY name DESC").setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("priceasc")) {
			query=session.createQuery("from Product where price between :pricefrom and :priceto and name like :search ORDER BY price ").setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("pricedesc")) {
			query=session.createQuery("from Product where price between :pricefrom and :priceto and name like :search ORDER BY price  DESC").setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}
		List result=query.getResultList();
		ProductPage p=new ProductPage();
		p.setProducts(result);
		p.setCurrentPage(pageno);
		p.setPageSize(pagesize);
		int totalpage=records%pagesize==0?records/pagesize:(records/pagesize)+1;
		p.setTotalPages(totalpage);
		session.close();
		return p;
	}

	@Override
	public ProductPage getByCateIdSort(int cateid, String sort,int pageno, int pagesize,float pricefrom,float priceto,String seacrhName) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int records=0;
		Query query =null;
		if(sort==null || sort =="") {
			query=session.createQuery("from Product where category_id =:cateid and price between :pricefrom and :priceto and name like :search  ",Product.class).setParameter("cateid", cateid).setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("A-Z")) {
			query=session.createQuery("from Product where category_id =:cateid and price between :pricefrom and :priceto and name like :search ORDER BY name ",Product.class).setParameter("cateid", cateid).setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("Z-A")) {
			query=session.createQuery("from Product where category_id =:cateid and price between :pricefrom and :priceto and name like :search ORDER BY name DESC",Product.class).setParameter("cateid", cateid).setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("priceasc")) {
			query=session.createQuery("from Product where category_id =:cateid and price between :pricefrom and :priceto and name like :search ORDER BY price ",Product.class).setParameter("cateid", cateid).setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}else if(sort.equals("pricedesc")) {
			query=session.createQuery("from Product where category_id =:cateid and price between :pricefrom and :priceto and name like :search ORDER BY price  DESC",Product.class).setParameter("cateid", cateid).setParameter("pricefrom", pricefrom).setParameter("priceto", priceto).setParameter("search","%"+seacrhName+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize).getResultList();
		}
		List result=query.getResultList();
		ProductPage p=new ProductPage();
		p.setProducts(result);
		p.setCurrentPage(pageno);
		p.setPageSize(pagesize);
		int totalpage=records%pagesize==0?records/pagesize:(records/pagesize)+1;
		p.setTotalPages(totalpage);
		session.close();
		return p;
	}

	@Override
	public List<Product> getByCateId(int cateid) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("from Product where category_id =:cateid ",Product.class).setParameter("cateid", cateid);
		List<Product> result=query.getResultList();
		session.close();
		return result;
	}

	
	
}
