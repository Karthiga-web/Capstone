package com.hcl.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hcl.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Long>{

}
