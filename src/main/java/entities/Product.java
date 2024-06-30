package entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "products")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@NotEmpty(message = "Mã sản phẩm không được trống")
	private String proId;
	@Column(name = "name")
	@Length(min = 3,max = 100,message = "Độ dài của mã từ 3-100 ký tự")
	@NotEmpty(message = "Sản phẩm không được trống")
	private String proName;
	private String slug;
//	@Min(value = 10000, message = "Giá sản phẩm phải lớn hơn 10000")
    @Max(value = 10000000, message = "Giá sản phẩm không được vượt quá  10000000")
	private float price;
//	@Min(value = 10000, message = "Giá sản phẩm phải lớn hơn 10000")
    @Max(value = 10000000, message = "Giá sản phẩm không được vượt quá  10000000")
	private float oldPrice;
	private boolean status;
	@NotEmpty(message = "Mô tả sản phẩm không được trống")
	private String description;
	private String image;
	private Date createDate;
	
	@Column(name = "category_id")
	private int categoryId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id",insertable = false,updatable = false)
	private Category category;
	
	
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	private List<ImgProduct> imgProducts;
	
	@OneToMany(mappedBy = "product")
	private List<OrderDetail> orderdetails;
	
//    @OneToMany(mappedBy = "product")
//    private List<RatingProducts> ratings;
	
	public Product() {
		// TODO Auto-generated constructor stub
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
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(float oldPrice) {
		this.oldPrice = oldPrice;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}



	public List<OrderDetail> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(List<OrderDetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

//	public List<RatingProducts> getRatings() {
//		return ratings;
//	}
//
//	public void setRatings(List<RatingProducts> ratings) {
//		this.ratings = ratings;
//	}

	public List<ImgProduct> getImgProducts() {
		return imgProducts;
	}

	public void setImgProducts(List<ImgProduct> imgProducts) {
		this.imgProducts = imgProducts;
	}


	
}
