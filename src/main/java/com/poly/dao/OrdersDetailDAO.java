package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Orderdetails;
@Repository
public interface OrdersDetailDAO extends JpaRepository<Orderdetails, String>{
	 @Query("SELECT o FROM Orderdetails o WHERE o.orderID.orderId=:orderId")
	    List<Orderdetails> findByOrderId(@Param("orderId") String orderId);

}
