package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String orderId;
	private int accountId;
	private int status;
	private String note;
	private int paymentMethod;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "accountId",insertable = false,updatable = false)
	private Account account;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(String orderId, int accountId, int status, String note, int paymentMethod) {
		super();
		this.orderId = orderId;
		this.accountId = accountId;
		this.status = status;
		this.note = note;
		this.paymentMethod = paymentMethod;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
}
