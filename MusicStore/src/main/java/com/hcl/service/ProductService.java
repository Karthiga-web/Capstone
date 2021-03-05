package com.hcl.service;

import java.util.List;
import java.util.Optional;

import com.hcl.entity.Product;

public interface ProductService {

	List<Product> getAllProducts();

	Optional<Product> findProductById(long productId);

	Product getProductById(Long id);

	void saveToCart(Long id, Long userId);

	Optional<Product> findProductByName(String name);

	void saveProduct(Product product);

	void deleteById(Long idToDelete);

	List<Product> getAllByQuery(String name, String category, String condition);

}
