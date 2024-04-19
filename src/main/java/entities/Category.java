package entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "categories")
public class Category  implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name ="name")
	@Length(min = 3,max = 100,message = "Độ dài của mã từ 3-100 ký tự")
	@NotEmpty(message = "Danh mục không được trống")
	private String categoryName;
	private boolean status;
	private Date createDate;
	
	@OneToMany(mappedBy = "category",fetch = FetchType.EAGER)
	private List<Product> products;
	
	
	public Category() {
		
	}
	
	

	public Category(int id,
			@Length(min = 3, max = 100, message = "Độ dài của mã từ 3-100 ký tự") @NotEmpty(message = "Danh mục không được trống") String categoryName,
			boolean status, Date createDate, List<Product> products) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.status = status;
		this.createDate = createDate;
		this.products = products;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public List<Product> getProducts() {
		return products;
	}



	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
	
}
