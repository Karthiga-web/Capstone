package com.hcl.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hcl.entity.Product;
@Repository
public interface ProductRepository extends  JpaRepository<Product, Long>{

	Optional<Product> findProductByName(String name);

	@Query("select m from Product m where " +
			"(?1 is null or upper(m.name) like concat('%', upper(?1), '%')) " +
			"or (?2 is null or upper(m.category) like concat('%', upper(?2), '%')) " +
			"or (?3 is null or upper(m.condition) like concat('%', upper(?3), '%'))")
	List<Product> getAllByQuery(String name, String category, String condition);
}
