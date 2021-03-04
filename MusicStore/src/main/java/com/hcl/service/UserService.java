package com.hcl.service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.hcl.entity.User;

public interface UserService  extends UserDetailsService {

	List<User> findAllUsers();

	Optional<User> findByUserName(String userName);

	void saveMethod(User user);

	void deleteUserById(Long id);
}
