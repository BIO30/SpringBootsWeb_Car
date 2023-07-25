package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.poly.dao.UsersDAO;

import com.poly.entity.Users;





@Controller
public class AdminController {
	
	@Autowired
	UsersDAO proDAO;

	@RequestMapping("/adminn/index")
	public String adminn_index(Model model, @ModelAttribute("UsersItem")Users pro) {
		pro.setEmail(null);
		pro.setUsername(null);
		pro.setRole(null);
		pro.setPassword(null);
		model.addAttribute("UsersItems", proDAO.findAll());
		return "adminn";
	}
	@PostMapping("/adminn/create")
	public String adminn_create(Model model, @Validated @ModelAttribute("UsersItem") Users pro, BindingResult result) {
		if(!result.hasErrors()) {
			if(!proDAO.findById(pro.getEmail()).isEmpty())
				model.addAttribute("error_UserId", "email đã tồn tại!");
			else {
				
				proDAO.save(pro);
				model.addAttribute("success_User", "Create success!");
			}
		}
		model.addAttribute("UsersItems", proDAO.findAll());
		return "adminn";
	}

	@PostMapping("/adminn/update")
	public String adminn_update(Model model, @Validated @ModelAttribute("UsersItem") Users pro, BindingResult result) {
		if(!result.hasErrors()) {
			if(proDAO.findById(pro.getEmail()).isEmpty())
				model.addAttribute("error_UserId", "email không tồn tại!");
			else {
				proDAO.save(pro);
				model.addAttribute("success_User", "Update success!");
			}
		}
		model.addAttribute("UsersItems", proDAO.findAll());
		return "adminn";
	}
	
	
	@PostMapping("/adminn/delete")
	public String adminn_delete(Model model, @ModelAttribute("UsersItem") Users pro) {
		if(pro.getEmail().length() == 100) {
			if(proDAO.findById(pro.getEmail()).isEmpty())
				model.addAttribute("error_User", "eamil không tồn tại!");
			else {
				proDAO.deleteById(pro.getEmail());
				model.addAttribute("success_User", "Delete success!");
			}
		}
		else 
			model.addAttribute("error_User");
		model.addAttribute("UsersItem", pro);
		model.addAttribute("UsersItems", proDAO.findAll());
		return "adminn";
	}
	@GetMapping("/adminn/delete")
public String adminn_delete(Model model, @RequestParam("email") String email, @ModelAttribute("UsersItem") Users pro) {
		if(proDAO.findById(pro.getEmail()).isEmpty())
			return "redirect:/adminn/index";
		else {
			proDAO.deleteById(email);
			model.addAttribute("success_User", "Delete success!");
		}
		model.addAttribute("UsersItems", proDAO.findAll());
		return "adminn";
	}

	@GetMapping("/adminn/edit")
	public String adminn_edit(Model model, @RequestParam("email") String email, @ModelAttribute("UsersItem") Users pro 
			
	) {
		if(proDAO.findById(pro.getEmail()).isEmpty())
			return "redirect:/adminn/index";
		else {
	Users User = proDAO.findById(email).get();
	
			pro.setEmail(User.getEmail());
			pro.setUsername(User.getUsername());
			pro.setRole(User.getRole());
			pro.setPassword(User.getPassword());
		}
		model.addAttribute("UsersItem",pro );
		model.addAttribute("UsersItems",proDAO.findAll() );
		return "adminn";
	}

}