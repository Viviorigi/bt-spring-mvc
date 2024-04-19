package dao;

import java.util.List;

import entities.Category;
import entities.CategoryPage;

public interface CategoryDAO {
	public List<Category> getAll();
	public void create(Category c);
	public void update(Category c);
	public void delete(int id);
	public Category getById(int id);
	public CategoryPage paging(int pageno, int pagesize);
}
