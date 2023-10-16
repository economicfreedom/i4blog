package com.i4.i4blog.config.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.i4.i4blog.repository.model.user.User;

import lombok.Getter;

@Getter
public class PrincipalDetails implements UserDetails {

	private User user;
	
	public PrincipalDetails(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        if(user.getUserRole() == 0) {
        	auth.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        } else {
        	auth.add(new SimpleGrantedAuthority("ROLE_USER"));
        }
        return auth;
	}

	@Override
	public String getPassword() {
		return user.getUserPassword();
	}

	@Override
	public String getUsername() {
		return user.getUserId();
	}

    // 계정이 만료 되었는지 (true: 만료X)
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

    // 계정이 잠겼는지 (true: 잠기지 않음)
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    // 비밀번호가 만료되었는지 (true: 만료X)
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    // 계정이 활성화(사용가능)인지 (true: 활성화)
    @Override
    public boolean isEnabled() {
        return true;
    }

}
