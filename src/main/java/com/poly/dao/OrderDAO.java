package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Orders;
import com.poly.entity.Users;
@Repository
public interface OrderDAO extends JpaRepository<Orders, String>{
	@Query("SELECT o FROM Orders o WHERE o.user=:user ")
	List<Orders>  FOrderBemail(@Param("user") Users user);
}
