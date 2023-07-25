package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.poly.entity.ProductsDetails;
@Repository
public interface ProductsDetailDAO extends JpaRepository<ProductsDetails, Integer>{
	
}
