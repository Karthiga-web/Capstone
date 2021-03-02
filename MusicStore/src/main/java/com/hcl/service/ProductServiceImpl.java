package com.hcl.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.entity.Cart;
import com.hcl.entity.Product;
import com.hcl.repository.CartRepository;
import com.hcl.repository.ProductRepository;
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	CartRepository cartRepo;

	@Override
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}

	@Override
	public Optional<Product> findProductById(long productId) {
		// TODO Auto-generated method stub
		return productRepo.findById(productId);
	}
	
	@SuppressWarnings("null")
	@Override
	public void saveToCart(Long id, Long userId) {
		Cart cart = new Cart();
		cart.setProductId(id);
		cart.setUserId(userId);
		cartRepo.save(cart);
	}

	@Override
	public Optional<Product> findProductByName(String name) {
		return productRepo.findProductByName(name);
	}

}
