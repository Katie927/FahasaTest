package vn.devpro.testBookstore.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_publish")
public class Publisher extends BaseModel {
	
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
// 	--------------- Mapping one-to-many: tbl_category-to-tbl_product ---------------//	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	private Set<Product> products = new HashSet<Product>();
	
//	--------------------- Mapping many-to-one: tbl_category-to-tbl_user (for create category)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreatePublisher;

	// Mapping many-to-one: tbl_category-to-tbl_user (for update category)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdatePublisher;
// 	-----------------------------------------------------------------------

	public Publisher() {
		super();
	}
	public Publisher(Integer id, Date createDate, Date updateDate, Boolean status, String name, String description,
			Set<Product> products, User userCreatePublisher, User userUpdatePublisher) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.description = description;
		this.products = products;
		this.userCreatePublisher = userCreatePublisher;
		this.userUpdatePublisher = userUpdatePublisher;
	}

	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getUserCreatePublisher() {
		return userCreatePublisher;
	}
	public void setUserCreatePublisher(User userCreatePublisher) {
		this.userCreatePublisher = userCreatePublisher;
	}
	public User getUserUpdatePublisher() {
		return userUpdatePublisher;
	}
	public void setUserUpdatePublisher(User userUpdatePublisher) {
		this.userUpdatePublisher = userUpdatePublisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
