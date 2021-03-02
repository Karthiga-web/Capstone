package com.hcl.service;

import java.util.Optional;

import com.hcl.entity.User;

public interface UserService {

	Optional<User> findByUserName(String userName);

	void saveMethod(User user);
}
