package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.example.demo.model.LoginVO;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public AuthenticationProvider authProvider()
	{
		DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
		return provider;
	}
	
	@Bean
	public LoginVO GetLoginVO()
	{
		return new LoginVO();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests().antMatchers(
					"/login",
					"/googlelogin"
					).permitAll()
			.and()
			.formLogin()
			.loginPage("/login").permitAll()
			.defaultSuccessUrl("/welcome")
			.and()
			.logout().invalidateHttpSession(true)
			.clearAuthentication(true)
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.logoutSuccessUrl("/").permitAll();
	}
	
}
//.authorizeRequests()
//.antMatchers(
//		"/register",
//    "/registerHandle",
//    "/processLogin",
//    "/js/**",			
//    "/css/**",
//    "/images/**",
//    "/vendors/**",
//    "/font-awesome/**",
//    "/webjars/**").permitAll()
//.anyRequest().authenticated()
//.and()
//.formLogin()
//.loginPage("/login")
//.permitAll()
//.and()
//.logout()
//.invalidateHttpSession(true)
//.clearAuthentication(true)
//.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//.logoutSuccessUrl("/login")
//.permitAll()
//.and().
//csrf().disable();

