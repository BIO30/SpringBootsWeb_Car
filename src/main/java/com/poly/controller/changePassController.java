package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.UsersDAO;
import com.poly.entity.Users;

@Controller
public class changePassController {
	@Autowired
	private UsersDAO userDAO;

	@GetMapping("/doiMatKhau")
	public String changePasswordForm(Model model) {
		model.addAttribute("user", new Users());
		return "doiMatKhau";
	}
	
	@PostMapping("doiMatKhau")
	public String confirmDoiMatKhau(@ModelAttribute("user") Users user, @RequestParam("newPassword") String newPassword) {
		
		Users changePass = userDAO.findByUsername(user.getUsername());
		if(changePass == null) {
			System.out.println("đổi thất bại");
			return "user";
		}
		
		if(!changePass.getPassword().equals(user.getPassword())) {
			System.out.println("đổi thất bại");
			return "user";
		}
		
		changePass.setPassword(newPassword);
		userDAO.save(changePass);
		System.out.println("đổi thành công");
		return "user";
		
		
	}

}
