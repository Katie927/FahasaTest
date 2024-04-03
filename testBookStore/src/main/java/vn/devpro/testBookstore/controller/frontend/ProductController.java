package vn.devpro.testBookstore.controller.frontend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.model.Category;
import vn.devpro.testBookstore.model.Product;
import vn.devpro.testBookstore.model.ProductImage;
import vn.devpro.testBookstore.model.Publisher;
import vn.devpro.testBookstore.service.CategoryService;
import vn.devpro.testBookstore.service.ProductImageService;
import vn.devpro.testBookstore.service.ProductService;
import vn.devpro.testBookstore.service.PublishService;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private PublishService publishService;

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductImageService productImageService;

	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	// anh xa mot action den mot action method trong controller
	public String product(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException {

		Product product = productService.getById(productId);
		model.addAttribute("product", product);

		// lay anh trong tbl_product_image
		List<ProductImage> productImages = productImageService.getProductImageById(productId);
		model.addAttribute("productImages", productImages);
		
		List<Product> products = productService.findAllActive();
		Collections.shuffle(products);
		model.addAttribute("products",products);

		return "frontend/product";
	}
	
//	@RequestMapping(value = "/category-u", method = RequestMethod.GET)
//	//	 anh xa mot action den mot action method trong controller
//	public String category(final Model model,
//						final HttpServletRequest request,
//						final HttpServletResponse response) throws IOException {
//		
//		List<Category> categories = categoryService.findAllActive();
//		model.addAttribute("categories", categories);
//		List<Product> products = productService.findAllActive();
//		Collections.shuffle(products);
//		model.addAttribute("products", products);
//		
//		return "frontend/category";
//	}	

	@RequestMapping(value = "/category-u", method = RequestMethod.GET)
	public String category(@RequestParam(value = "category", required = false) Integer categoryId,
							@RequestParam(value = "publisher", required = false) Integer publisherId,
							@RequestParam(value = "minPrice", required = false) BigDecimal minPrice,
	                        @RequestParam(value = "maxPrice", required = false) BigDecimal maxPrice,
	                        @RequestParam(value = "keyword", required = false) String keyword,
							final Model model,
							final HttpServletRequest request,
							final HttpServletResponse response) throws IOException {

	    List<Category> categories = categoryService.findAllActive();
	    model.addAttribute("categories", categories);
	    
	    List<Publisher> publishers = publishService.findAllActive();
	    model.addAttribute("publishers", publishers);

	    List<Product> products;
	    if (categoryId != null) {
	        // Tìm kiếm sản phẩm theo categoryId
	        products = productService.findByCategoryId(categoryId);
	    } else if (publisherId != null) {
	        // Tìm kiếm sản phẩm theo categoryId
	        products = productService.findByPublisherId(publisherId);
	    } else if (minPrice != null && maxPrice != null) {
	        // Tìm kiếm sản phẩm theo khoảng giá tiền
	        products = productService.findByPrice(minPrice, maxPrice);
	    } else if (keyword != null && keyword != null) {
	        // Tìm kiếm sản phẩm theo khoảng giá tiền
	        products = productService.findByKeyword(keyword);
	    } else {
	        // Nếu không có categoryId, hiển thị tất cả sản phẩm
	        products = productService.findAllActive();
	    }

	    Collections.shuffle(products);
	    model.addAttribute("products", products);

	    return "frontend/category";
	}
	
//	@RequestMapping(value = "/{path}", method = RequestMethod.GET)
//	public String find(@RequestParam(value = "keyword", required = false) String keyword,
//							@PathVariable("path") String path,
//							final Model model,
//							final HttpServletRequest request,
//							final HttpServletResponse response) throws IOException {
//
//	    List<Product> products;
//	    if (keyword != null && keyword != null) {
//	        // Tìm kiếm sản phẩm theo khoảng giá tiền
//	        products = productService.findByKeyword(keyword);
//	    } else {
//	        // Nếu không có categoryId, hiển thị tất cả sản phẩm
//	        products = productService.findAllActive();
//	    }
//
//	    Collections.shuffle(products);
//	    model.addAttribute("products", products);
//
//	    return "frontend/category";
//	}
	
//	function searchByKeyword() {
//	    var _keyword = document.getElementById('search_box').value;
//	    window.location.href = '/category-u?keyword=' + _keyword;
//	}
	
	@RequestMapping(value = "/{path}", method = RequestMethod.GET)
	public String category(@RequestParam(value = "keyword", required = false) String keyword,
							@PathVariable("path") String path,
	                       final Model model,
	                       final HttpServletRequest request,
	                       final HttpServletResponse response) throws IOException {

	    List<Product> products;
	    if (keyword != null) {
	        // Tìm kiếm sản phẩm theo từ khóa
	        products = productService.findByKeyword(keyword);
	    } else {
	        // Nếu không có từ khóa, hiển thị tất cả sản phẩm
	        products = productService.findAllActive();
	    }

	    Collections.shuffle(products);
	    model.addAttribute("products", products);

	    return "frontend/category";
	}
	
}
