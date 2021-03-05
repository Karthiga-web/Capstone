package com.hcl.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import com.hcl.service.UserService;


@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
    private UserService userService;
	
	@Bean(name="passwordEncoder")
    public PasswordEncoder passwordencoder(){
     return new BCryptPasswordEncoder();
    }
	
	@Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userService);
        auth.setPasswordEncoder(passwordencoder());
        return auth;
    }

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
        .antMatchers("/").permitAll()
        .antMatchers("/login").permitAll()
        .antMatchers("/viewdetail/*").permitAll()
        .antMatchers("/product").permitAll()
        
        .antMatchers("/cart").hasRole("USER")
        .antMatchers("/receipt").hasRole("USER")
        .antMatchers("/success").hasRole("USER")
        .antMatchers("/productloggeduser").hasRole("USER")
        .antMatchers("/viewDetailloggeduser").hasRole("USER")
        .antMatchers("/cartRemove/*").hasRole("USER")
        
        .antMatchers("/adminCreateProduct").hasRole("ADMIN")
        .antMatchers("/adminCustomerManage").hasRole("ADMIN")
        .antMatchers("/adminHome").hasRole("ADMIN")
        .antMatchers("/adminProduct").hasRole("ADMIN")
        .antMatchers("/delete-user/*").hasRole("ADMIN")
        .antMatchers("/productForm").hasRole("ADMIN")
        .antMatchers("/admin-update/*").hasRole("ADMIN")
        .antMatchers("/admin-delete/*").hasRole("ADMIN")
        .antMatchers("/admin-new").hasRole("ADMIN")
        
        .and().csrf().disable()
        .formLogin()
        .loginPage("/login").failureUrl("/login?error=true")
        .defaultSuccessUrl("/")
        .usernameParameter("userName")
        .passwordParameter("password")
        .and().logout(logout -> logout  
        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
        .logoutSuccessUrl("/")                        
        .invalidateHttpSession(true)                                        
        ).exceptionHandling()
        .accessDeniedPage("/403");
	}

}
