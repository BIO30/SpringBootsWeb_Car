package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Products;
@Repository
public interface ProductDAO extends JpaRepository<Products, String>{


	@Query("SELECT o FROM Products o WHERE o.productId=:productId ")
    Products findProductById(@Param("productId") String productId);

	//Tìm product theo brand
	@Query("SELECT o FROM Products o WHERE o.productName LIKE ?1")
	Page<Products> findByKeywords(String keywords, Pageable pageable);
	
	//Sắp xếp product từ A --> Z
	@Query("SELECT o FROM Products o ORDER BY productName")
	Page<Products> findBySortNameLow(Pageable pageable);
	
	//Sắp xếp product từ Z --> A
	@Query("SELECT o FROM Products o ORDER BY productName DESC")
	Page<Products> findBySortNameHigh(Pageable pageable);
	
	//Sắp xếp product từ giá thấp đến cao
	@Query("SELECT o FROM Products o ORDER BY price")
	Page<Products> findBySortPriceLow(Pageable pageable);
	
	//Sắp xếp product từ giá cao đến thấp
	@Query("SELECT o FROM Products o ORDER BY price DESC")
	Page<Products> findBySortPriceHigh(Pageable pageable);
	
	//Tìm product theo giá 500.000.000 đến 700.000.000
	@Query("SELECT o FROM Products o WHERE o.price BETWEEN 500000000 AND 700000000")
	Page<Products> findBySortPriceBetween57(Pageable pageable);
	
	//Tìm product theo giá 700.000.000 đến 1.000.000.000
	@Query("SELECT o FROM Products o WHERE o.price BETWEEN 700000000 AND 1000000000 ORDER BY price")
	Page<Products> findBySortPriceBetween710(Pageable pageable);
	
	//Tìm product theo giá 1.000.000.000 đến 5.000.000.000
	@Query("SELECT o FROM Products o WHERE o.price BETWEEN 1000000000 AND 5000000000 ORDER BY price")
	Page<Products> findBySortPrice1050(Pageable pageable);
	
	//Tìm product theo giá 5.000.000.000+
	@Query("SELECT o FROM Products o WHERE o.price > 5000000000 ORDER BY price")
	Page<Products> findBySortPriceHigh50(Pageable pageable);

    
    
    
}
