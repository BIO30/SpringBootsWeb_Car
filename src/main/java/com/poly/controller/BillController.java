package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrdersDetailDAO;
import com.poly.entity.Orderdetails;
import com.poly.entity.Orders;
import com.poly.entity.Users;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BillController {
	@Autowired
	SessionService sessionService;
	@Autowired
	HttpServletRequest request;
	 @Autowired
	    private OrderDAO ODDAO;
	 @Autowired
	    private OrdersDetailDAO ordDAO;
	@GetMapping("/HoaDon")
	public String HoaDon(Model model) {
		Users User = sessionService.get("user");

		if (User == null) {
			return "DangNhap";
		} else if (!User.getActivated()) {
			return "XacThuc";
		} else {
			List<Orders> listOD = ODDAO.FOrderBemail(User);
			model.addAttribute("ListOrder", listOD);
			return "HoaDon";
		}
			
	}
	
	@GetMapping("/HoaDon/chitiet")
	public String OrderDetail(@RequestParam("Order") String Orderid,Model model) {
		Orders Order = ODDAO.findById(Orderid).get();
		model.addAttribute("Order", Order);
		List<Orderdetails> ListOrderDetail = ordDAO.findByOrderId(Orderid);
		model.addAttribute("List", ListOrderDetail);
		return "ChiTietHoaDon";
	}
	
}
