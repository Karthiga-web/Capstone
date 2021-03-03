package com.hcl.service;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.hcl.entity.User;

public interface UserService  extends UserDetailsService {

	Optional<User> findByUserName(String userName);

	void saveMethod(User user);
}
