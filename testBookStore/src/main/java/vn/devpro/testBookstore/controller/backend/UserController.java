package vn.devpro.testBookstore.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.devpro.testBookstore.controller.BaseController;
import vn.devpro.testBookstore.model.Role;
import vn.devpro.testBookstore.model.User;
import vn.devpro.testBookstore.service.RoleService;
import vn.devpro.testBookstore.service.UserService;

@Controller
@RequestMapping("/admin/user/")
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "list")
	public String list(final Model model) {
		//	-------- User-list --------------------------
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		return "backend/list-users";
	}
	
//	----------------- edit user ---------------------
	@RequestMapping(value = "edit/{userId}", method = RequestMethod.GET)
	public String edit(final Model model,
						@PathVariable("userId") int userId) {
		
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		
		// lay category trong DB bang id
		User user = userService.getById(userId);
		user.setUpdateDate(new Date());
		
		List<Role> userRoles = user.getRoles();
		model.addAttribute("userRoles", userRoles);
		
		model.addAttribute("user", user);
		
		return "backend/account";
		
	}
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
							@RequestParam("roles") int roleID,
							@ModelAttribute("user") User user) {
		
//		Role role = roleService.getById(roleID);
//		user.removeRelationalUserRole(user.getRoles().get(0));
//		user.addRelationalUserRole(role);
//		userService.saveOrUpdate(user);
		
		Role role = roleService.getById(roleID);
		List<Role> roles = new ArrayList<Role>();
		roles.add(role);
		user.setRoles(roles);
		userService.saveOrUpdate(user);

	    return "redirect:/admin/user/list";
		
	}
	
}

////--------------- Mapping many-to-many: tbl_user-to-tbl_role -------------------
//@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
//private List<Role> roles = new ArrayList<Role>();
//
//// add and remove elements out of relational user-role list
//public void addRelationalUserRole(Role role) {
//	role.getUsers().add(this);
//	roles.add(role);
//}
//
//public void removeRelationalUserRole(Role role) {
//	role.getUsers().remove(this);
//	roles.remove(role);
//}
//
////	----------------- Mapping many-to-many: tbl_role-to-tbl_user --------------------
//// First side: owner (user has some roles)
//@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//@JoinTable(name = "tbl_user_role", joinColumns = @JoinColumn(name = "role_id"),
//			inverseJoinColumns = @JoinColumn(name = "user_id"))
//private List<User> users = new ArrayList<User>();
////---------------------------------------------------------------------------------
//<sf:select path="roles" class="form-control"
//										id="roles" style="padding: 7px">
//									<sf:options items="${roles }" itemValue="id"
//										itemLabel="name"></sf:options>
//							</sf:select>
//lam sao toi co the cap nhat role cho user voi nhung code nhu tren?
