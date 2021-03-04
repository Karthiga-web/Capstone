package com.hcl.controller;

import com.hcl.service.ProductService;
import com.hcl.entity.Product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class AdminController {

    ProductService productService;

    public void ProductsController(ProductService productService) {
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
    public String newProductForm(@ModelAttribute("product") Product product, Model model) {
        Optional<Product> productCheck = productService.findProductById(product.getId());
        if (productCheck.isPresent()) {
            model.addAttribute("message", "Product Already Exists!Try a different one!");
            return "/newProduct";
        } else {
            String save = saveProductMethod(product);
            if (save.equals("Saved")) {
                model.addAttribute("message", "Product created Successfully!");
                return "/adminProduct";
            } else {
                model.addAttribute("message", "Error Occured. Please Try again!");
                return "/newProduct";
            }
        }
    }

    public String saveProductMethod(Product product) {
        try {
            productService.saveProduct(product);
            return "Saved";
        } catch (Exception e) {
            return "Error";
        }
    }


}
