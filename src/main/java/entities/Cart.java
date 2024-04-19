package entities;

import java.io.Serializable;

public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;
	private String proId;
	private String proName;
	private String slug;
	private String image;
	private float price;
	private int quantity;
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	public Cart(String proId, String proName, String slug, String image, float price, int quantity) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.slug = slug;
		this.image = image;
		this.price = price;
		this.quantity = quantity;
	}

	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
