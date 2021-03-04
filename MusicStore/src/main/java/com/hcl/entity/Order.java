package com.hcl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	Long id;
	@Column(name = "userId")
	Long userId;
	@Column(name = "productId")
	Long productId;
	@Column(name = "productName")
	String productName;
	@Column(name = "unitPrice")
	Long unitPrice;
	@Column(name = "quantity")
	Long quantity;
	@Column(name = "price")
	Long price;
	@Column(name = "status")
	String status;
}