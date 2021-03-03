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

	public String getBase64image() {
		base64image = Base64.getEncoder().encodeToString(this.image);
		return base64image;
	}
}
