package vn.devpro.testBookstore.controller.frontend;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.dto.Cart;
import vn.devpro.testBookstore.dto.Customer;
import vn.devpro.testBookstore.dto.ProductCart;
import vn.devpro.testBookstore.dto.prjConstant;
import vn.devpro.testBookstore.model.Product;
import vn.devpro.testBookstore.model.SaleOrder;
import vn.devpro.testBookstore.model.SaleOrderProduct;
import vn.devpro.testBookstore.model.User;
import vn.devpro.testBookstore.service.ProductService;
import vn.devpro.testBookstore.service.SaleOrderService;

@Controller
public class CartController extends BaseController implements prjConstant {

	@Autowired
	ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;

	// them mot san pham vao gio hang
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException {

		HttpSession session = request.getSession();

		Cart cart = null;

		// lay gio hang trong session
		// kiem tra gio hang da duoc tao trong session chua
		if (session.getAttribute("cart") != null) { // da co gio hana
			cart = (Cart) session.getAttribute("cart"); // lay gio hang
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// lay san pham trong DB
		Product dbProduct = productService.getById(addProduct.getProductId());

		// ktra san pham dat mua co trong gio hang chua
		int index = cart.findProductById(dbProduct.getId());
		if (index != -1) { // san pham da co trong gio hang
			cart.getProductCarts().get(index)
					.setQuantity(cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		} else { // chua co trong gio hang
			addProduct.setProductName(dbProduct.getName());
			addProduct.setAvatar(dbProduct.getAvatar());
			addProduct.setPrice(dbProduct.getPrice());

			cart.getProductCarts().add(addProduct); // them sp moi vao gio hang
		}

		// thiet lap lai gio hang trong session
		session.setAttribute("cart", cart);

		// tra du lieu ve cho view
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("message", "Da them " + addProduct.getProductName() + " vao gio hang");

		return ResponseEntity.ok(jsonResult);
	}

	// hien thi gio hang
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());

			String message = cart.totalCartProduct() + " trong gio hang";
			model.addAttribute("message", message);
		} else {
			String errorMessage = "Khong co san pham trong gio hang";
			model.addAttribute("errorMessage", errorMessage);
		}
		return "frontend/cart";
	}

	// them/bot san pham trong gio hang
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> updateProductQuantity(@RequestBody ProductCart productCart,
			final HttpServletRequest request) throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			// cap nhat so luong
			int index = cart.findProductById(productCart.getProductId());
			BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
			BigInteger newQuantity = oldQuantity.add(productCart.getQuantity()); // +1//-1
			if (newQuantity.intValue() < 1) {
				newQuantity = BigInteger.ONE;
			}
			cart.getProductCarts().get(index).setQuantity(newQuantity);
			jsonResult.put("newQuantity", newQuantity);
		}
		jsonResult.put("productId", productCart.getProductId());
		return ResponseEntity.ok(jsonResult);
	}

	// dat don hang
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> placeOrder(@RequestBody Customer customer,
			final HttpServletRequest request) throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		// kiem tra thong tin customer bat buooc
		if(customer.getTxtName() == null || customer.getTxtName().length() <= 0 ) {
			jsonResult.put("message", "Can co ten khach hang!");
		}
		else if(customer.getTxtMobile() == null || customer.getTxtMobile().length() <= 0 ) {
			jsonResult.put("message", "Can co so dien thoai khach hang!");
		}
		else {
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") == null) {
				jsonResult.put("message", "chua co san pham nao trong gio hang cua ban");
			}
			else {
				Cart cart = (Cart) session.getAttribute("cart");
				// luu caca san pham trong gio hang vao tbl_sale_order_product
				SaleOrder saleOrder = new SaleOrder();
				for(ProductCart productCart:cart.getProductCarts()) {
					SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
					// lay product trong db
					Product dbProduct = productService.getById(productCart.getProductId());
					saleOrderProduct.setProduct(dbProduct);
					saleOrderProduct.setQuantity(productCart.getQuantity().intValue());
					
					saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
				}
				// luu don hang vao ttbl_sale_order
				Calendar cal = Calendar.getInstance();
				String code = cal.get(Calendar.YEAR) + cal.get(Calendar.MONTH) + cal.get(Calendar.DAY_OF_MONTH) + customer.getTxtMobile(); 
				saleOrder.setCode(code);
				
				User user = new User();
				user.setId(1);
				saleOrder.setUser(user);
				
				saleOrder.setCustomerName(customer.getTxtName());
				saleOrder.setCustomerMobile(customer.getTxtMobile());
				saleOrder.setCustomerEmail(customer.getTxtEmail());
				saleOrder.setCustomerAddress(customer.getTxtAddress());
				saleOrder.setTotal(cart.totalCartPrice());
				saleOrder.setCreateDate(new Date());
				
				saleOrderService.saveOrder(saleOrder);
				
				jsonResult.put("message", "Dat hang thanh cong!");
			}
		}

		return ResponseEntity.ok(jsonResult);
	}

}
