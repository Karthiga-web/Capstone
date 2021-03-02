package com.hcl.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hcl.entity.Product;
@Repository
public interface ProductRepository extends  JpaRepository<Product, Long>{

	Optional<Product> findProductByName(String name);

}
