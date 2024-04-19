package entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderDetail")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderDetailId;
	private String orderId;
	private String proId;
	private int quantity;
	private float price;
	@ManyToOne
	@JoinColumn(name = "proId",insertable = false,updatable = false)
	private Product product;
	
	public OrderDetail() {

	}
	
	public OrderDetail(String orderId, String proId, int quantity, float price) {
		super();
		this.orderId = orderId;
		this.proId = proId;
		this.quantity = quantity;
		this.price = price;
	}
	
	public OrderDetail(int orderDetailId, String orderId, String proId, int quantity, float price, 
			Product product) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.proId = proId;
		this.quantity = quantity;
		this.price = price;
		this.product = product;
	}

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	
	
}
