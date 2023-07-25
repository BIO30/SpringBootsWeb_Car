package com.poly.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Categories;
import com.poly.entity.Products;




@Controller
public class QLSPProductController {
 
	@Autowired
	ProductDAO proDAO;
	@Autowired
	CategoryDAO caDAO;

	@RequestMapping("/product")
	public String product() {
		return "product";
	}
	@RequestMapping("/product/index")
	public String product_index(Model model, @ModelAttribute("productItem")Products pro) {
		pro.setProductId(null);
		pro.setCategoryID(null);
		pro.setProductName(null);
		pro.setPrice(null);
		pro.setImage(null);
		pro.setDescription(null);
		model.addAttribute("productItems", proDAO.findAll());
		return "product";
	}
	@PostMapping("/product/create")
	public String product_create(Model model, @Validated @ModelAttribute("productItem") Products pro, BindingResult result) {
		if(!result.hasErrors()) {
			if(!proDAO.findById(pro.getProductId()).isEmpty())
				model.addAttribute("error_productId", "Id đã tồn tại!");
			else {
				
				proDAO.save(pro);
				model.addAttribute("success_Product", "Create success!");
			}
		}
		model.addAttribute("productItems", proDAO.findAll());
		return "product";
	}

	@PostMapping("/product/update")
	public String product_update(Model model, @Validated @ModelAttribute("productItem") Products pro, BindingResult result) {
		if(!result.hasErrors()) {
			if(proDAO.findById(pro.getProductId()).isEmpty())
				model.addAttribute("error_productId", "Id không tồn tại!");
			else {
				proDAO.save(pro);
				model.addAttribute("success_Product", "Update success!");
			}
		}
		model.addAttribute("productItems", proDAO.findAll());
		return "product";
	}
	
	
	@PostMapping("/product/delete")
	public String product_delete(Model model, @ModelAttribute("productItem") Products pro) {
		if(pro.getProductId().length() == 4) {
			if(proDAO.findById(pro.getProductId()).isEmpty())
				model.addAttribute("error_product", "Id không tồn tại!");
			else {
				proDAO.deleteById(pro.getProductId());
				model.addAttribute("success_product", "Delete success!");
			}
		}
		else 
			model.addAttribute("error_product", "Độ dài id loại hàng là 5 ký tự!");
		
		model.addAttribute("productItems", proDAO.findAll());
		return "product";
		
	}
	@GetMapping("/product/delete")
	public String product_delete(Model model, @RequestParam("productId") String productId, @ModelAttribute("productItem") Products pro) {
		if(proDAO.findById(pro.getProductId()).isEmpty())
			return "redirect:/product/index";
		else {
			proDAO.deleteById(productId);
			model.addAttribute("success_product", "Delete success!");
		}
		model.addAttribute("productItems", proDAO.findAll());
		return "product";
	}

	
	
	
	

	
	
	
	@GetMapping("/product/edit")
	public String product_edit(Model model, @RequestParam("productId") String productId, @ModelAttribute("productItem") Products pro 
			
	) {
		if(proDAO.findById(pro.getProductId()).isEmpty())
			return "redirect:/product/index";
		else {
	Products product = proDAO.findById(productId).get();
	
			pro.setProductId(product.getProductId());
			pro.setCategoryID(product.getCategoryID());
			pro.setProductName(product.getProductName());
			pro.setPrice(product.getPrice());
			pro.setImage(product.getImage());
			pro.setDescription(product.getDescription());
		}
		model.addAttribute("productItem",pro );
		model.addAttribute("productItems",proDAO.findAll() );
		return "product";
	}
	
	


}
