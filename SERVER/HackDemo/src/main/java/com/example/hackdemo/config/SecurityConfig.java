package com.example.hackdemo.config;

import com.example.hackdemo.service.CustomOAuth2UserService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService) {
        this.customOAuth2UserService = customOAuth2UserService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/api/course/{id}/favorite").authenticated()
                        .requestMatchers("/api/course/favorites").authenticated()
                        .requestMatchers("/api/restaurant/{id}/favorite").authenticated()
                        .requestMatchers("/api/restaurant/favorites").authenticated()
                        .requestMatchers("/api/tourSpot/{id}/favorite").authenticated()
                        .requestMatchers("/api/tourSpot/favorites").authenticated()
                        .requestMatchers("/api/user/{userId}/favorites").authenticated()
                        .requestMatchers("/api/auth/google").permitAll()
                        .anyRequest().permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .userInfoEndpoint(userInfo -> userInfo
                                .userService(customOAuth2UserService)
                        )
                        .defaultSuccessUrl("/api/auth/login-success", true)
                )
                .exceptionHandling(handling -> handling
                        .authenticationEntryPoint((request, response, authException) -> {
                            response.setContentType("application/json");
                            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                            String jsonResponse = "{\"error\": \"권한이 없습니다.\"}";
                            response.getWriter().write(jsonResponse);
                        })
                )
                .csrf(csrf -> csrf.disable());

        return http.build();
    }
}