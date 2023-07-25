package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Categories;

@Repository
public interface CategoryDAO extends JpaRepository<Categories, String> {

	@Query("SELECT c.categoryName FROM Categories c WHERE c.categoryId = :categoryId")
	Categories findCateById(@Param("categoryId") String categoryId);

	@Query("SELECT o FROM Categories o WHERE o.categoryId=:categoryId ")
	Categories finduserById(@Param("categoryId") String categoryId);
}
