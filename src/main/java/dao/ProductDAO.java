package dao;

import java.util.List;

import entities.ImgProduct;
import entities.Product;
import entities.ProductPage;


public interface ProductDAO {
	public List<Product> getAll();
	public void create(Product p);
	public void update(Product p);
	public void delete(String id);
	public Product getById(String id);
	public ProductPage paging(int cateId,int pageno, int pagesize);
	public void create(ImgProduct img);
	public List<ImgProduct> getAllImg();
	public void deleteImg(String id);
	public Product getBySlug(String slug);
	public List<Product> getLastProduct();
	public List<Product> getComingProduct();
	public ProductPage  getSort(String sort, int pageno, int pagesize, float pricefrom, float priceto,String searchName);
	public ProductPage   getByCateIdSort(int cateid,String sort,int pageno, int pagesize, float pricefrom, float priceto,String searchName);
	public List<Product> getByCateId(int cateid);
}
