package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.ProductsDetailDAO;
import com.poly.dao.UsersDAO;
import com.poly.entity.Categories;
import com.poly.entity.Products;
import com.poly.entity.ProductsDetails;
import com.poly.entity.Users;
import com.poly.service.SessionService;

@Controller
public class PageController {
	@Autowired
	SessionService session;

	@Autowired
	ProductDAO proDao;

	@Autowired
	UsersDAO userDao;

	@RequestMapping("/")
	public String homePage() {
		return "trangChu";
	}

	@RequestMapping("/trangChu")
	public String trangChu() {
		return "trangChu";
	}

	@RequestMapping("/sanpham")
	public String sanPham() {
		return "sanpham";
	}

	@RequestMapping("/lienHe")
	public String lienHe() {
		return "lienHe";
	}

	@RequestMapping("/gioiThieu")
	public String gioiThieu() {
		return "gioiThieu";
	}
	
	@RequestMapping("/chiTiet")
	public String chiTiet() {
		return "chiTiet";
	}
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	@RequestMapping("/user")
	public String userDetail(@RequestParam("id") String email, Model model) {
		  // Lấy thông tin sản phẩm từ CSDL dựa trên productId
		  Users users = userDao.findByEmail(email);
		  model.addAttribute("user", users);
		  return "user";
		}

	@GetMapping("/product/page")
	public String page(Model model, @RequestParam("product") Optional<Integer> product) {
		Pageable page = PageRequest.of(product.orElse(0), 9);
		model.addAttribute("page", proDao.findAll(page));
		return "sanpham";
	}
    
  
	@RequestMapping("/product/page")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("product") Optional<Integer> product) {
		String kwords = kw.orElse(session.get("keywords"));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(product.orElse(0), 5);
		Page<Products> page = proDao.findByKeywords("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		return "sanpham";
	}
	
	@GetMapping("/detail")
	public String productDetailPage(@RequestParam("id") String product_id, @RequestParam("id") String category_id, Model model) {
	  // Lấy thông tin sản phẩm từ CSDL dựa trên productId
	  Products product = proDao.findProductById(product_id);
	  model.addAttribute("product", product);
	  model.addAttribute("PDD", product.getProductsDetails());
	  return "chiTiet";
	}
	
	
	@GetMapping("/GioHang")
	public String gioHang() {
		Users User = session.get("user");
		
		if(User==null) {
			return "DangNhap";
		}else if(!User.getActivated()) {
			return "XacThuc";
		}else {
		return "GioHang";
		} 
	}

}
