package com.hcl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.hcl.controller.ProductsController;
import com.hcl.entity.Cart;
import com.hcl.entity.Product;
import com.hcl.repository.CartRepository;
import com.hcl.repository.ProductRepository;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	CartRepository cartRepository;
	@Autowired
	ProductRepository productRepository;
	


	Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	@Override
	public ModelMap cartMethod(Long userCartId) {
		
		List<Cart> list = cartRepository.findAll();
		List<Cart> newList = list.stream().filter(user -> user.getUserId() == userCartId).collect(Collectors.toList());
		List<Long> productIds = new ArrayList<>();
		List<Long> uniqueProductIds = new ArrayList<>();
		newList.stream().forEach(product->{
			productIds.add(product.getProductId());
		});
		uniqueProductIds = productIds.stream().distinct().collect(Collectors.toList());
		List<Product> productDetails = new ArrayList<>();
		for(int k = 0;k < uniqueProductIds.size(); k++) {
			productDetails.add(productRepository.findById(uniqueProductIds.get(k)).get());
		}
		Map<Long, Long> priceCalc = new HashMap<>();
		Map<Long, Long> quantity = new HashMap<>();
		
		for(int i = 0;i < uniqueProductIds.size(); i++) {
			
			for(int j = 0;j < newList.size(); j++) {
				
				if(uniqueProductIds.get(i) == newList.get(j).getProductId()) {
					
					if(!priceCalc.containsKey(uniqueProductIds.get(i))) {
						quantity.put(uniqueProductIds.get(i), (long) 1);
						priceCalc.put(uniqueProductIds.get(i), productDetails.get(i).getPrice());
					}else {
						quantity.put(uniqueProductIds.get(i), quantity.get(uniqueProductIds.get(i)) + (long) 1);
						priceCalc.put(uniqueProductIds.get(i), priceCalc.get(uniqueProductIds.get(i))+ productDetails.get(i).getPrice());
					}
				}
			}
		}
		List<String> productNames = new ArrayList<>();
		productDetails.stream().forEach(a->{
			productNames.add(a.getName());
		});
		List<Long> productprices = new ArrayList<>();
		productDetails.stream().forEach(a->{
			productprices.add(a.getPrice());
		});
		ModelMap model = null;
		
		List<List<String>> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		for(int l = 0;l < uniqueProductIds.size();l++) {
			for(int m = 0;m < 4; m++) {
				list2.add(priceCalc.get(uniqueProductIds.get(m)).toString());
				list2.add(quantity.get(uniqueProductIds.get(m)).toString());
				list2.add(productNames.get(m).toString());
				list2.add(productprices.get(m).toString());
			}
			list1.add(list2);
		}
//		model.addAttribute("products", list1);
//		model.addAttribute("quantity", quantity);
//		model.addAttribute("names", productNames);
//		model.addAttribute("prices", productprices);
		logger.info("----------------------------------------------"+priceCalc+"------------------------------------------------------------");
		logger.info("----------------------------------------------"+quantity+"------------------------------------------------------------");
		return model;
	}
}
