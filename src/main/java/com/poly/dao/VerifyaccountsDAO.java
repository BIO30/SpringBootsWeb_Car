package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.poly.entity.Verifyaccounts;

public interface VerifyaccountsDAO extends JpaRepository<Verifyaccounts, String>{
	
	Verifyaccounts findByEmail(String email);
}