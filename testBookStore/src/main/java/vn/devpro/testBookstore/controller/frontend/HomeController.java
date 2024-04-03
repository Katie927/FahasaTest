package vn.devpro.testBookstore.controller.frontend;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.model.Product;
import vn.devpro.testBookstore.service.ProductService;

@Controller
public class HomeController extends BaseController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	//	 anh xa mot action den mot action method trong controller
	public String index(final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response) throws IOException {
		
		List<Product> hotProducts = productService.findHotProduct();
		Collections.shuffle(hotProducts);
		model.addAttribute("hotProducts",hotProducts);
		
		List<Product> products = productService.findAllActive();
		Collections.shuffle(products);
		model.addAttribute("products",products);
		
		return "frontend/index";
	}	
	
}
