package com.example.hackdemo.service;

import com.example.hackdemo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private UserService userService;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);

        String email = oauth2User.getAttribute("email");
        String name = oauth2User.getAttribute("name");
        String imageUrl = oauth2User.getAttribute("picture");

        User user = userService.findOrCreateUser(email, name, imageUrl);

        return new OAuth2User() {
            @Override
            public Map<String, Object> getAttributes() {
                return oauth2User.getAttributes();
            }

            @Override
            public Collection<? extends GrantedAuthority> getAuthorities() {
                return oauth2User.getAuthorities();
            }

            @Override
            public String getName() {
                return user.getId().toString();
            }
        };
    }
}