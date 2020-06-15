package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.model.Categories_VO;
import com.example.demo.model.LoginVO;
import com.example.demo.repository.LoginRepo;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	@Lazy
	private LoginRepo loginrepo;
	
	@SuppressWarnings("unused")
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<LoginVO> list = new ArrayList<LoginVO>();
		list= this.loginrepo.findByUserName(username);
		System.out.println(list);
		LoginVO user=list.get(0);
		System.out.println(user.getUserName()+":::"+user.getPassword());
		if(user==null)
			{throw new UsernameNotFoundException("User name not Found");}
		
		return new UserPrincipal(user);
	}

}
