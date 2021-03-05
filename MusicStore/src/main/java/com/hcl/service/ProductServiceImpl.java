package com.hcl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.entity.Order;
import com.hcl.entity.Product;
import com.hcl.repository.OrderRepository;
import com.hcl.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepo;

	@Autowired
	OrderRepository orderRepository;
	
	Order countOrder;

	@Override
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}
	
	@Override
	public Optional<Product> findProductById(long productId) {
		// TODO Auto-generated method stub
		return productRepo.findById(productId);
	}

	@Override
	public Product getProductById(Long id) {
		return productRepo.findById(id).get();
	}

	int count = 0;
	@Override
	public void saveToCart(Long id, Long userId) {
		
		List<Order> orders = orderRepository.findAll();
		if (!orders.isEmpty()) {
			List<Order> orderList = new ArrayList<>();
			orderRepository.findAll().stream().forEach(a -> {
				if (a.getUserId() == userId) {
					orderList.add(a);
				}
			});
			
			orderList.stream().forEach(l -> {
				if (l.getProductId() == id && l.getStatus().equalsIgnoreCase("Cart")) {
					countOrder = l;
				}
			});
			if(countOrder != null) {
				Optional<Product> product = productRepo.findById(countOrder.getProductId());
				Order o3 = new Order();
				o3.setUnitPrice(product.get().getPrice());
				o3.setQuantity(countOrder.getQuantity() + 1);
				o3.setPrice(countOrder.getUnitPrice() * o3.getQuantity());
				o3.setProductName(product.get().getName());
				o3.setProductId(id);
				o3.setUserId(userId);
				o3.setStatus("Cart");
				orderRepository.deleteById(countOrder.getId());
				orderRepository.save(o3);
				countOrder = null;
			}else {
				Optional<Product> product = productRepo.findById(id);
				Order o2 = new Order();
				o2.setPrice(product.get().getPrice());
				o2.setUnitPrice(product.get().getPrice());
				o2.setQuantity((long) 1);
				o2.setProductName(product.get().getName());
				o2.setProductId(id);
				o2.setUserId(userId);
				o2.setStatus("Cart");
				orderRepository.save(o2);
			}			
		} else {
			Order o1 = new Order();
			Optional<Product> product = productRepo.findById(id);
			o1.setPrice(product.get().getPrice());
			o1.setUnitPrice(product.get().getPrice());
			o1.setQuantity((long) 1);
			o1.setProductName(product.get().getName());
			o1.setProductId(id);
			o1.setUserId(userId);
			o1.setStatus("Cart");
			orderRepository.save(o1);
		}
	}

	@Override
	public Optional<Product> findProductByName(String name) {
		return productRepo.findProductByName(name);
	}

	@Override
	public void deleteById(Long idToDelete) {
		productRepo.deleteById(idToDelete);
	}

	@Override
	public void saveProduct(Product product){
		this.productRepo.save(product);
	}

	public List<Product> getAllByQuery(String name, String category, String condition){
		return productRepo.getAllByQuery(name, category, condition);
	}
}
