package com.hcl.controller;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hcl.entity.Order;
import com.hcl.entity.Product;
import com.hcl.entity.User;
import com.hcl.service.CartService;
import com.hcl.service.OrderService;
import com.hcl.service.ProductService;
import com.hcl.service.UserService;

@Controller
public class ProductsController {
	@Autowired
	ProductService service;

	@Autowired
	UserService userService;

	@Autowired
	CartService cartService;

	@Autowired
	OrderService orderService;

	Logger logger = LoggerFactory.getLogger(ProductsController.class);

	@GetMapping("/")
	String hello() {
		logger.info("Mapping to index");
		return "index";
	}

	@GetMapping("/search")
	public String getAllByQuery (@RequestParam(name="search") String query, ModelMap model) {
		List<Product> productList = service.getAllByQuery(query,query,query);
		model.addAttribute("products", productList);
		return "product";
	}

	@PostMapping("/decide")
	public String find(@RequestParam(name = "button") String buttonValue, ModelMap model) {
		logger.info("Finding user clicked which button");
		if (buttonValue.equals("Login")) {
			return "login";
		} else if (buttonValue.equals("Product")) {
			List<Product> products = service.getAllProducts();
			model.addAttribute("products", products);
			return "product";
		} else if (buttonValue.equals("Cart")) {
			Long userCartId = getUserIdMethod();
			List<Order> order = cartService.cartMethod(userCartId);
			model.addAttribute("orders", order);
			return "cart";
		} else {
			return "register";
		}
	}

	// Gets Product View
	@GetMapping("/product")
	String getProductView(ModelMap model) {
		logger.info("Mapping to products");
		List<Product> products = service.getAllProducts();
		model.addAttribute("products", products);
		return "product";
	}

	public Long getUserIdMethod() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Optional<User> usercheck = null;
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			String currentUserName = authentication.getName();
			usercheck = userService.findByUserName(currentUserName);
		}
		return usercheck.get().getUserId();
	}

	@RequestMapping(value = "/login")
	public String getLoginPage(@RequestParam(name = "error", required = false) String error, Model model,
			@RequestParam(name = "logout", required = false) String logout) {
		if (error != null) {
			model.addAttribute("error", "Invalid Username or Password");
		}
		if (logout != null) {
			model.addAttribute("logout", "You have Successfully Logged Out");
		}
		return "login";
	}
	String role;
	@PostMapping("/postLogin")
	public String postLogin(@RequestParam(name="userName") String userName) {
		UserDetails u = userService.loadUserByUsername(userName);
		u.getAuthorities().forEach(a->{
				role = a.getAuthority();
		});
		if(role.equalsIgnoreCase("ROLE_ADMIN")){
			return "adminHome";
		}else {
			return "index";
		}
	}

	// Gets register View
	@GetMapping("/register")
	String getRegisterView(ModelMap model) {
		return "register";
	}

	@PostMapping("/registerdone")
	public String registerUser(@ModelAttribute("user") User user, ModelMap model) {
		logger.info("registration page entered");
		Optional<User> usercheck = userService.findByUserName(user.getUserName());
		if (usercheck.isPresent()) {
			model.addAttribute("message", "Username Already Exists!Try a different one!");
			return "/register";
		} else {
			String save = saveUserMethod(user);
			if (save.equals("Saved")) {
				model.addAttribute("message", "Customer registered Successfully!");
				return "/registrationsuccess";
			} else {
				model.addAttribute("message", "Error Occured on Registration. Please Try again!");
				return "/register";
			}
		}
	}

	public String saveUserMethod(User user) {
		try {
			userService.saveMethod(user);
			return "Saved";
		} catch (Exception e) {
			return "Error";
		}
	}

	@PostMapping("/success")
	public String success() {
		return "login";
	}

	@GetMapping("/viewdetail/{id}")
	public String viewProductDetail(@PathVariable String id, ModelMap model) {
		logger.info("update task page entered");
		long productId;
		productId = Long.parseLong(id);
		Optional<Product> productEntity = service.findProductById(productId);
		Product newProductEntity = productEntity.get();
		if (productEntity.isPresent()) {
			model.addAttribute("category", newProductEntity.getCategory());
			model.addAttribute("condition", newProductEntity.getCondition());
			model.addAttribute("image", newProductEntity.getBase64image());
			model.addAttribute("name", newProductEntity.getName());
			model.addAttribute("price", newProductEntity.getPrice());
			return "viewDetail";
		} else {
			List<Product> tasks = service.getAllProducts();
			model.addAttribute("products", tasks);
			model.addAttribute("message", "Product Not found! Error!");
			return "product";
		}
	}
}
