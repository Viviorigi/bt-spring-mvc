package entities;

import java.util.List;

public class ProductPage {
	private List<Product> products ;
	private int totalPages;
	private int pageSize;
	private int currentPage;
	public ProductPage() {
		// TODO Auto-generated constructor stub
	}
	public ProductPage(List<Product> products, int totalPages, int pageSize, int currentPage) {
		super();
		this.products = products;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
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
