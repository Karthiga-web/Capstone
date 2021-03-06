package com.hcl.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hcl.entity.Order;
import com.hcl.entity.Product;
import com.hcl.entity.User;
import com.hcl.service.OrderService;
import com.hcl.service.ProductService;
import com.hcl.service.UserService;

@Controller
public class OrderController {
	@Autowired
	ProductService service;

	@Autowired
	UserService userService;

	@Autowired
	OrderService orderService;
	long total = 0;
	Logger logger = LoggerFactory.getLogger(OrderController.class);

	String role;

	@PostMapping("/order")
	public String orderNow(@ModelAttribute("product") Product product, @RequestParam(name = "id") String id,
			@RequestParam(name = "button") String buttonValue, ModelMap model) {
		if (buttonValue.equalsIgnoreCase("Back")) {
			List<Product> tasks = service.getAllProducts();
			model.addAttribute("products", tasks);
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			authentication.getAuthorities().forEach(a -> {
				role = a.getAuthority();
			});
			model.addAttribute("username", authentication.getName());
			if (role.equalsIgnoreCase("ROLE_ADMIN")) {
				return "adminProduct";
			} else if (role.equalsIgnoreCase("ROLE_USER")) {
				return "productloggeduser";
			}else {
			return "product";
			}
		} else {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			Optional<User> usercheck = null;
			Optional<Product> productcheck = null;
			authentication.getAuthorities().forEach(a -> {
				role = a.getAuthority();
			});
			if (!(authentication instanceof AnonymousAuthenticationToken) &&  role.equalsIgnoreCase("ROLE_USER")) {
				String currentUserName = authentication.getName();
				usercheck = userService.findByUserName(currentUserName);
				productcheck = service.findProductById(product.getId());
				service.saveToCart(productcheck.get().getId(), usercheck.get().getUserId());
				List<Product> tasks = service.getAllProducts();
				model.addAttribute("products", tasks);
				model.addAttribute("username", authentication.getName());
				model.addAttribute("message", "Product added to cart!");
				if (role.equalsIgnoreCase("ROLE_ADMIN")) {
					return "adminProduct";
				} else if (role.equalsIgnoreCase("ROLE_USER")) {
					return "productloggeduser";
				}else {
				return "product";
				}
			} else {
				return "login";
			}
		}
	}

	@GetMapping("/cartRemove/{id}")
	public String removeFromCart(@PathVariable String id, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Optional<User> usercheck = null;
		if (!(authentication instanceof AnonymousAuthenticationToken) && role.equalsIgnoreCase("ROLE_USER")) {
			String currentUserName = authentication.getName();
			usercheck = userService.findByUserName(currentUserName);
		}
		logger.info("update task page entered");
		long orderId;
		orderId = Long.parseLong(id);
		Optional<Order> orderEntity = orderService.findOrderById(orderId);
		Order newProductEntity = orderEntity.get();
		if (orderEntity.isPresent()) {
			orderService.deleteOrder(newProductEntity);
			List<Order> orders = orderService.getAllOrders(usercheck.get().getUserId());
			model.addAttribute("orders", orders);
			model.addAttribute("username", authentication.getName());
			model.addAttribute("message", "Order was removed!");
			return "cart";
		} else {
			List<Order> orders = orderService.getAllOrders(usercheck.get().getUserId());
			model.addAttribute("orders", orders);
			model.addAttribute("username", authentication.getName());
			model.addAttribute("message", "Order cannot be removed! Error!");
			return "cart";
		}
	}

	@PostMapping("/cartAction")
	public String clearCart(@RequestParam(name = "button") String buttonValue, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Optional<User> usercheck = null;
		if (!(authentication instanceof AnonymousAuthenticationToken) && role.equalsIgnoreCase("ROLE_USER")) {
			String currentUserName = authentication.getName();
			usercheck = userService.findByUserName(currentUserName);
		}
		if (buttonValue.equals("Clear Cart")) {
			orderService.clearCart(usercheck.get().getUserId());
			model.addAttribute("username", authentication.getName());
			model.addAttribute("message", "Empty Cart!");
			return "cart";
		} else if (buttonValue.equals("Check Out")) {
			total = 0;
			model.addAttribute("Address",
					(usercheck.get().getApartmentNumber() + ", " + usercheck.get().getAddress() + ", " + "\n"
							+ usercheck.get().getCity() + ", " + "\n" + usercheck.get().getState() + ", " + "\n"
							+ usercheck.get().getCountry() + "-" + usercheck.get().getZipcode()));

			LocalDate dateObj = LocalDate.now();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(sdf.parse(dateObj.toString()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.add(Calendar.DAY_OF_MONTH, 3);
			String newDate = sdf.format(c.getTime());
			LocalDate current = LocalDate.parse(newDate);
			model.addAttribute("date",
					(current.getMonth().toString().substring(0, 1)
							+ current.getMonth().toString().substring(1, 3).toLowerCase() + " "
							+ current.getDayOfMonth() + ", " + current.getYear()));
			List<Order> orders = orderService.getAllOrders(usercheck.get().getUserId());
			model.addAttribute("orders", orders);
			total = getTotalMethod(orders);
			model.addAttribute("total", ("$" + total));
			model.addAttribute("username", authentication.getName());
			return "receipt";
		} else {
			List<Product> products = service.getAllProducts();
			model.addAttribute("products", products);
			authentication.getAuthorities().forEach(a -> {
				role = a.getAuthority();
			});
			model.addAttribute("username", authentication.getName());
			if (role.equalsIgnoreCase("ROLE_ADMIN")) {
				return "adminProduct";
			} else if (role.equalsIgnoreCase("ROLE_USER")) {
				return "productloggeduser";
			} else {
			return "product";
		}
	}
	}

	private long getTotalMethod(List<Order> orders) {
		orders.stream().forEach(o -> {
			total = total + o.getPrice();
		});
		return total;
	}

	@PostMapping("/submitOrder")
	public String submitOrder(@RequestParam(name = "button") String buttonValue, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Optional<User> usercheck = null;
		if (!(authentication instanceof AnonymousAuthenticationToken) && role.equalsIgnoreCase("ROLE_USER")) {
			String currentUserName = authentication.getName();
			usercheck = userService.findByUserName(currentUserName);
		}
		if (buttonValue.equalsIgnoreCase("Back") || buttonValue.equalsIgnoreCase("Cancel")) {
			List<Order> orders = orderService.getAllOrders(usercheck.get().getUserId());
			model.addAttribute("username", authentication.getName());
			model.addAttribute("orders", orders);
			return "cart";
		} else {
			orderService.changeStatus(usercheck.get().getUserId());
			model.addAttribute("username", authentication.getName());
			return "success";
		}
	}
}
