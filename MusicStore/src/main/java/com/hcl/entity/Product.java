package com.hcl.entity;

import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Base64;

@Data
@NoArgsConstructor
@Entity
@Table(name = "store")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productId", nullable = false)
	Long id;
	@Column(name = "productName", nullable = false)
	String name;
	@Column(name = "productCategory", nullable = false)
	String category;
	@Column(name = "productPrice", nullable = false)
	Long price;
	@Column(name = "productCondition", nullable = false)
	String condition;
	@Column(name = "productImage", nullable = false,  columnDefinition = "mediumblob")
	byte[] image;

	@Transient
	String base64image;
	
	

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public Long getPrice() {
		return price;
	}



	public void setPrice(Long price) {
		this.price = price;
	}



	public String getCondition() {
		return condition;
	}



	public void setCondition(String condition) {
		this.condition = condition;
	}



	public byte[] getImage() {
		return image;
	}



	public void setImage(byte[] image) {
		this.image = image;
	}



	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}



	public String getBase64image() {
		base64image = Base64.getEncoder().encodeToString(this.image);
		return base64image;
	}
}
