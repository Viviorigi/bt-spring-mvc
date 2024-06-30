package dao;

import java.util.List;

import entities.Category;
import entities.Product;
import entities.RatingProducts;

public interface RatingDao {
	public void create(RatingProducts rating);
	public List<RatingProducts> getAllByProductId(String productId);
}
