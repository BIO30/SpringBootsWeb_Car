package com.poly.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrdersDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.UsersDAO;
import com.poly.entity.Orderdetails;
import com.poly.entity.Orders;
import com.poly.entity.Products;
import com.poly.entity.ProductsDetails;
import com.poly.entity.Users;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class CartController {
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private OrderDAO ODDAO;
	@Autowired
	private OrdersDetailDAO ordDAO;
	@Autowired
	private UsersDAO userDAO;

	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	HttpServletRequest request;

	@PostMapping("/GioHang")
	public String cart(@RequestParam("id") String product_id, @RequestParam("color") String product_color,
			@RequestParam("quantity") String product_quantity, Model model) {
		Users User = sessionService.get("user");
		if (User == null) {
			return "DangNhap";
		} else if (!User.getActivated()) {
			return "XacThuc";
		} else {
			List<Orderdetails> listodd = new ArrayList<>();
			Products pd = proDAO.findProductById(product_id);
			if (sessionService.get("Order") == null) {
				Random random = new Random();
				int randomNumber = random.nextInt(1000 - 1 + 1) + 1;
				Orderdetails odd = new Orderdetails();
				odd.setOrderDetailsId(randomNumber);
				odd.setProductID(pd);
				odd.setQuantity(Integer.valueOf(product_quantity));
				odd.setColor(product_color);

				listodd.add(odd);
				sessionService.set("Order", listodd);
			} else {
				listodd = sessionService.get("Order");
				boolean found = false;

				for (Orderdetails x : listodd) {
					if (x.getProductID().getProductId().equals(pd.getProductId())
							&& x.getColor().equals(product_color)) {
						Integer quantity = x.getQuantity() + Integer.valueOf(product_quantity);
						x.setQuantity(quantity);
						found = true;
						break;
					}
				}

				if (!found) {
					Random random = new Random();
					int randomNumber = random.nextInt(1000 - 1 + 1) + 1;
					Orderdetails odd = new Orderdetails();
					odd.setOrderDetailsId(randomNumber);
					odd.setProductID(pd);
					odd.setQuantity(Integer.valueOf(product_quantity));
					odd.setColor(product_color);
					listodd.add(odd);
				}

				sessionService.set("Order", listodd);

			}

			return "GioHang";
		}

	}

	@GetMapping("/GioHang/remove")
	public String remove(@RequestParam("oddid") String Orderdetail_id, Model model) {
		List<Orderdetails> listodd = sessionService.get("Order");
		int indexToRemove = -1;
		for (int i = 0; i < listodd.size(); i++) {
			Orderdetails x = listodd.get(i);
			int a = x.getOrderDetailsId();
			int b = Integer.valueOf(Orderdetail_id);
			if (a == b) {
				indexToRemove = i;
				break;
			}
		}
		if (indexToRemove != -1) {
			listodd.remove(indexToRemove);
			sessionService.set("Order", listodd);
		}

		return "GioHang";
	}

	@GetMapping("/GioHang/update")
	public String update(@RequestParam("id") String Orderdetail_id, @RequestParam("qty") String quantity, Model model) {
		List<Orderdetails> listodd = sessionService.get("Order");

		for (Orderdetails x : listodd) {
			int a = x.getOrderDetailsId();
			int b = Integer.valueOf(Orderdetail_id);
			if (a == b) {
				Integer qty = Integer.valueOf(quantity);
				x.setQuantity(qty);

				break;
			}
		}
		sessionService.set("Order", listodd);
		return "GioHang";
	}

	@GetMapping("/GioHang/clear")
	public String clear(Model model) {
		sessionService.set("Order", null);
		return "GioHang";
	}

	@GetMapping("/GioHang/thanhtoan")
	public String Pay(@RequestParam("totalmoney") String totalmoney, Model model) {

		Users User = sessionService.get("user");

		if (User == null) {
			return "DangNhap";
		} else if (!User.getActivated()) {
			return "XacThuc";
		} else {
			List<Orderdetails> listodd = sessionService.get("Order");
			if (listodd != null && !listodd.isEmpty()) {
				Orders OD = new Orders();	
				OD.setUser(userDAO.findByEmail(User.getEmail()));
				OD.setOrderDate(getCurrentSQLDate());

				Long total = Long.valueOf(totalmoney);
				OD.setTotal(total);
				System.out.println(OD.getOrderDate());
				System.out.println(OD.getOrderId());
				ODDAO.save(OD);

				for (Orderdetails x : listodd) {
					x.setOrderID(OD);
					ordDAO.save(x);
				}

				sessionService.set("Order", null);
				
				List<Orders> listOD = ODDAO.FOrderBemail(User);
				model.addAttribute("ListOrder", listOD);
				return "HoaDon";
			}

		}

		return null;
	}
	
	  public static Date getCurrentSQLDate() {
	        LocalDate currentDate = LocalDate.now();
	        return Date.valueOf(currentDate);
	    }
	
}
