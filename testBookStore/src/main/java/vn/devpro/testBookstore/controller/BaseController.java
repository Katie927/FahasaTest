package vn.devpro.testBookstore.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mysql.cj.protocol.Security;

import vn.devpro.testBookstore.dto.Cart;
import vn.devpro.testBookstore.model.User;

@Controller
public class BaseController {
	
	@ModelAttribute(value = "title")
	public String projectTitle() {
		return "testBookStore";
	}
	
	@ModelAttribute("totalCartproducts")
	public BigInteger getTotalCartproducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") == null) {
			return BigInteger.ZERO;
		}
		
		Cart cart = (Cart) session.getAttribute("cart");
		return cart.totalCartProduct();
	}
	
	// lay thong tin user dang nhap
	@ModelAttribute("loginedUser")
	public User getLoginedUser() {
		
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
	}
	
	// kiem tra da login hay chua
	@ModelAttribute
	public boolean isLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
	}
	
}
