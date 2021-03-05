package com.hcl.controller;

import com.hcl.entity.User;
import com.hcl.service.ProductService;
import com.hcl.entity.Product;

import com.hcl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @GetMapping("/adminCreateProduct")
    String getCreateProductView(ModelMap model) {
        return "adminCreateProduct";
    }

    @PostMapping("/admin-new")
    public String newProductForm(@ModelAttribute("product") Product product1,
    		@RequestParam("image345") MultipartFile multipartFile,
                                 ModelMap modelMap
    ) throws IOException {
        Optional<Product> productCheck = productService.findProductByName(product1.getName());
        if (productCheck.isPresent()) {
            modelMap.addAttribute("message", "Product Already Exists!Try a different one!");
            return "/admin-new";
        } else {
        	product1.setCategory(product1.getCategory());
        	product1.setCondition(product1.getCondition());
        	product1.setPrice(product1.getPrice());
        	product1.setName(product1.getName());
            product1.setImage(multipartFile.getBytes());
            productService.saveProduct(product1);
            List<Product> products = productService.getAllProducts();
            modelMap.addAttribute("products", products);
            return "/adminProduct";
        }
    }

    // PRODUCT MAPPING
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

    @GetMapping("/adminProduct")
    public String showProducts(ModelMap modelMap) {
        List<Product> products = productService.getAllProducts();
        modelMap.addAttribute("products", products);
        return "adminProduct";
    }

    @PostMapping("/productFormDone")
    public String updateProduct(@ModelAttribute("product") Product product, ModelMap modelMap) {
        String added = saveProductMethod(product);
        if(added.equals("Saved")) {
            modelMap.addAttribute("message", "Product added!");
            return "/adminProduct";
        }else {
            modelMap.addAttribute("message", "Unable to add product");
            return "/productForm";
        }
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


    //USER MAPPING
    @GetMapping("/adminCustomerManage")
    public String showCustomerPage(ModelMap modelMap) {
        List<User> users = userService.findAllUsers();
        List<User> newUsers = new ArrayList<>();
        users.stream().forEach(a->{
            a.getRoles().forEach(r->{
                if(r.getRole().equalsIgnoreCase("ROLE_USER")){
                    newUsers.add(a);
                }
            });
        });
        modelMap.addAttribute("users", newUsers);

        return "adminCustomerManage";
    }



    @GetMapping("/delete-user/{userId}")
    public String deleteUserById(@PathVariable String userId, ModelMap modelMap) {
        userService.deleteUserById(Long.parseLong(userId));
        List<User> users = userService.findAllUsers();
        modelMap.addAttribute("users", users);
        return "adminCustomerManage";
    }




}
