package vn.devpro.testBookstore.controller.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.model.SaleOrder;
import vn.devpro.testBookstore.service.SaleOrderService;

@Controller
@RequestMapping("/admin/")
public class HomeAdminController extends BaseController {
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(final Model model) {
		
		List<SaleOrder> saleOrders = saleOrderService.findAll();
		model.addAttribute("saleOrders", saleOrders);
		
		return "backend/index";
	}
	
}
