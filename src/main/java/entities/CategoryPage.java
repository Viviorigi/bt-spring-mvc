package entities;

import java.util.List;

public class CategoryPage {
	private List<Category> categories;
	private int totalPages;
	private int pageSize;
	private int currentPage;
	
	public CategoryPage() {
		// TODO Auto-generated constructor stub
	}

	public CategoryPage(List<Category> categories, int totalPages, int pageSize, int currentPage) {
		super();
		this.categories = categories;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
