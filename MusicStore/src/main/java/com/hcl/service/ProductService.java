package com.hcl.service;

import java.util.List;
import java.util.Optional;

import com.hcl.entity.Cart;
import com.hcl.entity.Product;
import com.hcl.entity.User;

public interface ProductService {

	List<Product> getAllProducts();

	Optional<Product> findProductById(long productId);

	void saveToCart(Long id, Long userId);

	Optional<Product> findProductByName(String name);

}
