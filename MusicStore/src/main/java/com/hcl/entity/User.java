package com.hcl.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	Long userId;
	@Column(name = "userName", unique=true)
	String userName;
	@Column(name = "password", nullable = false)
	String password;
	@Column(name = "name", nullable = false)
	String name;
	@Column(name = "email", nullable = false)
    String email;
	@Column(name = "address", nullable = false)
	String address;
	@Column(name = "phone", nullable = false)
	Long phone;
	@Column(name = "apartmentNumber", nullable = false)
	String apartmentNumber;
	@Column(name = "city", nullable = false)
	String city;
	@Column(name = "state", nullable = false)
	String state;
	@Column(name = "country", nullable = false)
	String country;
	@Column(name = "zipcode", nullable = false)
	Long zipcode;
	@Column(name = "active")
    Boolean active;
	@ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userId"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    Set<Role> roles;
}
