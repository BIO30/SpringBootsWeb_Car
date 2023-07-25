package com.poly.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.poly.dao.UsersDAO;
import com.poly.dao.VerifyaccountsDAO;
import com.poly.entity.Mailinfo;
import com.poly.entity.Users;
import com.poly.entity.Verifyaccounts;
import com.poly.mail.MailerService;
import com.poly.mail.MailerServiceImpl;
import com.poly.service.PasswordUtil;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;




@Controller
public class LoginController {
	
	@Autowired
	UsersDAO usDao;
	
	@Autowired
	VerifyaccountsDAO accDao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	PasswordUtil pasUtil;
	
	@Autowired
	MailerServiceImpl mailimpl;
	
	@Autowired
    private HttpServletRequest request;
	
	@GetMapping("/DangNhap")
	public String dangnhap() {
		Users us = session.get("user");
		if(us != null) {
			if(us.getRole()) {
				return "admin";
			}else {
				return "user";
			}
		}else {
			return "DangNhap";
		}
	}
	@GetMapping("/DangKy")
	public String dangky() {
		return "DangKy";
	}
	@GetMapping("/XacThuc")
	public String xacthuc() {
		return "XacThuc";
}
	
	@PostMapping("/DangNhap")
	public String login(Model model,@Validated @ModelAttribute("userT") Users account, @RequestParam("username") String username, @RequestParam("password") String password, BindingResult result) {
	
		try {
			Users account1 = usDao.findByEmail(account.getUsername());
			if(account1 != null) {
				if(account1.getPassword().equals(account.getPassword())) {
					if(account1.getActivated()) {
						if(account1.getRole()) {
							session.set("user", account1);
							
							HttpSession session1 = request.getSession();
						    Users user = (Users) session1.getAttribute("user");
							return "redirect:/admin";
						}else {
							session.set("user", account1);
							System.out.println(account1);
							System.out.println(account);
							return "redirect:/trangChu";
						}
					}else {
						session.set("user", account1);
						return "XacThuc";
					}
				}else {
					model.addAttribute("error_loginPass", "Tài khoản hoặc mật khẩu không chính xác!");
				}
			}else{
				model.addAttribute("error_loginPass", "Tài khoản hoặc mật khẩu không chính xác!");
//				return "DangNhap";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error_loginUsername", "Dăng nhập thất bại!");
			System.out.println("Lỗi khi gửi email: " + e.getMessage());
		}
		
		return "DangNhap";
		
		
	}
		

	@PostMapping("/logout")
	public String logout() {
		session.remove("user");
		session.remove("security-uri");
		return "redirect:/DangNhap";
	}
	
	
	@PostMapping("/DangKy")
	public String signup(Model model ,@Validated @ModelAttribute("Newuser") Users newuser, @RequestParam("email") String email, @RequestParam("fullname") String fullname,
			@RequestParam("password") String password) {
		try {
			if(email=="" || fullname=="" || password=="") {
				model.addAttribute("error_dangky","Không được bỏ trống thông tin!");
				return "DangKy";
			}else {
				Users acc = usDao.findByEmail(email);
				if(acc != null) {
					if(acc.getActivated()) {
						model.addAttribute("error_dangky","Tài khoản đã tồn tại");
						return "DangKy";
					}else {
						model.addAttribute("error_dangky","Tài khoản đã tồn tại kiểm tra email để lấy mã xác thực");
						return "DangKy";
						
					}
				}else {
					Verifyaccounts verAcc = new Verifyaccounts();
					Users us = new Users();
					us.setEmail(email);
					us.setUsername(fullname);
					us.setPassword(password);
					us.setRole(false);
					us.setActivated(false);
					usDao.save(us);
					String verifyCode = String.valueOf(pasUtil.generatePassword(8));
					verAcc.setEmail(email);
					verAcc.setVerifycode(verifyCode);
					accDao.save(verAcc);
					Mailinfo mail = new Mailinfo();
					mail.setFrom("SysCar");
					mail.setTo(us.getEmail().trim());
					String subject = "Xác thực tài khoản";
					String codekh = verifyCode;
					mail.setSubject(subject);
					mail.setBody("Hãy đăng nhập vào trang web và nhập đoạn mã này để kích hoạt tài khoản :"+codekh);
					mailimpl.send(mail);
					model.addAttribute("error_dangky","Đăng ký thành công hãy kiểm tra email và đang nhập để kích hoạt tài khoản!");
					return "DangKy";
					
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("error_dangky","Đăng ký thất bại!");
			System.out.println("Lỗi khi gửi email: " + e.getMessage());
		}
		
		return "DangKy";
	}
	
	@PostMapping("/XacThuc")
	public String xacthuc(Model model,@ModelAttribute("code") Verifyaccounts code, @RequestParam("codext") String codext) {
		try {
			HttpSession session1 = request.getSession();
		    Users user = (Users) session1.getAttribute("user");
			System.out.println(user);
			System.out.println(codext);
	
			if(user != null) {
				if(user.getActivated()) {
					model.addAttribute("error_xacthuc","Tài khoản đã được kích hoạt");
				}else{
					Verifyaccounts acc = accDao.findByEmail(user.getEmail());
					System.out.println(acc.getEmail());
					if(codext.equals(acc.getVerifycode())) {
						Users users = new Users();
						users= usDao.findByEmail(acc.getEmail());
						users.setActivated(true);
						usDao.save(users);
						accDao.delete(acc);
						return "trangChu";
					}else {
						model.addAttribute("error_xacthuc","Mã kích hoạt không chính xác");
					}
				}	
			}else {
				return "DangNhap";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "DangNhap";
		}
		return "XacThuc";
	}
}
