package entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.Entity;

@Entity
@Table(name = "rating_products")
public class RatingProducts {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String review;
	
	private int rating_star;
	
	private String product_id;
	
	private String name;
	private String email;
	
	public RatingProducts() {
		
	}

	public RatingProducts(int id, String review, int rating_star, String product_id, String name, String email) {
		super();
		this.id = id;
		this.review = review;
		this.rating_star = rating_star;
		this.product_id = product_id;
		this.name = name;
		this.email = email;
	}
	public String getProduct_id() {
		return product_id;
	}



	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getRating_star() {
		return rating_star;
	}
	public void setRating_star(int rating_star) {
		this.rating_star = rating_star;
	}
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
