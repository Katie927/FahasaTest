package vn.devpro.testBookstore.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.dto.SearchModel;
import vn.devpro.testBookstore.model.Category;
import vn.devpro.testBookstore.model.Product;
import vn.devpro.testBookstore.model.Publisher;
import vn.devpro.testBookstore.model.User;
import vn.devpro.testBookstore.service.CategoryService;
import vn.devpro.testBookstore.service.ProductService;
import vn.devpro.testBookstore.service.PublishService;
import vn.devpro.testBookstore.service.UserService;

@Controller
@RequestMapping("/admin/product/")
public class AdminProductController extends BaseController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	@Autowired
	private PublishService publishService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, final HttpServletRequest request) {

		SearchModel productSearch = new SearchModel();
// tim theo status
		productSearch.setStatus(2); // all
		String status = request.getParameter("status");
		if (!StringUtils.isEmpty(status)) {
			productSearch.setStatus(Integer.parseInt(status));
		}

// tim theo category
		productSearch.setCategoryId(0); // all
		String categoryId = request.getParameter("categoryId");
		if (!StringUtils.isEmpty(categoryId)) {
			productSearch.setCategoryId(Integer.parseInt(categoryId));
		}
		
// tim theo publisher
		productSearch.setPublisherId(0); // all
		String publisherId = request.getParameter("publisherId");
		if (!StringUtils.isEmpty(publisherId)) {
			productSearch.setPublisherId(Integer.parseInt(publisherId));
		}

// tim theo keyword
		productSearch.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword)) {
			productSearch.setKeyword(keyword);
		}
//	tim kiem theo ngay
		String beginDate = null;
		String endDate = null;
		if(!StringUtils.isEmpty(request.getParameter("beginDate")) 
										&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		productSearch.setBeginDate(beginDate);
		productSearch.setEndDate(endDate);
		

//		//_______ Category-list____________
//		List<Category> categories = categoryService.findAll();
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
//		//_______ Category-list____________
//		List<Category> categories = categoryService.findAll();
		List<Publisher> publishers = publishService.findAllActive();
		model.addAttribute("publishers", publishers);

		// ------ Product-List------------
		
//		List<Product> allProducts = productService.searchProduct(productSearch);
		
		List<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products", products);
//		model.addAttribute("productSearch", productSearch);

		return "backend/list-products";

	}

// 	------------------------------ 	view add-product -------------------------
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {

		List<Product> products = productService.findAll();
		model.addAttribute("products", products);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		List<Publisher> publishers = publishService.findAll();
		model.addAttribute("publishers", publishers);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		Product product = new Product();
		product.setCreateDate(new Date());

		model.addAttribute("product", product);

		return "backend/add-product";
	}

//	---------------- save add product ---------------------------------------
	// save new product
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String productAddSave(final Model model, @ModelAttribute("product") Product product,
			@ModelAttribute("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException {

		// lay danh sach tu tbl_product trong DB
		productService.saveAddProduct(product, avatarFile, imageFiles);

		return "redirect:/admin/product/list";
	}

// 	---------------- delete product ---------------------------------------
//	public String delete(final Model model, @PathVariable("productId") int productId) {
//
//		// lay product trong DB
//		Product product = productService.getById(productId);
//		product.setStatus(false);
//
//		return null;
//	}

//	-------------------edit product -------------------------------------------
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	public String edit(final Model model, @PathVariable("productId") int productId) {

//		List<Product> products = productService.findAll();
//		model.addAttribute("products", products);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		List<Publisher> publishers = publishService.findAll();
		model.addAttribute("publishers", publishers);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		// lay product trong DB
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());

		model.addAttribute("product", product);

		return "backend/edit-product";
	}

	// save edit product
	@RequestMapping(value = "/edit-save", method = RequestMethod.POST)
	public String productEditSave(final Model model, @ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException {

		// lay danh sach tu tbl_product trong DB
		productService.saveEditProduct(product, avatarFile, imageFiles);

		return "redirect:/admin/product/list";

	}

//	---------------- DELETE / INACTIVE product -------------------------
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	public String delete(final Model model, @PathVariable("productId") int productId) {

		// lay product trong DB
		Product product = productService.getById(productId);
		product.setStatus(false);
		productService.saveOrUpdate(product);

		return "redirect:/admin/product/list";

	}

}
