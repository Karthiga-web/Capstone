package com.hcl.controller;

import com.hcl.entity.Order;
import com.hcl.entity.Product;
import com.hcl.entity.User;
import com.hcl.service.OrderService;
import com.hcl.service.ProductService;
import com.hcl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {

    ProductService productService;

    public AdminController(ProductService productService) {
        this.productService = productService;
    }


    @GetMapping("/admin-update/{id}")
    public String updateProduct(@PathVariable String id, Model model){
        model.addAttribute("product", productService.findProductById(Long.valueOf(id)));
        return "productForm";
    }

    @GetMapping("admin-delete/{id}")
    public String deleteById(@PathVariable String id){
        productService.deleteById(Long.valueOf(id));
        return "adminProduct";
    }

    @PostMapping("/admin-save")
    public String saveProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product);
        return "adminProduct";
    }

    @GetMapping("/admin-new")
    public String newProductForm(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "newProduct";
    }
}
