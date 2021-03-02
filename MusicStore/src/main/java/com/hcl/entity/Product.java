package com.hcl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

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
	@Column(name = "productImage", nullable = false)
	String image;
}
