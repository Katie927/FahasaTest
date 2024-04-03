package vn.devpro.testBookstore.controller.backend;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.model.Category;
import vn.devpro.testBookstore.model.User;
import vn.devpro.testBookstore.service.CategoryService;
import vn.devpro.testBookstore.service.UserService;

@Controller
@RequestMapping("/admin/category/")
public class AdminCategoryController extends BaseController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "list")
	public String list(final Model model) {
		//	-------- Category-list --------------------------
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories",categories);
		return "backend/list-categories";
	}

// 	---------------- add-category -------------------------------	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Category category = new Category();
		category.setCreateDate(new Date());
		
		model.addAttribute("category", category);
		
		return "backend/add-category";
	}
	// --- save new category----------
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
							@ModelAttribute("category") Category category) {
		
		categoryService.saveOrUpdate(category);
		
		return "redirect:/admin/categories/list";
		
	}
	
//	----------------- edit category ---------------------
	@RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
	public String edit(final Model model,
						@PathVariable("categoryId") int categoryId) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		// lay category trong DB bang id
		Category category = categoryService.getById(categoryId);
		category.setUpdateDate(new Date());
		
		model.addAttribute("category", category);
		
		return "backend/edit-category";
		
	}
	
	//	------ save edit product -------------
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
							@ModelAttribute("category") Category category) {
		
		categoryService.saveOrUpdate(category);
		
		return "redirect:/admin/category/list";
		
	}
	
//	-------------- delete category	----------------
//	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
//	public String delete(final Model model,
//							@PathVariable("categoryId") int categoryId) {
//		
//		categoryService.deleteCategoryById(categoryId);
//		
//		return  "redirect:/admin/category/list";
//	}
	
	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
	public String delete(final Model model,
							@PathVariable("categoryId") int categoryId) {
		
		// lay category trong DB
		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.inactiveCategory(category);
		
		return  "redirect:/admin/category/list";
	}
	
}
