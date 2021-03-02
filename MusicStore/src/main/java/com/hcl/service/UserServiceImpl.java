package com.hcl.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hcl.entity.Role;
import com.hcl.entity.User;
import com.hcl.repository.RoleRepository;
import com.hcl.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository;
	
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Configuration
	static class BCryptPasswordEncoderContextConfiguration {

		@Bean
		public BCryptPasswordEncoder employeeService() {
			return new BCryptPasswordEncoder();
		}
	}

	@Autowired
	public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	public Optional<User> findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}


	@Override
	public void saveMethod(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setActive(user.getActive());
		user.getRoles().stream().forEach(f -> {
			Role userRole = roleRepository.findByRole(f.getRole());
			user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		});
		userRepository.save(user);
	}

}
