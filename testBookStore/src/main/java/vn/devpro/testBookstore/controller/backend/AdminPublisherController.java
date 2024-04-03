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
import vn.devpro.testBookstore.model.Publisher;
import vn.devpro.testBookstore.model.User;
import vn.devpro.testBookstore.service.PublishService;
import vn.devpro.testBookstore.service.UserService;

@Controller
@RequestMapping("/admin/publisher/")
public class AdminPublisherController extends BaseController {
	
	@Autowired
	private PublishService publishService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "list")
	public String list(final Model model) {
		//	-------- Category-list --------------------------
		List<Publisher> publishers = publishService.findAll();
		model.addAttribute("publishers", publishers);
		return "backend/list-publisher";
	}
	
// 	---------------- add-category -------------------------------	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Publisher publisher = new Publisher();
		publisher.setCreateDate(new Date());
		
		model.addAttribute("publisher", publisher);
		
		return "backend/add-publisher";
	}
	// --- save new category----------
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
							@ModelAttribute("publisher") Publisher publisher) {
		
		publishService.saveOrUpdate(publisher);
		
		return "redirect:/admin/publisher/list";
		
	}
	
//	----------------- edit category ---------------------
	@RequestMapping(value = "edit/{publisherId}", method = RequestMethod.GET)
	public String edit(final Model model,
						@PathVariable("publisherId") int publisherId) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		// lay category trong DB bang id
		Publisher publisher = publishService.getById(publisherId);
		publisher.setUpdateDate(new Date());
		
		model.addAttribute("publisher", publisher);
		
		return "backend/edit-publisher";
		
	}
	
	//	------ save edit product -------------
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
							@ModelAttribute("publisher") Publisher publisher) {
		
		publishService.saveOrUpdate(publisher);
		
		return "redirect:/admin/publisher/list";
		
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
	
	@RequestMapping(value = "delete/{publisherId}", method = RequestMethod.GET)
	public String delete(final Model model,
							@PathVariable("publisherId") int publisherId) {
		
		// lay category trong DB
		Publisher publisher = publishService.getById(publisherId);
		publisher.setStatus(false);
		publishService.inactivePublisher(publisher);
		
		return  "redirect:/admin/publisher/list";
	}
	
	
}
