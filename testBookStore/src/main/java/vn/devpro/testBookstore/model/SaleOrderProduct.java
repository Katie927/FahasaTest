package vn.devpro.testBookstore.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_order_product")
public class SaleOrderProduct extends BaseModel {

	@Column(name = "quantity", nullable = true)
	private Integer quantity;
	
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
	// mapping many-to-one: sale-order-product to product
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id")
	private Product product;
	
	// mapping many to one : sale-order-product to sale-order
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sale_order_id")
	private SaleOrder saleOrder;

	public SaleOrderProduct() {
		super();
	}
	public SaleOrderProduct(Integer id, Date createDate, Date updateDate, Boolean status, Integer quantity,
			String description, Product product, SaleOrder saleOrder) {
		super(id, createDate, updateDate, status);
		this.quantity = quantity;
		this.description = description;
		this.product = product;
		this.saleOrder = saleOrder;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public SaleOrder getSaleOrder() {
		return saleOrder;
	}
	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}
	
	
}
