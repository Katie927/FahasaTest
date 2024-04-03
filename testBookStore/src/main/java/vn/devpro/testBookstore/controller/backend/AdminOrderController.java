package vn.devpro.testBookstore.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.testBookstore.model.SaleOrder;
import vn.devpro.testBookstore.service.SaleOrderService;

@Controller
@RequestMapping("/admin/order/")
public class AdminOrderController {
	
	@Autowired
	SaleOrderService saleOrderService;

	@RequestMapping(value = "complete/{orderId}", method = RequestMethod.GET)
	public String complete(final Model model, @PathVariable("orderId") int orderId) {
		// lay category trong DB
		SaleOrder saleOrder = saleOrderService.getById(orderId);
		saleOrder.setSaleStatus(1);
		saleOrderService.completeOrder(saleOrder);

		return "redirect:/admin/index";
	}
	
	@RequestMapping(value = "cancel/{orderId}", method = RequestMethod.GET)
	public String cancel(final Model model, @PathVariable("orderId") int orderId) {
		// lay category trong DB
		SaleOrder saleOrder = saleOrderService.getById(orderId);
		saleOrder.setSaleStatus(2);
		saleOrderService.completeOrder(saleOrder);

		return "redirect:/admin/index";
	}
	
}
