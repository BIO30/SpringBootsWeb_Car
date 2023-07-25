package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Users;
@Repository
public interface UsersDAO extends JpaRepository<Users, String>{
	@Query("SELECT u FROM Users u WHERE u.username = :username")
    Users findByUsername(@Param("username") String username);
	
	Users findByEmail(String email);
	
	 
}
